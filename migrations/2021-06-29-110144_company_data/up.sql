INSERT INTO company_ref (uuid,orgname,shortname,inn,phone,email,description,address,site_url,time_zone,user_uuid,image_file_uuid,region_id,company_type_id,type_access_id,is_supplier,is_email_verified,is_enabled,is_delete,created_at,updated_at) VALUES
  ('2cd385e1-8f7e-4908-8235-dfe42938b46d','Test Company Alpha','TCA','1234567891','+70000000000','test@example.com','description for this company','Moscow','https://cadbase.ru','Europe/Moscow','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b','bc1c2151-86d0-4656-9c9d-d016dd584297',1,1,3,true,true,true,false,'2021-01-01 00:00:00.000 +0300','2021-01-01 00:00:00.000 +0300');

INSERT INTO company_type_ref (id) VALUES
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

INSERT INTO company_type_translate_list (company_type_id, lang_id, name, shortname) VALUES
  -- International terms
  (1, 1, 'Limited Liability Company', 'LLC'),
  (2, 1, 'Individual Entrepreneur', 'IE'),
  (3, 1, 'State-Owned Enterprise', 'SOE'),
  (4, 1, 'Public Joint Stock Company', 'PJSC'),
  (5, 1, 'Joint Stock Company', 'JSC'),
  (6, 1, 'Foreign Enterprise', 'FE'),
  (7, 1, 'Limited Partnership', 'LP'),
  (8, 1, 'General Partnership', 'GP'),
  (9, 1, 'Production Cooperative', 'Co-op'),
  (10, 1, 'Non-Profit Organization', 'NPO'),
  (11, 1, 'Branch Office', 'Branch'),
  (12, 1, 'Representative Office', 'Rep Office'),
  -- Specifics of the Russian Federation
  (1, 2, 'Общество с ограниченной ответственностью', 'ООО'),
  (2, 2, 'Индивидуальный предприниматель', 'ИП'),
  (3, 2, 'Государственное предприятие', 'ГП'),
  (4, 2, 'Публичное акционерное общество', 'ПАО'),
  (5, 2, 'Акционерное общество', 'АО'),
  (6, 2, 'Иностранное предприятие', 'ИПи'),
  (7, 2, 'Коммандитное товарищество', 'КТ'),
  (8, 2, 'Полное товарищество', 'ПТ'),
  (9, 2, 'Производственный кооператив', 'ПрК'),
  (10, 2, 'Некоммерческая организация', 'НКО'),
  (11, 2, 'Филиал', 'Фил'),
  (12, 2, 'Представительство', 'Предст'),
  -- Specifics of the People's Republic of China
  (1, 3, '有限责任公司', '有限公司'),
  (2, 3, '个体工商户', '个体户'),
  (3, 3, '国有企业', '国企'),
  (4, 3, '上市公司', '上市公司'),
  (5, 3, '股份有限公司', '股份公司'),
  (6, 3, '外商投资企业', '外企'),
  (7, 3, '有限合伙企业', '有限合伙'),
  (8, 3, '普通合伙企业', '普通合伙'),
  (9, 3, '农民专业合作社', '合作社'),
  (10, 3, '非营利组织', '非营利'),
  (11, 3, '分公司', '分公司'),
  (12, 3, '代表处', '代表处');

INSERT INTO company_represent_ref (uuid,company_uuid,region_id,representation_type_id,name,address,phone) VALUES
  ('22a08149-b63a-4f65-a1cd-4a28f85567ec','2cd385e1-8f7e-4908-8235-dfe42938b46d',1,1,'Местный офис','г. Москва','+70000000000');

INSERT INTO company_member_list (company_uuid, user_uuid, role_id, is_enabled, created_at, updated_at) VALUES
  ('2cd385e1-8f7e-4908-8235-dfe42938b46d', '31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 5, 't', now(), now());

INSERT INTO spec_to_company (spec_id,company_uuid) VALUES
  (2,'2cd385e1-8f7e-4908-8235-dfe42938b46d');

INSERT INTO company_history_list (company_uuid, user_uuid, type_of_change_id, old_data, changed_at) VALUES
  ('2cd385e1-8f7e-4908-8235-dfe42938b46d', '31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 1, 'Комментарий к изменению', now());

INSERT INTO discus_to_company (discussion_uuid, company_uuid) VALUES
  ('ed5baabe-7201-45d3-9ec8-e610839feb39', '2cd385e1-8f7e-4908-8235-dfe42938b46d');

INSERT INTO representation_type_ref (id) VALUES
  (1),
  (2),
  (3);

INSERT INTO representation_type_translate_list (representation_type_id, lang_id, representation_type) VALUES
  (1, 1, 'office'),
  (2, 1, 'branch'),
  (3, 1, 'factory'),
  (1, 2, 'офис'),
  (2, 2, 'филиал'),
  (3, 2, 'завод'),
  (1, 3, '办事处'),
  (2, 3, '分公司'),
  (3, 3, '工厂');

INSERT INTO role_member_list (id, company_uuid) VALUES
  (1,'2cd385e1-8f7e-4908-8235-dfe42938b46d');

INSERT INTO role_member_translate_list (role_member_id, lang_id, name) VALUES
  (1, 1, 'Trainee'),
  (2, 1, 'Designer'),
  (3, 1, 'Engineer'),
  (4, 1, 'Constructor'),
  (5, 1, 'Architect'),
  (1, 2, 'Стажер'),
  (2, 2, 'Дизайнер'),
  (3, 2, 'Инженер'),
  (4, 2, 'Конструктор'),
  (5, 2, 'Архитектор'),
  (1, 3, '实习生'),
  (2, 3, '设计师'),
  (3, 3, '工程师'),
  (4, 3, '结构工程师'),
  (5, 3, '建筑师');

INSERT INTO role_access (role_id, type_access_id) VALUES
  (1, 3);

INSERT INTO company_access_to_component (component_uuid,company_uuid,type_access_id,is_enabled,created_at,updated_at) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1','2cd385e1-8f7e-4908-8235-dfe42938b46d',1,true,'2021-01-01 00:00:00.000 +0300','2021-01-01 00:00:00.000 +0300');

INSERT INTO company_access_to_standard (standard_uuid, company_uuid, type_access_id, is_enabled, created_at, updated_at) VALUES
  ('303ec2aa-2066-42e3-93fb-de4fb9344bcb', '2cd385e1-8f7e-4908-8235-dfe42938b46d', 1, 't', now(), now());

INSERT INTO company_access_to_service (service_uuid, company_uuid, type_access_id, is_enabled, created_at, updated_at) VALUES
  ('3c7805f5-f58e-418d-9285-6edc2c919649', '2cd385e1-8f7e-4908-8235-dfe42938b46d', 1, 't', now(), now());

INSERT INTO company_certificate_ref (file_uuid,company_uuid,description) VALUES
  ('bc1c2151-86d0-4656-9c9d-d016dd584297','2cd385e1-8f7e-4908-8235-dfe42938b46d','company certificate');
