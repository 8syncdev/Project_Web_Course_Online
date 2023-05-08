--Tạo hàm tính số lượng khóa học đã đăng kí (tham số: user_id): dùng bảng register_course:
--	+ Trả về int : số lượng khóa đã đăng kí.
GO
CREATE OR ALTER   FUNCTION [dbo].[getNumUserRegisterCourses] (@user_id int)
RETURNS int
AS
BEGIN
	DECLARE @soLopDangKi int
	SET @soLopDangKi = (SELECT COUNT(register_id) FROM register_course WHERE user_id = @user_id)
	RETURN @soLopDangKi
END

-- Tạo hàm tính tiền tổng số lượng khóa học đã đăng kí (tham số: user_id): dùng bảng orders, order_items:
--	+ Trả về  int: tổng số tiền (có thể trả về thêm nếu nghĩ ra cái gì hợp lí).
GO
CREATE OR ALTER   FUNCTION [dbo].[getTotalMoneyUserRegisterCourses] (@user_id int)
RETURNS decimal(10, 2)
AS
BEGIN
	DECLARE @soTienKhoaHocDangKi decimal(10, 2)
	SET @soTienKhoaHocDangKi = (SELECT SUM(B.price * B.quantity) FROM orders A join order_items B on A.user_id = @user_id and A.order_id = B.order_id and (A.payment_status_id = 1 OR A.payment_status_id = 2))
	IF @soTienKhoaHocDangKi is null
		SET @soTienKhoaHocDangKi = 0
	RETURN @soTienKhoaHocDangKi
END


