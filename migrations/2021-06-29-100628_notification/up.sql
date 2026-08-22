/* Notification */
CREATE TABLE notification_ref (
  id SERIAL, /* Notification ID */
  notification VARCHAR(2000) NOT NULL, /* Notification name */
  degree_importance_id INTEGER NOT NULL, /* Notification importance level */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Publication date */
  CONSTRAINT notification_ref_pk PRIMARY KEY (id)
);

CREATE TABLE degree_importance_ref (
  id SERIAL, /* Notification ID */
  CONSTRAINT degree_importance_ref_pk PRIMARY KEY (id)
);

CREATE TABLE degree_importance_translate_list (
  degree_importance_id INTEGER NOT NULL, /* Notification ID */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  degree VARCHAR(50) NOT NULL, /* Importance level name in translation */
  UNIQUE(lang_id, degree),
  CONSTRAINT degree_importance_translate_list_pk PRIMARY KEY (degree_importance_id, lang_id)
);
