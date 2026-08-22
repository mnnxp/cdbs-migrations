/* Standard */
CREATE TABLE standard_ref (
  uuid UUID NOT NULL UNIQUE,
  parent_standard_uuid UUID NOT NULL, /* Parent standard */
  name VARCHAR(2000) NOT NULL, /* Standard name */
  description VARCHAR(50000) NOT NULL, /* Short description of the standard */
  publication_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Publication date */
  image_file_uuid UUID NOT NULL, /* Standard image */
  user_uuid UUID NOT NULL, /* Profile ID of the uploader of the standard */
  company_uuid UUID NOT NULL, /* Company that developed the standard ID */
  type_access_id INTEGER NOT NULL, /* Standard accessibility type */
  standard_status_id INTEGER NOT NULL, /* Status, e.g., "current", "archived", "discontinued" */
  is_delete BOOLEAN NOT NULL DEFAULT 'f', /* Standard deletion flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation/upload date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Update date */
  CONSTRAINT standard_ref_pk PRIMARY KEY (uuid)
);

/* Record of standard data changes */
CREATE TABLE standard_history_list (
  id SERIAL, /* Event ID */
  standard_uuid UUID NOT NULL, /* Standard ID related to the change */
  type_of_change_id INTEGER NOT NULL, /* Change ID (type of change) */
  user_uuid UUID NOT NULL, /* Profile ID related to the change */
  old_data TEXT NOT NULL, /* Updated data */
  changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Change date */
  CONSTRAINT standard_history_list_pk PRIMARY KEY (id)
);

/* Standard status */
CREATE TABLE standard_status_ref (
  id SERIAL, /* Status ID */
  CONSTRAINT standard_status_ref_pk PRIMARY KEY (id)
);

CREATE TABLE standard_status_translate_list (
  standard_status_id INTEGER NOT NULL, /* Status ID (duplicate) */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  name VARCHAR(100) NOT NULL, /* Translated name, e.g., "Standard published" */
  UNIQUE(lang_id, name),
  CONSTRAINT standard_status_translate_list_pk PRIMARY KEY (standard_status_id, lang_id)
);

/* Standard object/file */
CREATE TABLE file_to_standard (
  file_uuid UUID NOT NULL, /* Object/file ID */
  standard_uuid UUID NOT NULL, /* Standard ID */
  CONSTRAINT file_to_standard_pk PRIMARY KEY (file_uuid, standard_uuid)
);

/* Standard catalog */
CREATE TABLE spec_to_standard (
  spec_id INTEGER NOT NULL, /* Catalog position ID */
  standard_uuid UUID NOT NULL, /* Standard ID (duplicate) */
  CONSTRAINT spec_to_standard_pk PRIMARY KEY (spec_id, standard_uuid)
);

/* Keywords related to the standard (tagging) */
CREATE TABLE keyword_to_standard (
  standard_uuid UUID NOT NULL, /* Standard ID (duplicate) */
  keyword_id INTEGER NOT NULL, /* Keyword (tag) ID */
  CONSTRAINT keyword_to_standard_pk PRIMARY KEY (standard_uuid, keyword_id)
);
