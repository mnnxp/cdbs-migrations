
INSERT INTO service_ref (uuid,name,description,user_uuid,company_uuid,type_access_id,service_status_id,region_id,is_delete,created_at,updated_at) VALUES
  ('3c7805f5-f58e-418d-9285-6edc2c919649','New service 10511','Service non-metallic insert','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b','2cd385e1-8f7e-4908-8235-dfe42938b46d',1,1,7,false,'2021-01-01 00:00:00.000 +0300','2021-01-01 00:00:00.000 +0300');

INSERT INTO service_history_list (service_uuid, user_uuid, type_of_change_id, old_data, changed_at) VALUES
  ('3c7805f5-f58e-418d-9285-6edc2c919649', '31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 1, 'Комментарий к изменению', now());

INSERT INTO service_status_ref (id) VALUES
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
  (11);

INSERT INTO service_status_translate_list (service_status_id, lang_id, name) VALUES
  (1, 1, 'Created'),
  (2, 1, 'New'),
  (3, 1, 'Adjustment'),
  (4, 1, 'Processing'),
  (5, 1, 'Confirmed'),
  (6, 1, 'Awaiting payment'),
  (7, 1, 'In progress'),
  (8, 1, 'Delivery'),
  (9, 1, 'Executed'),
  (10, 1, 'Canceled'),
  (11, 1, 'Not accepted'),
  (1, 2, 'Создан'),
  (2, 2, 'Новый'),
  (3, 2, 'Корректировка'),
  (4, 2, 'Обрабатывается'),
  (5, 2, 'Подтверждён'),
  (6, 2, 'Ожидает оплаты'),
  (7, 2, 'В работе'),
  (8, 2, 'Доставка'),
  (9, 2, 'Выполнен'),
  (10, 2, 'Отменён'),
  (11, 2, 'Не принят'),
  (1, 3, '已创建'),
  (2, 3, '新订单'),
  (3, 3, '调整中'),
  (4, 3, '处理中'),
  (5, 3, '已确认'),
  (6, 3, '待支付'),
  (7, 3, '进行中'),
  (8, 3, '配送中'),
  (9, 3, '已完成'),
  (10, 3, '已取消'),
  (11, 3, '未接受');

INSERT INTO file_to_service (file_uuid,service_uuid) VALUES
  ('bc1c2151-86d0-4656-9c9d-d016dd584297','3c7805f5-f58e-418d-9285-6edc2c919649');

INSERT INTO spec_to_service (spec_id,service_uuid) VALUES
  (1,'3c7805f5-f58e-418d-9285-6edc2c919649');

INSERT INTO keyword_to_service (service_uuid,keyword_id) VALUES
  ('3c7805f5-f58e-418d-9285-6edc2c919649',8);

INSERT INTO param_to_service (service_uuid,param_id,value) VALUES
  ('3c7805f5-f58e-418d-9285-6edc2c919649',9,'1');

INSERT INTO discus_to_service (discussion_uuid, service_uuid) VALUES
  ('ed5baabe-7201-45d3-9ec8-e610839feb39', '3c7805f5-f58e-418d-9285-6edc2c919649');

INSERT INTO component_to_service (service_uuid,component_uuid) VALUES
  ('3c7805f5-f58e-418d-9285-6edc2c919649', 'a5953fd9-7393-4f1e-a899-06b5e159dbf1');