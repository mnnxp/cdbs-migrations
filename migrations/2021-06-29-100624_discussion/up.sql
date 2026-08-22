/* Adding table for discussions */
CREATE TABLE discussion_ref (
  uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title VARCHAR(255) NOT NULL, /* Discussion title */
  is_pinned BOOLEAN NOT NULL DEFAULT 'f', /* Is the discussion pinned */
  last_activity_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), /* Time of the last comment */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW() /* Creation date */
);

/* Adding discussion comments */
CREATE TABLE discussion_comment_list (
  uuid UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  discussion_uuid UUID NOT NULL, /* Discussion threads (discussions) */
  parent_comment_uuid UUID NOT NULL, /* Parent comment ID */
  author_uuid UUID NOT NULL, /* Profile ID related to the comment */
  message_content VARCHAR(5000) NOT NULL, /* Comment content */
  is_edited BOOLEAN NOT NULL DEFAULT 'f', /* Change flag */
  is_hidden BOOLEAN NOT NULL DEFAULT 'f', /* Hide flag */
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW() /* Modification date */
);