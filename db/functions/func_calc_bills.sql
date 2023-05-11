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
	DECLARE @total_amount DECIMAL(10,2) = 0;

    SELECT @total_amount = SUM(c.price)
    FROM register_course rc
    JOIN courses c ON rc.course_id = c.course_id
    WHERE rc.user_id = @user_id;
	IF @total_amount is NULL
		RETURN 0;
    RETURN @total_amount;
END


