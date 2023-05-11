-- Create the role

CREATE ROLE [user];


-- Grant SELECT, INSERT, UPDATE, and DELETE permissions on the users table
GRANT SELECT, INSERT, UPDATE, DELETE ON users TO [user];

-- Grant SELECT permission on the roles table
GRANT SELECT ON roles TO [user];

-- Grant SELECT, INSERT permission on the users_roles table
GRANT SELECT, INSERT ON users_roles TO [user];

-- Grant SELECT permission on the payment_status table
GRANT SELECT ON payment_status TO [user];

-- Grant SELECT permission on the level_courses table
GRANT SELECT ON level_courses TO [user];

-- Grant SELECT permission on the courses table
GRANT SELECT ON courses TO [user];

-- Grant SELECT permission on the register_course table
GRANT SELECT ON register_course TO [user];

-- Grant SELECT permission on the orders table
GRANT SELECT ON orders TO [user];

-- Grant SELECT permission on the order_items table
GRANT SELECT ON order_items TO [user];

-- Grant SELECT permission on the categories table
GRANT SELECT ON categories TO [user];

-- Grant SELECT permission on the course_categories table
GRANT SELECT ON course_categories TO [user];

-- Grant SELECT IN permissions on the budget table
GRANT SELECT ON budget TO [user];



-- VIEW FOR USER:
GRANT SELECT ON all_courses_info TO [user];
GRANT SELECT ON v_beginner_courses_info TO [user];
GRANT SELECT ON v_intermediate_courses_info TO [user];
GRANT SELECT ON v_expert_courses_info TO [user];
GRANT SELECT ON v_master_courses_info TO [user];
GRANT SELECT ON v_advanced_courses_info TO [user];
GRANT SELECT ON v_latest_courses TO [user];
GRANT SELECT ON v_courses_price_asc TO [user];
GRANT SELECT ON v_course_price_descending TO [user];
GRANT SELECT ON v_instructor TO [user];

-- FUNCTION AND PROCEDURE: lưu ý table func là grant select
-- STORE PROCEDURE:
GRANT EXECUTE ON check_login TO [user];
GRANT EXECUTE ON DangKiAdmin_Proc TO [user];
GRANT EXECUTE ON DangKiUser_Proc TO [user];





-- Django Permissions:
GRANT SELECT, INSERT, UPDATE, DELETE ON auth_group TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON auth_group_permissions TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON auth_permission TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON auth_user TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON auth_user_groups TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON auth_user_user_permissions TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON django_admin_log TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON django_content_type TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON django_migrations TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON django_session TO [user];
GRANT SELECT, INSERT, UPDATE, DELETE ON django_admin_log TO [user];

