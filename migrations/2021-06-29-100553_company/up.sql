/* Company */
CREATE TABLE company_ref (
  uuid UUID NOT NULL UNIQUE PRIMARY KEY,
  orgname VARCHAR(2000) NOT NULL, /* Name of the organization (for legal entities) */
  shortname VARCHAR(500) NOT NULL, /* Abbreviated name of the organization (for legal entities) */
  inn VARCHAR(30) NOT NULL, /* Company Taxpayer Identification Number (TIN) */
  phone VARCHAR(100) NOT NULL, /* Phone number */
  email VARCHAR(100) NOT NULL, /* Company email */
  description VARCHAR(50000) NOT NULL, /* Information, description */
  address VARCHAR(1000) NOT NULL, /* Postal address */
  site_url VARCHAR(500) NOT NULL, /* URL address of the company's website */
  time_zone VARCHAR(50) NOT NULL, /* Company's time zone */
  user_uuid UUID NOT NULL, /* UUID of the profile - owner */
  image_file_uuid UUID NOT NULL, /* Company logo */
  region_id INTEGER NOT NULL, /* Region */
  company_type_id INTEGER NOT NULL DEFAULT '1', /* Company type (AO, PAO, LLC, Individual Entrepreneur) */
  type_access_id INTEGER NOT NULL DEFAULT '1', /* Accessibility type */
  is_supplier BOOLEAN NOT NULL DEFAULT 'f',  /* User role: supplier/customer */
  is_email_verified BOOLEAN NOT NULL DEFAULT 'f', /* Email confirmation */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* User activity flag */
  is_delete BOOLEAN NOT NULL DEFAULT 'f', /* User deletion flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Company creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Company update date */
  UNIQUE (orgname, user_uuid) /* User cannot create companies with the same name */
);

/* Company type */
CREATE TABLE company_type_ref (
  id SERIAL, /* Company type ID */
  CONSTRAINT company_type_ref_pk PRIMARY KEY (id)
);

CREATE TABLE company_type_translate_list (
  company_type_id INTEGER NOT NULL, /* Company type ID (duplicate) */
  lang_id INTEGER NOT NULL, /* Translation language identifier */
  name VARCHAR(255) NOT NULL, /* Full name (e.g., legal entity) in translation */
  shortname VARCHAR(50) NOT NULL, /* Abbreviated name (e.g., legal entity) in translation */
  UNIQUE(lang_id, name, shortname),
  CONSTRAINT company_type_translate_list_pk PRIMARY KEY (company_type_id, lang_id)
);

/* Local profile representation */
CREATE TABLE company_represent_ref (
  uuid UUID NOT NULL UNIQUE,
  company_uuid UUID NOT NULL, /* Company UUID (whose representation) */
  region_id INTEGER NOT NULL DEFAULT '1', /* Representation region */
  representation_type_id INTEGER NOT NULL DEFAULT '1', /* Representation type */
  name VARCHAR(500) NOT NULL, /* Representation name */
  address VARCHAR(1000) NOT NULL, /* Representation postal address */
  phone VARCHAR(100) NOT NULL, /* Representation phone number */
  CONSTRAINT company_represent_ref_pk PRIMARY KEY (uuid)
);

/* Company members and their roles */
CREATE TABLE company_member_list (
  company_uuid UUID NOT NULL, /* Company UUID */
  user_uuid UUID NOT NULL, /* Profile UUID */
  role_id INTEGER NOT NULL, /* User role ID */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Member of the company is active */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Update date */
  CONSTRAINT company_member_list_pk PRIMARY KEY (company_uuid, user_uuid)
);

/* Linking catalogs with the company */
CREATE TABLE spec_to_company (
  spec_id INTEGER NOT NULL, /* Catalog associated with the company (category) */
  company_uuid UUID NOT NULL, /* Company associated with the catalog (category) */
  CONSTRAINT spec_to_company_pk PRIMARY KEY (spec_id, company_uuid)
);

/* Record of company data changes */
CREATE TABLE company_history_list (
  id SERIAL, /* Event ID */
  company_uuid UUID NOT NULL, /* ID of the company related to the change */
  type_of_change_id INTEGER NOT NULL, /* Change ID (type of change) */
  user_uuid UUID NOT NULL, /* Profile ID related to the change */
  old_data TEXT NOT NULL, /* Updated data */
  changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Change date */
  CONSTRAINT company_history_list_pk PRIMARY KEY (id)
);

/* Company discussion */
CREATE TABLE discus_to_company (
  discussion_uuid UUID NOT NULL,
  company_uuid UUID NOT NULL, /* Discussed company ID */
  CONSTRAINT discus_to_company_pk PRIMARY KEY (discussion_uuid, company_uuid)
);

/* Company representation type */
CREATE TABLE representation_type_ref (
  id SERIAL, /* Representation type ID */
  CONSTRAINT representation_type_ref_pk PRIMARY KEY (id)
);

CREATE TABLE representation_type_translate_list (
  representation_type_id INTEGER NOT NULL, /* Representation type ID (duplicate) */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  representation_type VARCHAR(100) NOT NULL UNIQUE, /* Representation type name in translation */
  UNIQUE(lang_id, representation_type),
  CONSTRAINT representation_type_translate_list_pk PRIMARY KEY (representation_type_id, lang_id)
);

/* Member role */
CREATE TABLE role_member_list (
  id SERIAL, /* Record ID */
  company_uuid UUID NOT NULL, /* ID of the entity for which the role was created */
  CONSTRAINT role_member_list_pk PRIMARY KEY (id)
);

CREATE TABLE role_member_translate_list (
  role_member_id INTEGER NOT NULL, /* Role ID */
  lang_id INTEGER NOT NULL, /* Translation language ID */
  name VARCHAR(50) NOT NULL, /* Role name in translation */
  CONSTRAINT role_member_translate_list_pk PRIMARY KEY (role_member_id, lang_id)
);

/* Role access level */
CREATE TABLE role_access (
  role_id INTEGER NOT NULL, /* User role ID */
  type_access_id INTEGER NOT NULL, /* Access type */
  CONSTRAINT role_access_pk PRIMARY KEY (role_id, type_access_id)
);

/* Access to a specific company's component */
CREATE TABLE company_access_to_component (
  component_uuid UUID NOT NULL, /* Component ID */
  company_uuid UUID NOT NULL, /* Company ID */
  type_access_id INTEGER NOT NULL, /* Access type to component */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Access validity flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access update date */
  CONSTRAINT company_access_to_component_pk PRIMARY KEY (component_uuid, company_uuid)
);

/* Access to a company's standard */
CREATE TABLE company_access_to_standard (
  standard_uuid UUID NOT NULL, /* Standard ID */
  company_uuid UUID NOT NULL, /* Company ID */
  type_access_id INTEGER NOT NULL, /* Standard access type */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Access validity flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access update date */
  CONSTRAINT company_access_to_standard_pk PRIMARY KEY (standard_uuid, company_uuid)
);

/* Access to a company's service */
CREATE TABLE company_access_to_service (
  service_uuid UUID NOT NULL, /* Service ID */
  company_uuid UUID NOT NULL, /* Company ID */
  type_access_id INTEGER NOT NULL, /* Service access type */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Access validity flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access update date */
  CONSTRAINT company_access_to_service_pk PRIMARY KEY (service_uuid, company_uuid)
);

/* Company certificates */
CREATE TABLE company_certificate_ref (
  file_uuid UUID NOT NULL, /* Certificate file */
  company_uuid UUID NOT NULL, /* Company to which the certificate was issued */
  description VARCHAR(500) NOT NULL, /* Additional information */
  CONSTRAINT company_certificate_ref_pk PRIMARY KEY (file_uuid, company_uuid)
);
