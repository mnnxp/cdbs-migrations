INSERT INTO program_ref (name) VALUES
  ('Unknown'),
  ('Image viewer'),
  ('AutoCAD'),
  ('BricsCAD'),
  ('CATIA'),
  ('nanoCAD'),
  ('COLLADA'),
  ('Creo'),
  ('PKPM'),
  ('DraftSight'),
  ('DXF'),
  ('DWG'),
  ('IFC'),
  ('KiCad'),
  ('GstarCAD'),
  ('HiCAD'),
  ('Glodon'),
  ('ArchiCAD'),
  ('Inventor'),
  ('YJK'),
  ('IRONCAD'),
  ('КОМПАС-3D'),
  ('HSC CAD'),
  ('NX'),
  ('OBJ'),
  ('OFF'),
  ('Maya'),
  ('Estlcam'),
  ('ADEM'),
  ('Revit'),
  ('SketchUp'),
  ('Solid Edge'),
  ('SOLIDWORKS'),
  ('SpaceClaim'),
  ('STEP'),
  ('Renga'),
  ('SINOVATION'),
  ('STL'),
  ('T-FLEX'),
  ('Tekla'),
  ('GeoniCS'),
  ('FreeCAD'),
  ('TopSolid'),
  ('TurboCAD'),
  ('PCCAD'),
  ('Vectorworks'),
  ('CAXA CAD'),
  ('ЛИРА-САПР'),
  ('SEMA'),
  ('ZWCAD'),
  ('ZW3D'),
  ('SolveSpace'),
  ('Blender'),
  ('GCODE'),
  ('CypCut'),
  ('GLTF'),
  ('3MF');

INSERT INTO extension_ref (extension, program_id) VALUES
  ('unknown',1),
  -- IFC (BIM)
  ('ifc',1), ('ifczip',1), ('ifcxml',1),
  -- STEP
  ('step',1), ('stp',1), ('stpz',1),
  -- STL
  ('stl',1),
  -- OBJ
  ('obj',1), ('mtl',1),
  -- GLTF/GLB
  ('gltf',1), ('glb',1),
  -- COLLADA
  ('dae',1),
  -- GCODE
  ('gcode',1), ('nc',1), ('tap',1), ('ncc',1), ('cnc',1),
  -- OFF (Object File Format)
  ('off',1),
  -- DWG/DXF
  ('dwg',1), ('dxf',1),
  -- Other
  ('pdf',1), ('zip',1), ('7z',1), ('rar',1),
  ('igs',1), ('iges',1), -- IGES
  ('x_t',1), ('x_b',1),  -- Parasolid
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

INSERT INTO commit_ref (uuid, commit_msg) VALUES
  ('661d9005-a1bc-452f-baa5-5b64be5a60bb', '');

INSERT INTO actual_status_ref (id) VALUES
  (1),
  (2),
  (3),
  (4),
  (5);

INSERT INTO actual_status_translate_list (actual_status_id, lang_id, name) VALUES
  (1, 1, 'Preparation'),
  (2, 1, 'Development'),
  (3, 1, 'Testing'),
  (4, 1, 'Production'),
  (5, 1, 'Decommissioned'),
  (1, 2, 'Подготовка'),
  (2, 2, 'Разработка'),
  (3, 2, 'Тестирование'),
  (4, 2, 'Производство'),
  (5, 2, 'Выведено из эксплуатации'),
  (1, 3, '准备阶段'),    -- Preparation
  (2, 3, '开发阶段'),    -- Development
  (3, 3, '测试阶段'),    -- Testing
  (4, 3, '生产阶段'),    -- Production
  (5, 3, '已退役');      -- Decommissioned

INSERT INTO type_access_ref (id) VALUES
  (1),
  (2),
  (3);

INSERT INTO type_access_translate_list (type_access_id, lang_id, name) VALUES
  (1, 1, 'Private'),
  (2, 1, 'Protected'),
  (3, 1, 'Public'),
  (1, 2, 'Приватный'),
  (2, 2, 'Защищённый'),
  (3, 2, 'Публичный'),
  (1, 3, '私有'),
  (2, 3, '受保护'),
  (3, 3, '公开');

INSERT INTO param_ref (id) VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10),
  (11),
  (12);

INSERT INTO param_translate_list (param_id, lang_id, paramname) VALUES
  (1, 1, 'Index'),
  (2, 1, 'Selector'),
  (3, 1, 'Part Number'),
  (4, 1, 'Description'),
  (5, 1, 'E-Link'),
  (6, 1, 'Material'),
  (7, 1, 'Finish'),
  (8, 1, 'Article Number'),
  (9, 1, 'Nominal Ø'),
  (10, 1, 'Pitch (mm)'),
  (11, 1, 'Length (mm)'),
  (12, 1, 'Head height (mm)'),
  (1, 2, 'Индекс'),
  (2, 2, 'Селектор'),
  (3, 2, 'Номер части'),
  (4, 2, 'Описание'),
  (5, 2, 'Электронная ссылка'),
  (6, 2, 'Материал'),
  (7, 2, 'Заканчивать'),
  (8, 2, 'Номер статьи'),
  (9, 2, 'Номинальный Ø'),
  (10, 2, 'Шаг (мм)'),
  (11, 2, 'Длина (мм)'),
  (12, 2, 'Высота головки (мм)');

INSERT INTO language_ref (lang, langshort) VALUES
  ('English', 'EN'),
  ('Русский', 'RU'),
  ('中文', 'ZH');

INSERT INTO region_ref (id) VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9),
  (10),
  (11),
  (12),
  (13);

INSERT INTO region_translate_list (region_id, lang_id, region) VALUES
  (1, 1, 'Africa'),
  (2, 1, 'Australia'),
  (3, 1, 'Asia & Pacific'),
  (4, 1, 'Europe'),
  (5, 1, 'Middle east'),
  (6, 1, 'North America'),
  (7, 1, 'South/Latin America'),
  (8, 1, 'Other'),
  (9, 1, 'Antarctica'),
  (10, 1, 'Oceania'),
  (1, 2, 'Африка'),
  (2, 2, 'Австралия'),
  (3, 2, 'Азия и Тихий океан'),
  (4, 2, 'Европа'),
  (5, 2, 'Ближний Восток'),
  (6, 2, 'Северная Америка'),
  (7, 2, 'Южная/Латинская Америка'),
  (8, 2, 'Другой'),
  (9, 2, 'Антарктида'),
  (10, 2, 'Океания'),
  (11, 1, 'Eurasia'),
  (11, 2, 'Евразия'),
  (1, 3, '非洲'),
  (2, 3, '澳洲'),
  (3, 3, '亚太地区'),
  (4, 3, '欧洲'),
  (5, 3, '中东地区'),
  (6, 3, '北美洲'),
  (7, 3, '拉丁美洲'),
  (8, 3, '其他地区'),
  (9, 3, '南极洲'),
  (10, 3, '大洋洲'),
  (11, 3, '欧亚大陆');

INSERT INTO type_of_change_ref (id) VALUES
  (1);

INSERT INTO type_of_change_translate_list (type_of_change_id, lang_id, type_of_change) VALUES
  (1, 1, 'data update'),
  (1, 2, 'обновление данных'),
  (1, 3, '数据更新');

INSERT INTO spec_ref (id, parent_spec_id, path, depth) VALUES
  (1, 1, '1', 1);

INSERT INTO spec_translate_list (spec_id, lang_id, spec) VALUES
  (1, 1, 'ROOT'),
  (1, 2, 'КОРЕНЬ'),
  (1, 3, '根节点');


INSERT INTO keyword_ref (keyword) VALUES
  ('tools'),
  ('bolt'),
  ('screw'),
  ('automotive'),
  ('autodesk'),
  ('fusion'),
  ('tech'),
  ('iso'),
  ('1'),
  ('3'),
  ('543'),
  ('62'),
  ('42'),
  ('asd11'),
  ('46'),
  ('48'),
  ('6'),
  ('34'),
  ('frwe'),
  ('qqd'),
  ('vte'),
  ('dsvsd'),
  ('sd'),
  ('aas'),
  ('test'),
  ('component'),
  ('no-base'),
  ('#bolts'),
  ('splints'),
  ('ГОСТ'),
  ('GOST'),
  ('397-79'),
  ('motor'),
  ('gear'),
  ('T'),
  ('V'),
  ('VR'),
  ('M'),
  ('E'),
  ('K'),
  ('R'),
  ('D'),
  ('Y'),
  ('2E160'),
  ('shank'),
  ('bolts'),
  ('and'),
  ('screws');
