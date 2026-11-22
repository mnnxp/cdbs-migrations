BEGIN;

-- Recreate FKs without ON DELETE CASCADE (was cascading before)
ALTER TABLE extension_ref
  DROP CONSTRAINT extension_ref_fk0,
  ADD CONSTRAINT extension_ref_fk0 FOREIGN KEY (program_id) REFERENCES program_ref(id);
ALTER TABLE user_ref
  DROP CONSTRAINT user_ref_fk2,
  ADD CONSTRAINT user_ref_fk2 FOREIGN KEY (program_id) REFERENCES program_ref(id);
ALTER TABLE fileset_for_program
  DROP CONSTRAINT fileset_for_program_fk1,
  ADD CONSTRAINT fileset_for_program_fk1 FOREIGN KEY (program_id) REFERENCES program_ref(id);

-- extension_ref was only used in tests; reset all file bindings to Unknown (id = 1)
UPDATE file_ref SET id_ext = 1 WHERE id_ext > 1;

-- Add new format
INSERT INTO program_ref (name) VALUES ('3MF') ON CONFLICT (name) DO NOTHING;

-- Keep only the Unknown row (id = 1)
DELETE FROM extension_ref WHERE id > 1;

-- Enforce uniqueness of (extension, program_id)
ALTER TABLE extension_ref ADD CONSTRAINT extension_ref_extension_program_id_key UNIQUE (extension, program_id);

-- Reset the id sequence to the current max
SELECT setval(
  pg_get_serial_sequence('extension_ref', 'id'),
  (SELECT COALESCE(MAX(id), 1) FROM extension_ref)
);

-- Ensure the Unknown row exists (id = 1)
UPDATE extension_ref SET extension = 'unknown', program_id = 1 WHERE id = 1;

-- Curated extension -> program mapping
INSERT INTO extension_ref (extension, program_id) VALUES
  -- IFC (BIM)
  ('ifc', 1), ('ifczip', 1), ('ifcxml', 1),
  -- STEP
  ('step', 1), ('stp', 1), ('stpz', 1),
  -- STL
  ('stl', 1),
  -- OBJ
  ('obj', 1), ('mtl', 1),
  -- GLTF / GLB
  ('gltf', 1), ('glb', 1),
  -- COLLADA
  ('dae', 1),
  -- GCODE
  ('gcode', 1), ('nc', 1), ('tap', 1), ('ncc', 1), ('cnc', 1),
  -- OFF (Object File Format)
  ('off', 1),
  -- DXF / DWG
  ('dwg', 1), ('dxf', 1),
  -- Other
  ('pdf', 1), ('zip', 1), ('7z', 1), ('rar', 1),
  ('igs', 1), ('iges', 1), -- IGES
  ('x_t', 1), ('x_b', 1),  -- Parasolid
  -- Image viewer
  ('apng',2), ('avif',2), ('gif',2), ('jpg',2), ('jpeg',2), ('jfif',2), ('png',2), ('svg',2), ('webp',2),
  -- AutoCAD
  ('dwg',3), ('dxf',3), ('dwt',3), ('dws',3),
  -- BricsCAD
  ('dwg',4), ('dxf',4), ('a2c',4), ('apt',4),
  -- CATIA
  ('catpart',5), ('catproduct',5), ('cgr',5), ('3dxml',5),
  -- nanoCAD
  ('dwg',6), ('dxf',6),
  -- Creo
  ('prt',8), ('asm',8), ('drw',8), ('frm',8), ('sec',8),
  -- DraftSight
  ('dwg',10), ('dxf',10),
  -- KiCad
  ('kicad_pcb',14), ('kicad_sch',14), ('kicad_pro',14),
  -- GstarCAD
  ('dwg',15), ('dxf',15),
  -- Inventor
  ('ipt',19), ('iam',19), ('idw',19), ('ipn',19),
  -- КОМПАС-3D
  ('cdw',22), ('frw',22), ('a3d',22), ('m3d',22), ('spw',22), ('kdw',22), ('t3d',22),
  -- Maya
  ('ma',27), ('mb',27),
  -- Revit
  ('rvt',30), ('rfa',30), ('rte',30),
  -- SketchUp
  ('skp',31),
  -- Solid Edge
  ('par',32), ('asm',32), ('psm',32), ('dft',32),
  -- SOLIDWORKS
  ('sldprt',33), ('sldasm',33), ('slddrw',33),
  -- FreeCAD
  ('fcstd',42),
  -- ZWCAD
  ('dwg',50), ('dxf',50),
  -- ZW3D
  ('z3',51),
  -- SolveSpace
  ('slvs',52),
  -- Blender
  ('blend',53),
  -- CypCut
  ('cyp',55);

COMMIT;
