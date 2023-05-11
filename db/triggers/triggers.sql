CREATE TRIGGER trg_register_course_delete
ON register_course
AFTER DELETE
AS
BEGIN
    DELETE FROM order_items
    WHERE course_id IN (SELECT course_id FROM deleted);

    DELETE FROM orders
    WHERE user_id IN (SELECT user_id FROM deleted);
END;
