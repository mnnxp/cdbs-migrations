INSERT INTO component_ref (uuid,parent_component_uuid,name,description,image_file_uuid,user_uuid,type_access_id,component_type_id,actual_status_id,is_base,is_delete,created_at,updated_at) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1','a5953fd9-7393-4f1e-a899-06b5e159dbf1','Reduced shank bolts and screws with coarse thread','Continuously improve the product quality and applicability...','bc1c2151-86d0-4656-9c9d-d016dd584297','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b',1,1,1,true,false,'2021-01-01 00:00:00.000 +0300','2021-01-01 00:00:00.000 +0300');

INSERT INTO component_history_list (component_uuid, user_uuid, type_of_change_id, old_data, changed_at) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1', '31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 1, 'Комментарий к изменению', now());

INSERT INTO component_type_ref (id) VALUES
  (1),
  (2),
  (3);

INSERT INTO component_type_translate_list (component_type_id, lang_id, component_type) VALUES
  (1, 1, 'Standard part'),
  (2, 1, 'Custom'),
  (3, 1, 'Work'),
  (1, 2, 'Стандартное изделие'),
  (2, 2, 'Специальное изделие'),
  (3, 2, 'Работа'),
  (1, 3, '标准件'),
  (2, 3, '定制件'),
  (3, 3, '加工件');

INSERT INTO keyword_to_component (component_uuid,keyword_id) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1',1);

INSERT INTO param_to_component (component_uuid,param_id,value) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1',9,'1');

INSERT INTO supplier_to_component (component_uuid,company_uuid,description) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1','2cd385e1-8f7e-4908-8235-dfe42938b46d','Комментарий поставщика');

INSERT INTO discus_to_component (discussion_uuid, component_uuid) VALUES
  ('ed5baabe-7201-45d3-9ec8-e610839feb39', 'a5953fd9-7393-4f1e-a899-06b5e159dbf1');

INSERT INTO component_modification_list (uuid,component_uuid,parent_modification_uuid,modification_name,description,actual_status_id,is_delete,created_at,updated_at) VALUES
  ('aba22d59-4f6c-44a4-9a37-2d38f0e577a8','a5953fd9-7393-4f1e-a899-06b5e159dbf1','aba22d59-4f6c-44a4-9a37-2d38f0e577a8','Head style C - Type H','main modification',1,false,'2021-01-01 00:00:00.000 +0300','2021-01-01 00:00:00.000 +0300');

INSERT INTO param_to_modification (modification_uuid,param_id,value) VALUES
  ('aba22d59-4f6c-44a4-9a37-2d38f0e577a8',1,'1');

INSERT INTO file_to_component (file_uuid,component_uuid) VALUES
  ('bc1c2151-86d0-4656-9c9d-d016dd584297','a5953fd9-7393-4f1e-a899-06b5e159dbf1');

INSERT INTO file_to_modification (file_uuid,modification_uuid) VALUES
  ('bc1c2151-86d0-4656-9c9d-d016dd584297','aba22d59-4f6c-44a4-9a37-2d38f0e577a8');

INSERT INTO fileset_for_program (uuid,modification_uuid,program_id) VALUES
  ('5de37b5d-75af-4323-b5b4-2cf1e849baa2','aba22d59-4f6c-44a4-9a37-2d38f0e577a8',1);

INSERT INTO modification_file_from_fileset (fileset_uuid,file_uuid) VALUES
  ('5de37b5d-75af-4323-b5b4-2cf1e849baa2','3706d1a1-80ae-4367-be39-af7091373811');

INSERT INTO spec_to_component (spec_id,component_uuid) VALUES
  (487,'a5953fd9-7393-4f1e-a899-06b5e159dbf1');

INSERT INTO license_to_component (component_uuid, license_id) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1', 1);

INSERT INTO standard_to_component (standard_uuid,component_uuid) VALUES
  ('303ec2aa-2066-42e3-93fb-de4fb9344bcb','a5953fd9-7393-4f1e-a899-06b5e159dbf1');
