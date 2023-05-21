-- CREATE AFTER LOGIN ROLE:
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
GRANT EXECUTE ON sp_delete_reg_courses TO [role_after_login];
GRANT EXECUTE ON sp_reg_courses TO [role_after_login];
GRANT EXECUTE ON sp_create_budget TO [role_after_login];
GRANT EXECUTE ON sp_deposit_budget TO [role_after_login];
GRANT EXECUTE ON sp_set_payment_status_to_paid TO [role_after_login];
GRANT EXECUTE ON sp_deduct_from_budget TO [role_after_login];
GRANT EXECUTE ON sp_processTransactionProc TO [role_after_login];
GRANT EXECUTE ON sp_Loop_TransactionForAllOrders TO [role_after_login];
GRANT EXECUTE ON sp_processTransactionForAllOrders TO [role_after_login];

-- SCALAR VALUED FUNCTIONS:
GRANT EXECUTE ON func_num_reg_courses TO [role_after_login];
GRANT EXECUTE ON func_total_money_reg_courses TO [role_after_login];
GRANT EXECUTE ON func_check_wallet_exist TO [role_after_login];
GRANT EXECUTE ON func_get_current_money TO [role_after_login];
-- TABLE VALUED FUNCTIONS:
GRANT SELECT ON func_list_all_reg_courses TO [role_after_login];
GRANT SELECT ON func_list_all_paid_courses TO [role_after_login];