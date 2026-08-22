/* Component */
CREATE TABLE component_ref (
  uuid UUID NOT NULL UNIQUE,
  parent_component_uuid UUID NOT NULL, /* Parent component */
  name VARCHAR(2000) NOT NULL, /* Component name */
  description VARCHAR(50000) NOT NULL, /* Short description of the component */
  image_file_uuid UUID NOT NULL, /* Component image */
  user_uuid UUID NOT NULL, /* Profile ID of the uploader of the component */
  type_access_id INTEGER NOT NULL, /* Default access to the component */
  component_type_id INTEGER NOT NULL, /* Component type */
  actual_status_id INTEGER NOT NULL, /* Status number, e.g., "current", "archived", "discontinued" */
  is_base BOOLEAN NOT NULL DEFAULT 'f', /* Component complies with a standard */
  is_delete BOOLEAN NOT NULL DEFAULT 'f', /* Component deletion flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation/upload date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Update date */
  CONSTRAINT component_ref_pk PRIMARY KEY (uuid)
);

/* Record of component data changes */
CREATE TABLE component_history_list (
  id SERIAL UNIQUE, /* Event ID */
  component_uuid UUID NOT NULL, /* Standard ID related to the change */
  type_of_change_id INTEGER NOT NULL, /* Change ID (type of change) */
  user_uuid UUID NOT NULL, /* Profile ID related to the change */
  old_data TEXT NOT NULL, /* Updated data */
  changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Change date */
  CONSTRAINT component_history_list_pk PRIMARY KEY (id)
);

/* Component type (basic, custom) */
CREATE TABLE component_type_ref (
  id SERIAL, /* Type ID */
  CONSTRAINT component_type_ref_pk PRIMARY KEY (id)
);

CREATE TABLE component_type_translate_list (
  component_type_id INTEGER NOT NULL, /* Type ID (duplicate) */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  component_type VARCHAR(100) NOT NULL, /* Type name */
  UNIQUE (lang_id, component_type),
  CONSTRAINT component_type_translate_list_pk PRIMARY KEY (component_type_id, lang_id)
);

/* Keywords related to the component (tagging) */
CREATE TABLE keyword_to_component (
  component_uuid UUID NOT NULL, /* Component ID */
  keyword_id INTEGER NOT NULL, /* Keyword (tag) ID */
  CONSTRAINT keyword_to_component_pk PRIMARY KEY (component_uuid, keyword_id)
);

/* Component parameter */
CREATE TABLE param_to_component (
  component_uuid UUID NOT NULL, /* Component ID */
  param_id INTEGER NOT NULL, /* Parameter ID */
  value VARCHAR(500) NOT NULL, /* Parameter of the component */
  CONSTRAINT param_to_component_pk PRIMARY KEY (component_uuid, param_id)
);

/* List of component shippers (suppliers) */
CREATE TABLE supplier_to_component (
  component_uuid UUID NOT NULL, /* Component ID */
  company_uuid UUID NOT NULL, /* Supplier company ID */
  description VARCHAR(500) NOT NULL, /* Comment on the supplier */
  CONSTRAINT supplier_to_component_pk PRIMARY KEY (component_uuid, company_uuid)
);

/* Component discussion */
CREATE TABLE discus_to_component (
  discussion_uuid UUID NOT NULL,
  component_uuid UUID NOT NULL, /* Discussed component ID */
  CONSTRAINT discus_to_component_pk PRIMARY KEY (discussion_uuid, component_uuid)
);

/* List of component modifications */
CREATE TABLE component_modification_list (
  uuid UUID NOT NULL UNIQUE,
  component_uuid UUID NOT NULL, /* Component ID */
  parent_modification_uuid UUID NOT NULL, /* Parent modification */
  modification_name VARCHAR(2000) NOT NULL, /* Modification name */
  description VARCHAR(50000) NOT NULL, /* Comment on the modification */
  actual_status_id INTEGER NOT NULL, /* Status number, e.g., "current", "archived", "discontinued" */
  is_delete BOOLEAN NOT NULL DEFAULT 'f', /* Component deletion flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation/upload date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Update date */
  CONSTRAINT component_modification_list_pk PRIMARY KEY (uuid)
);

/* Modification parameter */
CREATE TABLE param_to_modification (
  modification_uuid UUID NOT NULL, /* Modification ID */
  param_id INTEGER NOT NULL, /* Parameter ID */
  value VARCHAR(255) NOT NULL, /* Modification parameter */
  CONSTRAINT param_to_modification_pk PRIMARY KEY (modification_uuid, param_id)
);

/* Component object/file */
CREATE TABLE file_to_component (
  file_uuid UUID NOT NULL, /* Object/file ID */
  component_uuid UUID NOT NULL, /* Component ID */
  CONSTRAINT file_to_component_pk PRIMARY KEY (file_uuid, component_uuid)
);

/* Modification object/file */
CREATE TABLE file_to_modification (
  file_uuid UUID NOT NULL, /* Object/file ID */
  modification_uuid UUID NOT NULL, /* Modification ID */
  CONSTRAINT file_to_modification_pk PRIMARY KEY (file_uuid, modification_uuid)
);

/* Set of modification files (CAD files) */
CREATE TABLE fileset_for_program (
  uuid UUID, /* Object/file set ID */
  modification_uuid UUID NOT NULL, /* Modification set ID */
  program_id INTEGER NOT NULL, /* CAD (for quick data loading) */
  UNIQUE (modification_uuid, program_id), /* Single set of modification files for one CAD system */
  CONSTRAINT fileset_for_program_pk PRIMARY KEY (uuid)
);

/* Files of the modification set (CAD files) */
CREATE TABLE modification_file_from_fileset (
  fileset_uuid UUID NOT NULL, /* Set ID */
  file_uuid UUID NOT NULL, /* Object/file ID */
  CONSTRAINT modification_file_from_fileset_pk PRIMARY KEY (fileset_uuid, file_uuid)
);

/* Component catalog */
CREATE TABLE spec_to_component (
  spec_id INTEGER NOT NULL, /* Catalog position ID */
  component_uuid UUID NOT NULL, /* Component ID */
  CONSTRAINT spec_to_component_pk PRIMARY KEY (spec_id, component_uuid)
);

/* Component license */
CREATE TABLE license_to_component (
  component_uuid UUID NOT NULL, /* Component ID */
  license_id INTEGER NOT NULL, /* License ID */
  CONSTRAINT license_to_component_pk PRIMARY KEY (component_uuid, license_id)
);

/* Component standard */
CREATE TABLE standard_to_component (
  standard_uuid UUID NOT NULL, /* Standard ID */
  component_uuid UUID NOT NULL, /* Component ID */
  CONSTRAINT standard_to_component_pk PRIMARY KEY (standard_uuid, component_uuid)
);
