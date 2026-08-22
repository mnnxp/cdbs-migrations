/* Service */
CREATE TABLE service_ref (
  uuid UUID NOT NULL UNIQUE,
  name VARCHAR(2000) NOT NULL, /* Service name */
  description VARCHAR(50000) NOT NULL, /* Short description of the service */
  user_uuid UUID NOT NULL, /* Profile ID of the creator of the service */
  company_uuid UUID NOT NULL, /* Company that developed the service ID */
  type_access_id INTEGER NOT NULL, /* Service accessibility type */
  service_status_id INTEGER NOT NULL, /* Status, e.g., "created", "in progress", "completed" */
  region_id INTEGER NOT NULL, /* Region */
  is_delete BOOLEAN NOT NULL DEFAULT 'f', /* Service deletion flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Update date */
  CONSTRAINT service_ref_pk PRIMARY KEY (uuid)
);

/* Record of service data changes */
CREATE TABLE service_history_list (
  id SERIAL, /* Event ID */
  service_uuid UUID NOT NULL, /* Service ID related to the change */
  type_of_change_id INTEGER NOT NULL, /* Change ID (type of change) */
  user_uuid UUID NOT NULL, /* Profile ID related to the change */
  old_data TEXT NOT NULL, /* Updated data */
  changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Change date */
  CONSTRAINT service_history_list_pk PRIMARY KEY (id)
);

/* Service status */
CREATE TABLE service_status_ref (
  id SERIAL, /* Status ID */
  CONSTRAINT service_status_ref_pk PRIMARY KEY (id)
);

CREATE TABLE service_status_translate_list (
  service_status_id INTEGER NOT NULL, /* Status ID (duplicate) */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  name VARCHAR(100) NOT NULL, /* Translated name, e.g., "created" */
  UNIQUE(lang_id, name),
  CONSTRAINT service_status_translate_list_pk PRIMARY KEY (service_status_id, lang_id)
);

/* File related to the service */
CREATE TABLE file_to_service (
  file_uuid UUID NOT NULL, /* File ID */
  service_uuid UUID NOT NULL, /* Service ID */
  CONSTRAINT file_to_service_pk PRIMARY KEY (file_uuid, service_uuid)
);

/* Service catalog */
CREATE TABLE spec_to_service (
  spec_id INTEGER NOT NULL, /* Catalog position ID */
  service_uuid UUID NOT NULL, /* Service ID (duplicate) */
  CONSTRAINT spec_to_service_pk PRIMARY KEY (spec_id, service_uuid)
);

/* Keywords related to the service (tagging) */
CREATE TABLE keyword_to_service (
  service_uuid UUID NOT NULL, /* Service ID (duplicate) */
  keyword_id INTEGER NOT NULL, /* Keyword (tag) ID */
  CONSTRAINT keyword_to_service_pk PRIMARY KEY (service_uuid, keyword_id)
);

/* Service parameter */
CREATE TABLE param_to_service (
  service_uuid UUID NOT NULL, /* Service ID */
  param_id INTEGER NOT NULL, /* Parameter ID */
  value VARCHAR(255) NOT NULL, /* Service parameter (additional info) */
  CONSTRAINT param_to_service_pk PRIMARY KEY (service_uuid, param_id)
);

/* Service discussion */
CREATE TABLE discus_to_service (
  discussion_uuid UUID NOT NULL,
  service_uuid UUID NOT NULL, /* Discussed service ID */
  CONSTRAINT discus_to_service_pk PRIMARY KEY (discussion_uuid, service_uuid)
);

/* Service components */
CREATE TABLE component_to_service (
  service_uuid UUID NOT NULL, /* Service ID */
  component_uuid UUID NOT NULL, /* Component ID */
  CONSTRAINT component_to_service_pk PRIMARY KEY (service_uuid, component_uuid)
);