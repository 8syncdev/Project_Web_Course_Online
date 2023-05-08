
--Login Function KO DUNG:
CREATE OR ALTER FUNCTION LoginUser_Func (@username_or_email nvarchar(50), @password nvarchar(50))
RETURNS int
AS
BEGIN
	---kiểm tra xem có tài khoản và mật khẩu truyền vào có khớp với tài khoản/email và password nào tồn tại trong database
	--Latin1_Gểnal_CS_AS để kiểm tra upper/lower case - case sensitive comparison
	--DATALENGTH để kiểm tra độ dài, vì sql ignore blank space khi so sánh
	IF(EXISTS (SELECT * FROM Users WHERE 
    ( (@username_or_email = username) OR (@username_or_email = email) ) AND (@password = password ) ) )
		RETURN 1
	RETURN 0
END



