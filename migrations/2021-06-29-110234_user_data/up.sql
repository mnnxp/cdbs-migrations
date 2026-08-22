INSERT INTO user_ref (uuid,email,psw_hash,psw_salt,firstname,lastname,secondname,username,phone,description,address,"position",time_zone,image_file_uuid,region_id,program_id,type_access_id,is_email_verified,is_enabled,is_delete,created_at,updated_at) VALUES
  ('31ecc6f8-0c09-4a59-a2d5-34b5b833e59b','test@example.com',decode('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','hex'),decode('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA','hex'),'Johm','Ivanov','Rucovich','demo_user','+70000000000','description for this user','Moscow','manufacturer','Europe/Moscow','bc1c2151-86d0-4656-9c9d-d016dd584297',1,1,1,false,true,false,'2021-01-01 00:00:00.000 +0300','2021-01-01 00:00:00.000 +0300');

INSERT INTO user_token_ref (user_uuid, token, created_at, expiration_at) VALUES
  ('31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpc3MiOiIwLjAuMC4wIiwic3ViIjoiMzFlY2M2ZjgtMGMwOS00YTU5LWEyZDUtMzRiNWI4MzNlNTliIiwiaWF0IjoxNjI3MjE0Njc3LCJleHAiOjE2MjczMDEwNzcsInVzZXJuYW1lIjoidXNlcm5hbWVlZWUiLCJpZF9wcm9ncmFtIjoxfQ.qZXPJTEEJRujUXRcLlrVMp5x1SW2M-2vAEqlGVtzpchIvehgWDtq7MdJLY21WOw5KApOr80MAzGzwTJTAt5XCb__sNv1ufZRqKcK6B_aBYQvq-Ph8cLF7qdQc1y6FI-vPfp5U_wtNNmtdEmp6q04gYpK6n4MP0UeIts9ILDuQgu0NGRYJqkXEyGiztIwd_Rw12mSZ3yanfT34ZQHB-HFjxPHeJ3QtxWXhuE1TcDFCmF_ca-ikrz-ygC7TiYTyOVuRQEkp3GIT7nPlUVpqtmjmAnLNL-U8ioABQj5SEsVCP5EDRPW2RSMJzmTdcArYZ4NlaWGxLWI33L3v2YNn-Kl71sGuwytYjfLQhK9F2SxydYE-C6Z1EUfDMdH2UsqcKwXQLYYPC9MTJR76JqU1SvhDMqAzj0eIIonHJi0YO5U_ZUfzsG04ocmARW8Q2cEws1tPUYxD67AlN_d1OO2Nu4yQQdAEBTH8Ef3Yq7_KANwX4aUrgLEWgOXj3qD2CpWMyarq_JFiobVbVqK549kWgqY2WALw_jyQQQ8IbszeNGpeBjePFI89PdoOXvavGrh-_y1JkW3qGiScO2D1DzzbyZA-Bw41RBJGR9DpYuy6tF4wlIyZvwKhv758Kh5MZLR0PAWC5uiegXokiYuihqTeRAS1IBqadxppIb1WfrEQJIhDW4', now(), now()+interval '1' day);

INSERT INTO user_history_list (user_uuid, type_of_change_id, old_data, changed_at) VALUES
  ('31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 1, 'Комментарий к изменению', now());

INSERT INTO user_access_to_component (component_uuid, user_uuid, type_access_id,is_enabled, created_at, updated_at) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1', '31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 1, 't', now(), now());

INSERT INTO user_access_to_standard (standard_uuid, user_uuid, type_access_id, is_enabled, created_at, updated_at) VALUES
  ('303ec2aa-2066-42e3-93fb-de4fb9344bcb', '31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 1, 't', now(), now());

INSERT INTO user_access_to_service (service_uuid, user_uuid, type_access_id, is_enabled, created_at, updated_at) VALUES
  ('3c7805f5-f58e-418d-9285-6edc2c919649', '31ecc6f8-0c09-4a59-a2d5-34b5b833e59b', 1, 't', now(), now());

INSERT INTO user_fav (user_favorite_uuid,user_follower_uuid,is_enabled,created_at) VALUES
  ('31ecc6f8-0c09-4a59-a2d5-34b5b833e59b','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b',true,'2021-01-01 00:00:00.000 +0300');

INSERT INTO company_fav (company_uuid,user_uuid,is_enabled,created_at) VALUES
  ('2cd385e1-8f7e-4908-8235-dfe42938b46d','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b',true,'2021-01-01 00:00:00.000 +0300');

INSERT INTO component_fav (component_uuid,user_uuid,is_enabled,created_at) VALUES
  ('a5953fd9-7393-4f1e-a899-06b5e159dbf1','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b',true,'2021-01-01 00:00:00.000 +0300');

INSERT INTO standard_fav (standard_uuid,user_uuid,is_enabled,created_at) VALUES
  ('303ec2aa-2066-42e3-93fb-de4fb9344bcb','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b',true,'2021-01-01 00:00:00.000 +0300');

INSERT INTO notification_to_user (notification_id,user_uuid,is_read) VALUES
  (1,'31ecc6f8-0c09-4a59-a2d5-34b5b833e59b',false);

INSERT INTO user_certificate_ref (file_uuid,user_uuid,description) VALUES
  ('bc1c2151-86d0-4656-9c9d-d016dd584297','31ecc6f8-0c09-4a59-a2d5-34b5b833e59b','user certificate');
