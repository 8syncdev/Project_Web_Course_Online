CREATE TRIGGER trg_register_course_delete
ON register_course
AFTER DELETE
AS
BEGIN
    DELETE FROM order_items
    WHERE course_id = (SELECT course_id FROM deleted);

    DELETE FROM orders
    WHERE order_id = (SELECT register_id FROM deleted);
END;
