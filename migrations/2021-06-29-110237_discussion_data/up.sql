INSERT INTO discussion_ref (uuid, title, created_at, is_pinned, last_activity_at) VALUES
  ('ed5baabe-7201-45d3-9ec8-e610839feb39', 'discussion title', now(), 'f', now());

INSERT INTO discussion_comment_list (uuid, discussion_uuid, parent_comment_uuid, author_uuid, message_content, is_edited, is_hidden, created_at, updated_at) VALUES
  ('dd92b579-019b-48ed-a9e2-28131dbdd363', 'ed5baabe-7201-45d3-9ec8-e610839feb39', 'dd92b579-019b-48ed-a9e2-28131dbdd363', '31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 'this message content', 'f', 'f', now(), now());
