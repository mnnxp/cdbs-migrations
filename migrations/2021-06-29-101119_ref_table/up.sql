/* List of CAD and other programs */
CREATE TABLE program_ref (
  id SERIAL UNIQUE, /* Software name ID */
  name VARCHAR(225) NOT NULL UNIQUE, /* CAD name (program name) */
  CONSTRAINT program_ref_pk PRIMARY KEY (id)
);

/* Table mapping programs to file extensions */
CREATE TABLE extension_ref (
  id SERIAL UNIQUE, /* Mapping ID */
  extension VARCHAR(50) NOT NULL, /* File extension, one extension can belong to multiple programs */
  program_id INTEGER NOT NULL, /* Corresponding program (CAD) */
  CONSTRAINT extension_ref_pk PRIMARY KEY (id)
);

/* File information */
CREATE TABLE file_ref (
  uuid UUID NOT NULL UNIQUE, /* Object/file ID */
  parent_file_uuid UUID NOT NULL, /* Parent object/file ID */
  revision INTEGER NOT NULL DEFAULT 1, /* Revision (version) number of the file */
  commit_uuid UUID NOT NULL, /* Comment ID for the file */
  hash BYTEA NOT NULL, /* Object/file hash value */
  sha256_hash BYTEA NOT NULL, /* SHA256 hash value of the object/file */
  user_uuid UUID NOT NULL, /* Profile ID of the uploader */
  filename VARCHAR(500) NOT NULL, /* File name */
  content_type VARCHAR(50) NOT NULL, /* Content type in the file */
  id_ext INTEGER NOT NULL, /* File extension (used to determine CAD) */
  filesize BIGINT NOT NULL, /* File size */
  path_file VARCHAR(225) NOT NULL, /* File path */
  is_checked BOOLEAN NOT NULL DEFAULT 'f', /* File check flag after upload */
  is_hidden BOOLEAN NOT NULL DEFAULT 'f', /* File hidden flag (obsolete version) */
  is_delete BOOLEAN NOT NULL DEFAULT 'f', /* Flag for deleting the file from storage */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation/upload date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Update date */
  CONSTRAINT file_ref_pk PRIMARY KEY (uuid)
);

/* Comment */
CREATE TABLE commit_ref (
  uuid UUID NOT NULL UNIQUE,
  commit_msg VARCHAR(500) NOT NULL, /* Comment on change */
  CONSTRAINT commit_ref_pk PRIMARY KEY (uuid)
);

/* Component status */
CREATE TABLE actual_status_ref (
  id SERIAL, /* Status ID */
  CONSTRAINT actual_status_ref_pk PRIMARY KEY (id)
);

CREATE TABLE actual_status_translate_list (
  actual_status_id INTEGER NOT NULL, /* Status ID */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  name VARCHAR(100) NOT NULL UNIQUE, /* For example: "current", "archived", "discontinued" */
  UNIQUE(lang_id, name),
  CONSTRAINT actual_status_translate_list_pk PRIMARY KEY (actual_status_id, lang_id)
);

/* Access types */
CREATE TABLE type_access_ref (
  id SERIAL, /* Access type ID */
  CONSTRAINT type_access_ref_pk PRIMARY KEY (id)
);

CREATE TABLE type_access_translate_list (
  type_access_id INTEGER NOT NULL, /* Access type ID */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  name VARCHAR(100) NOT NULL, /* Access name */
  UNIQUE(lang_id, name),
  CONSTRAINT type_access_translate_list_pk PRIMARY KEY (type_access_id, lang_id)
);

/* Translation languages */
CREATE TABLE language_ref (
  id SERIAL UNIQUE, /* Language ID */
  lang VARCHAR(100) NOT NULL UNIQUE, /* Full language name */
  langshort VARCHAR(10) NOT NULL UNIQUE, /* Short language name */
  CONSTRAINT language_ref_pk PRIMARY KEY (id)
);

/* Modification parameters */
CREATE TABLE param_ref (
  id SERIAL, /* Parameter (characteristics) ID */
  CONSTRAINT param_ref_pk PRIMARY KEY (id)
);

CREATE TABLE param_translate_list (
  param_id INTEGER NOT NULL, /* Parameter (characteristics) ID */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  paramname VARCHAR(255) NOT NULL, /* Modification parameter name in translation */
  UNIQUE(lang_id, paramname),
  CONSTRAINT param_translate_list_pk PRIMARY KEY (param_id, lang_id)
);

/* Region */
CREATE TABLE region_ref (
  id SERIAL, /* Region name ID */
  CONSTRAINT region_ref_pk PRIMARY KEY (id)
);

CREATE TABLE region_translate_list (
  region_id INTEGER NOT NULL, /* Region name ID */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  region VARCHAR(100) NOT NULL, /* Region name in translation */
  UNIQUE(lang_id, region),
  CONSTRAINT region_translate_list_pk PRIMARY KEY (region_id, lang_id)
);

/* List of change types */
CREATE TABLE type_of_change_ref (
  id SERIAL, /* Change type ID */
  CONSTRAINT type_of_change_ref_pk PRIMARY KEY (id)
);

CREATE TABLE type_of_change_translate_list (
  type_of_change_id INTEGER NOT NULL, /* Change type ID */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  type_of_change VARCHAR(100) NOT NULL, /* Change name */
  CONSTRAINT type_of_change_translate_list_pk PRIMARY KEY (type_of_change_id, lang_id)
);

/* Categories (catalog) */
CREATE TABLE spec_ref (
  id SERIAL, /* Catalog category ID */
  parent_spec_id INTEGER NOT NULL DEFAULT 1, /* Parent catalog ID */
  path VARCHAR(255) NOT NULL DEFAULT '1', /* Hierarchy storage in one string (materialized path) */
  depth INTEGER NOT NULL DEFAULT 1, /* Section depth */
  UNIQUE(id, parent_spec_id),
  CONSTRAINT spec_ref_pk PRIMARY KEY (id),
  CONSTRAINT spec_ref_path_check CHECK (path = id::VARCHAR OR RIGHT(path, LENGTH(id::VARCHAR) + 1) = '.' || id::VARCHAR),
  CONSTRAINT spec_ref_no_self_ref CHECK (id != parent_spec_id OR id = 1)
);
CREATE INDEX idx_spec_ref_parent_id ON spec_ref(parent_spec_id); /* Index for foreign key */
CREATE INDEX idx_spec_ref_path ON spec_ref(path); /* Index for path */

CREATE TABLE spec_translate_list (
  spec_id INTEGER NOT NULL, /* Catalog category ID */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  spec VARCHAR(225) NOT NULL, /* Catalog name in translation */
  UNIQUE(spec_id, lang_id, spec),
  CONSTRAINT spec_translate_list_pk PRIMARY KEY (spec_id, lang_id)
);

/* Keywords (tagging) */
CREATE TABLE keyword_ref (
  id SERIAL UNIQUE, /* Tag ID */
  keyword VARCHAR(50) NOT NULL UNIQUE, /* Keyword */
  CONSTRAINT keyword_ref_pk PRIMARY KEY (id)
);

/* Presigned URLs for accessing objects in storage */
CREATE TABLE presigned_url_ref (
  file_uuid UUID NOT NULL UNIQUE, /* Object/file ID */
  presigned_url VARCHAR(1024) NOT NULL, /* Access URL to the file */
  expiration_at TIMESTAMPTZ NOT NULL, /* Access expiry date */
  CONSTRAINT presigned_url_ref_pk PRIMARY KEY (file_uuid)
);
