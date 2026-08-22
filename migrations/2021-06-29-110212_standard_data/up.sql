
INSERT INTO standard_ref (uuid,parent_standard_uuid,name,description,publication_at,image_file_uuid,user_uuid,company_uuid,type_access_id,standard_status_id,is_delete,created_at,updated_at) VALUES
  ('303ec2aa-2066-42e3-93fb-de4fb9344bcb','303ec2aa-2066-42e3-93fb-de4fb9344bcb','Prevailing torque type hexagon thin nuts (with non-metallic insert)','ISO 10511:2012 specifies the characteristics of prevailing torque type hexagon thin nuts (with non-metallic insert) with thread from M3 up to and including M36, in product grade A for threads up to and including M16 and product grade B for threads above M16, and with property classes 04 and 05.','2021-01-01 00:00:00.000 +0300','3706d1a1-80ae-4367-be39-af7091373811','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b','2cd385e1-8f7e-4908-8235-dfe42938b46d',1,1,false,'2021-01-01 00:00:00.000 +0300','2021-01-01 00:00:00.000 +0300');

INSERT INTO standard_history_list (standard_uuid, user_uuid, type_of_change_id, old_data, changed_at) VALUES
  ('303ec2aa-2066-42e3-93fb-de4fb9344bcb','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 1, 'Комментарий к изменению', now());

INSERT INTO standard_status_ref (id) VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8),
  (9);

INSERT INTO standard_status_translate_list (standard_status_id, lang_id, name) VALUES
  (1, 1, 'Preliminary'),
  (2, 1, 'Proposal'),
  (3, 1, 'Preparatory'),
  (4, 1, 'Committee'),
  (5, 1, 'Enquiry'),
  (6, 1, 'Approval'),
  (7, 1, 'Publication'),
  (8, 1, 'Review'),
  (9, 1, 'Withdrawal'),
  (1, 2, 'Предварительно'),
  (2, 2, 'Внесение'),
  (3, 2, 'Изучение'),
  (4, 2, 'Подготовка'),
  (5, 2, 'Рассмотрение'),
  (6, 2, 'Принятие'),
  (7, 2, 'Опубликован'),
  (8, 2, 'Пересмотрен'),
  (9, 2, 'Отозван'),
  (1, 3, '预研阶段'),
  (2, 3, '提案阶段'),
  (3, 3, '起草阶段'),
  (4, 3, '委员会阶段'),
  (5, 3, '征询意见'),
  (6, 3, '批准阶段'),
  (7, 3, '出版发行'),
  (8, 3, '复审阶段'),
  (9, 3, '撤销作废');

INSERT INTO file_to_standard (file_uuid,standard_uuid) VALUES
  ('bc1c2151-86d0-4656-9c9d-d016dd584297','303ec2aa-2066-42e3-93fb-de4fb9344bcb');

INSERT INTO spec_to_standard (spec_id,standard_uuid) VALUES
  (1,'303ec2aa-2066-42e3-93fb-de4fb9344bcb');

INSERT INTO keyword_to_standard (standard_uuid,keyword_id) VALUES
  ('303ec2aa-2066-42e3-93fb-de4fb9344bcb',8);
