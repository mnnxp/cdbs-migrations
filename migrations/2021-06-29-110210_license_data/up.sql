INSERT INTO license_ref (name, keyword, publication_at) VALUES
  ('MIT License', 'mit', now());

INSERT INTO license_permission_ref (id) VALUES
  (1),
  (2),
  (3),
  (4);

INSERT INTO license_permission_translate_list (permission_license_id, lang_id, permission) VALUES
  (1, 1, 'Commercial use'),
  (2, 1, 'Modification'),
  (3, 1, 'Distribution'),
  (4, 1, 'Private use'),
  (1, 2, 'Коммерческое использование'),
  (2, 2, 'Модификация'),
  (3, 2, 'Распространение'),
  (4, 2, 'Частное использование'),
  (1, 3, '商业使用'),
  (2, 3, '修改'),
  (3, 3, '分发'),
  (4, 3, '私人使用');

INSERT INTO permission_to_license (permission_id, license_id) VALUES
  (1,1),
  (2,1),
  (3,1),
  (4,1);

INSERT INTO license_limitation_ref (id) VALUES
  (1),
  (2);

INSERT INTO license_limitation_translate_list (limitation_license_id, lang_id, limitation) VALUES
  (1, 1, 'Liability'),
  (2, 1, 'Warranty'),
  (1, 2, 'Ответственность'),
  (2, 2, 'Гарантия'),
  (1, 3, '责任限制'),
  (2, 3, '担保免责');

INSERT INTO limitation_to_license (limitation_id, license_id) VALUES
  (1,1),
  (2,1);

INSERT INTO license_condition_ref (id) VALUES
  (1);

INSERT INTO license_condition_translate_list (condition_license_id, lang_id, condition) VALUES
  (1, 1, 'License and copyright notice'),
  (1, 2, 'Лицензия и уведомление об авторских правах'),
  (1, 3, '保留许可和版权声明');

INSERT INTO condition_to_license (condition_id, license_id) VALUES
  (1,1);
