INSERT INTO notification_ref (notification,degree_importance_id,created_at) VALUES
  ('warning, this is 1th notification',5,'2021-01-01 00:00:00.000 +0300');

INSERT INTO degree_importance_ref (id) VALUES
  (1),
  (2),
  (3),
  (4),
  (5);

INSERT INTO degree_importance_translate_list (degree_importance_id, lang_id, degree) VALUES
  (1, 1, 'critical'),
  (2, 1, 'error'),
  (3, 1, 'warning'),
  (4, 1, 'success'),
  (5, 1, 'info'),
  (1, 2, 'критический'),
  (2, 2, 'ошибка'),
  (3, 2, 'предупреждение'),
  (4, 2, 'успех'),
  (5, 2, 'информация'),
  (1, 3, '严重'),
  (2, 3, '错误'),
  (3, 3, '警告'),
  (4, 3, '成功'),
  (5, 3, '信息');
