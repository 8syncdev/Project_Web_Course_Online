-- PROCEDURE:
GO
--procedure dang ki user
CREATE OR ALTER PROCEDURE DangKiUser_Proc
@username nvarchar(50), @email nvarchar(50), @password nvarchar(50)
AS
BEGIN
	--username đã tồn tại hoặc email đã tồn tại
	IF EXISTS (SELECT * FROM Users WHERE username = @username OR email = @email) 
	BEGIN
	--code báo lỗi
	print(N'Username hoặc email đã tồn tại')
	END
	--username và email đều chưa tồn tại --> tạo tài khoản mới
	ELSE
	BEGIN
		DECLARE @user_id int
		SET @user_id = (SELECT COUNT(user_id) + 1 FROM Users)
		INSERT INTO Users(user_id, username, email, password, created_at, updated_at)
		VALUES(@user_id ,@username, @email, @password, GETDATE(), GETDATE());
		-- Phân quyền cho user_id là user:
		INSERT INTO users_roles(user_id, role_id) VALUES(@user_id,1);
	END
END
-- Dang ki cho Admin
CREATE OR ALTER PROCEDURE DangKiAdmin_Proc
@username nvarchar(50), @email nvarchar(50), @password nvarchar(50)
AS
BEGIN
	--username đã tồn tại hoặc email đã tồn tại
	IF EXISTS (SELECT * FROM Users WHERE username = @username OR email = @email) 
	BEGIN
	--code báo lỗi
	print(N'Username hoặc email đã tồn tại')
	END
	--username và email đều chưa tồn tại --> tạo tài khoản mới
	ELSE
	BEGIN
		DECLARE @user_id int
		SET @user_id = (SELECT COUNT(user_id) + 1 FROM Users)
		INSERT INTO Users(user_id, username, email, password, created_at, updated_at)
		VALUES(@user_id ,@username, @email, @password, GETDATE(), GETDATE());
		-- Phân quyền cho user_id là admin:
		INSERT INTO users_roles(user_id, role_id) VALUES(@user_id,0); 
	END
END

