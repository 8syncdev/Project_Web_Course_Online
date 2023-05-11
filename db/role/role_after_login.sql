CREATE ROLE [role_after_login];
-- GRANT TABLE:
-- Grant INSERT, UPDATE, DELETE permission on the register_course table
GRANT INSERT, UPDATE, DELETE ON register_course TO [role_after_login];

-- Grant INSERT, UPDATE, DELETE permission on the orders table
GRANT INSERT, UPDATE, DELETE ON orders TO [role_after_login];

-- Grant INSERT, UPDATE, DELETE permission on the order_items table
GRANT INSERT, UPDATE, DELETE ON order_items TO [role_after_login];

-- Grant INSERT, UPDATE permissions on the budget table
GRANT INSERT, UPDATE ON budget TO [role_after_login];

-- END GRANT TABLE

-- STORE PROCEDURE AFTER LOGIN:
GRANT EXECUTE ON deleteUserCourseRegistry TO [role_after_login];
GRANT EXECUTE ON RegisterUserCourse TO [role_after_login];
-- SCALAR VALUED FUNCTIONS:
GRANT EXECUTE ON getNumUserRegisterCourses TO [role_after_login];
GRANT EXECUTE ON getTotalMoneyUserRegisterCourses TO [role_after_login];
GRANT EXECUTE ON HasWallet TO [role_after_login];

-- TABLE VALUED FUNCTIONS:
GRANT SELECT ON getUserRegisteredCourses TO [role_after_login];