/* Licenses */
CREATE TABLE license_ref (
  id SERIAL, /* License ID */
  name VARCHAR(225) NOT NULL UNIQUE, /* License name */
  keyword VARCHAR(50) NOT NULL UNIQUE, /* License keyword */
  publication_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Publication date */
  CONSTRAINT license_ref_pk PRIMARY KEY (id)
);

/* Permissions */
CREATE TABLE license_permission_ref (
  id SERIAL, /* Status ID */
  CONSTRAINT license_permission_ref_pk PRIMARY KEY (id)
);

CREATE TABLE license_permission_translate_list (
  permission_license_id INTEGER NOT NULL, /* Status ID (duplicate) */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  permission VARCHAR(225) NOT NULL, /* Permission name */
  UNIQUE (lang_id, permission),
  CONSTRAINT license_permission_translate_list_pk PRIMARY KEY (
    permission_license_id,
    lang_id
  )
);

/* Permissions for the license */
CREATE TABLE permission_to_license (
  permission_id INTEGER NOT NULL, /* Permission ID */
  license_id INTEGER NOT NULL, /* License ID */
  CONSTRAINT permission_to_license_pk PRIMARY KEY (permission_id, license_id)
);

/* Restrictions */
CREATE TABLE license_limitation_ref (
  id SERIAL, /* Status ID */
  CONSTRAINT license_limitation_ref_pk PRIMARY KEY (id)
);

CREATE TABLE license_limitation_translate_list (
  limitation_license_id INTEGER NOT NULL, /* Status ID (duplicate) */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  limitation VARCHAR(225) NOT NULL, /* Permission name */
  UNIQUE (lang_id, limitation),
  CONSTRAINT license_limitation_translate_list_pk PRIMARY KEY (
    limitation_license_id,
    lang_id
  )
);

/* Restrictions for the license */
CREATE TABLE limitation_to_license (
  limitation_id INTEGER NOT NULL, /* Restriction ID */
  license_id INTEGER NOT NULL, /* License ID */
  CONSTRAINT limitation_to_license_pk PRIMARY KEY (limitation_id, license_id)
);

/* Conditions */
CREATE TABLE license_condition_ref (
  id SERIAL, /* Status ID */
  CONSTRAINT license_condition_ref_pk PRIMARY KEY (id)
);

CREATE TABLE license_condition_translate_list (
  condition_license_id INTEGER NOT NULL, /* Status ID (duplicate) */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  condition VARCHAR(225) NOT NULL, /* Permission name */
  UNIQUE (lang_id, condition),
  CONSTRAINT license_condition_translate_list_pk PRIMARY KEY (
    condition_license_id,
    lang_id
  )
);

/* Conditions for the license */
CREATE TABLE condition_to_license (
  condition_id INTEGER NOT NULL, /* Condition ID */
  license_id INTEGER NOT NULL, /* License ID */
  CONSTRAINT condition_to_license_pk PRIMARY KEY (condition_id, license_id)
);
