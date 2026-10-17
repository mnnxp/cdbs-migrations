/* Profile */
CREATE TABLE user_ref (
  uuid UUID NOT NULL PRIMARY KEY,
  email VARCHAR(100) NOT NULL, /* Profile email, multiple profiles can be associated with one address (reddit-like) */
  psw_hash BYTEA NOT NULL, /* Profile password hash */
  psw_salt BYTEA NOT NULL, /* Salt for profile password */
  firstname VARCHAR(100) NOT NULL, /* First name */
  lastname VARCHAR(100) NOT NULL, /* Last name */
  secondname VARCHAR(100) NOT NULL, /* Patronymic */
  username VARCHAR(100) NOT NULL UNIQUE, /* Profile nickname (can be used for authentication) */
  phone VARCHAR(100) NOT NULL, /* Phone number */
  description VARCHAR(50000) NOT NULL, /* Contact information, signature */
  address VARCHAR(512) NOT NULL, /* Postal address */
  position VARCHAR(255) NOT NULL, /* Role/position */
  time_zone VARCHAR(50) NOT NULL, /* Profile time zone */
  image_file_uuid UUID NOT NULL, /* User picture */
  region_id INTEGER NOT NULL, /* Region */
  program_id INTEGER NOT NULL DEFAULT '1', /* CAD "by default" (for quick data loading) */
  type_access_id INTEGER NOT NULL DEFAULT '1', /* Availability type */
  is_email_verified BOOLEAN NOT NULL DEFAULT 'f', /* Email confirmation */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* User activity flag */
  is_delete BOOLEAN NOT NULL DEFAULT 'f', /* User deletion flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Profile creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW() /* Profile update date */
);

/* Client session token */
CREATE TABLE user_token_ref (
  user_uuid UUID NOT NULL, /* User ID */
  token VARCHAR(4096) NOT NULL, /* User token */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Token creation date */
  expiration_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Token expiration date */
  CHECK(created_at<expiration_at),
  CONSTRAINT user_token_ref_pk PRIMARY KEY (user_uuid, token)
);

/* API access key */
CREATE TABLE user_api_key_ref (
    id SERIAL PRIMARY KEY,
    user_uuid UUID NOT NULL REFERENCES user_ref(uuid) ON DELETE CASCADE,
    key_hash BYTEA NOT NULL UNIQUE, /* Key hash */
    name VARCHAR(100) NOT NULL, /* User-defined key name */
    last_used_at TIMESTAMPTZ, /* Last used date, can be NULL */
    expires_at TIMESTAMPTZ NOT NULL DEFAULT NOW() + INTERVAL '1 year', /* Expiration date */
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
/* Index for displaying user's key list */
CREATE INDEX idx_user_api_key_ref_user_uuid ON user_api_key_ref(user_uuid);

/* User data change record */
CREATE TABLE user_history_list (
  id SERIAL, /* Event ID */
  user_uuid UUID NOT NULL, /* Profile ID related to the change */
  type_of_change_id INTEGER NOT NULL, /* Change ID (type of change) */
  old_data TEXT NOT NULL, /* Updated data */
  changed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Change date */
  CONSTRAINT user_history_list_pk PRIMARY KEY (id)
);

/* Access to a specific user's component */
CREATE TABLE user_access_to_component (
  -- id SERIAL, /* Access ID */
  component_uuid UUID NOT NULL, /* Component ID */
  user_uuid UUID NOT NULL, /* Profile ID */
  type_access_id INTEGER NOT NULL, /* Access type to component */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Access relevance flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access update date */
  CONSTRAINT user_access_to_component_pk PRIMARY KEY (component_uuid, user_uuid)
);

/* Access to a user's standard */
CREATE TABLE user_access_to_standard (
  -- id SERIAL, /* Access ID */
  standard_uuid UUID NOT NULL, /* Standard ID */
  user_uuid UUID NOT NULL, /* Profile ID */
  type_access_id INTEGER NOT NULL, /* Access type to standard */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Access relevance flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access update date */
  CONSTRAINT user_access_to_standard_pk PRIMARY KEY (standard_uuid, user_uuid)
);

/* Access to a user's service */
CREATE TABLE user_access_to_service (
  -- id SERIAL, /* Access ID */
  service_uuid UUID NOT NULL, /* Service ID */
  user_uuid UUID NOT NULL, /* Profile ID */
  type_access_id INTEGER NOT NULL, /* Access type to service */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Access relevance flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access creation date */
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Access update date */
  CONSTRAINT user_access_to_service_pk PRIMARY KEY (service_uuid, user_uuid)
);

/* User profile tracking */
CREATE TABLE user_fav (
  -- id SERIAL, /* Subscription ID (tracking start) */
  user_favorite_uuid UUID NOT NULL, /* Profile ID being tracked */
  user_follower_uuid UUID NOT NULL, /* Tracking profile ID */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Tracking relevance flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation date */
  CONSTRAINT user_fav_pk PRIMARY KEY (user_favorite_uuid, user_follower_uuid)
);

/* Company tracking by user */
CREATE TABLE company_fav (
  -- id SERIAL, /* Subscription ID (tracking start) */
  company_uuid UUID NOT NULL, /* Company ID being tracked */
  user_uuid UUID NOT NULL, /* Profile ID */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Tracking relevance flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation date */
  CONSTRAINT company_fav_pk PRIMARY KEY (company_uuid, user_uuid)
);

/* Component tracking by user */
CREATE TABLE component_fav (
  -- id SERIAL, /* Subscription ID (tracking start) */
  component_uuid UUID NOT NULL, /* Component ID being tracked */
  user_uuid UUID NOT NULL, /* Profile ID */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Tracking relevance flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation date */
  CONSTRAINT component_fav_pk PRIMARY KEY (component_uuid, user_uuid)
);

/* Standard tracking by user */
CREATE TABLE standard_fav (
  -- id SERIAL, /* Subscription ID (tracking start) */
  standard_uuid UUID NOT NULL, /* Standard ID being tracked */
  user_uuid UUID NOT NULL, /* Profile ID */
  is_enabled BOOLEAN NOT NULL DEFAULT 't', /* Tracking relevance flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Creation date */
  CONSTRAINT standard_fav_pk PRIMARY KEY (standard_uuid, user_uuid)
);

/* Access to a user's standard notification */
CREATE TABLE notification_to_user (
  notification_id INTEGER NOT NULL, /* Notification ID */
  user_uuid UUID NOT NULL, /* Profile ID */
  is_read BOOLEAN NOT NULL DEFAULT 'f', /* Read status */
  CONSTRAINT notification_to_user_pk PRIMARY KEY (notification_id, user_uuid)
);

/* User certificates */
CREATE TABLE user_certificate_ref (
  file_uuid UUID NOT NULL, /* Certificate file */
  user_uuid UUID NOT NULL, /* User to whom the certificate was issued */
  description VARCHAR(500) NOT NULL, /* Additional information */
  CONSTRAINT user_certificate_ref_pk PRIMARY KEY (file_uuid, user_uuid)
);
