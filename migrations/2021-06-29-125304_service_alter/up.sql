ALTER TABLE service_ref ADD CONSTRAINT service_ref_fk1 FOREIGN KEY (user_uuid) REFERENCES user_ref(uuid) ON DELETE CASCADE;
ALTER TABLE service_ref ADD CONSTRAINT service_ref_fk2 FOREIGN KEY (company_uuid) REFERENCES company_ref(uuid) ON DELETE CASCADE;
ALTER TABLE service_ref ADD CONSTRAINT service_ref_fk3 FOREIGN KEY (service_status_id) REFERENCES service_status_ref(id) ON DELETE CASCADE;
ALTER TABLE service_ref ADD CONSTRAINT service_ref_fk4 FOREIGN KEY (type_access_id) REFERENCES type_access_ref(id) ON DELETE CASCADE;
ALTER TABLE service_ref ADD CONSTRAINT service_ref_fk5 FOREIGN KEY (region_id) REFERENCES region_ref(id) ON DELETE CASCADE;

ALTER TABLE service_history_list ADD CONSTRAINT service_history_list_fk0 FOREIGN KEY (service_uuid) REFERENCES service_ref(uuid) ON DELETE CASCADE;
ALTER TABLE service_history_list ADD CONSTRAINT service_history_list_fk1 FOREIGN KEY (type_of_change_id) REFERENCES type_of_change_ref(id) ON DELETE CASCADE;
ALTER TABLE service_history_list ADD CONSTRAINT service_history_list_fk2 FOREIGN KEY (user_uuid) REFERENCES user_ref(uuid) ON DELETE CASCADE;

ALTER TABLE file_to_service ADD CONSTRAINT file_to_service_fk0 FOREIGN KEY (file_uuid) REFERENCES file_ref(uuid) ON DELETE CASCADE;
ALTER TABLE file_to_service ADD CONSTRAINT file_to_service_fk1 FOREIGN KEY (service_uuid) REFERENCES service_ref(uuid) ON DELETE CASCADE;

ALTER TABLE service_status_translate_list ADD CONSTRAINT service_status_translate_list_fk0 FOREIGN KEY (service_status_id) REFERENCES service_status_ref(id) ON DELETE CASCADE;
ALTER TABLE service_status_translate_list ADD CONSTRAINT service_status_translate_list_fk1 FOREIGN KEY (lang_id) REFERENCES language_ref(id) ON DELETE CASCADE;

ALTER TABLE spec_to_service ADD CONSTRAINT spec_to_service_fk0 FOREIGN KEY (spec_id) REFERENCES spec_ref(id) ON DELETE CASCADE;
ALTER TABLE spec_to_service ADD CONSTRAINT spec_to_service_fk1 FOREIGN KEY (service_uuid) REFERENCES service_ref(uuid) ON DELETE CASCADE;

ALTER TABLE keyword_to_service ADD CONSTRAINT keyword_to_service_fk0 FOREIGN KEY (service_uuid) REFERENCES service_ref(uuid) ON DELETE CASCADE;
ALTER TABLE keyword_to_service ADD CONSTRAINT keyword_to_service_fk1 FOREIGN KEY (keyword_id) REFERENCES keyword_ref(id) ON DELETE CASCADE;

ALTER TABLE param_to_service ADD CONSTRAINT param_to_service_fk0 FOREIGN KEY (service_uuid) REFERENCES service_ref(uuid) ON DELETE CASCADE;
ALTER TABLE param_to_service ADD CONSTRAINT param_to_service_fk1 FOREIGN KEY (param_id) REFERENCES param_ref(id) ON DELETE CASCADE;

ALTER TABLE discus_to_service ADD CONSTRAINT discus_to_service_fk0 FOREIGN KEY (discussion_uuid) REFERENCES discussion_ref(uuid) ON DELETE CASCADE;
ALTER TABLE discus_to_service ADD CONSTRAINT discus_to_service_fk1 FOREIGN KEY (service_uuid) REFERENCES service_ref(uuid) ON DELETE CASCADE;

ALTER TABLE component_to_service ADD CONSTRAINT component_to_service_fk0 FOREIGN KEY (component_uuid) REFERENCES component_ref(uuid) ON DELETE CASCADE;
ALTER TABLE component_to_service ADD CONSTRAINT component_to_service_fk1 FOREIGN KEY (service_uuid) REFERENCES service_ref(uuid) ON DELETE CASCADE;