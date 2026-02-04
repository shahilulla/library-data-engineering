CREATE OR REPLACE PROCEDURE update_all_fines()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE borrow_transactions
    SET fine_amount =
        CASE
            WHEN return_date IS NULL AND CURRENT_DATE > due_date
                THEN (CURRENT_DATE - due_date) * 10
            WHEN return_date > due_date
                THEN (return_date - due_date) * 10
            ELSE 0
        END;
END;
$$;
