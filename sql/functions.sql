CREATE OR REPLACE FUNCTION calculate_fine(tid INT)
RETURNS INT AS $$
DECLARE
    d DATE;
    r DATE;
BEGIN
    SELECT due_date, return_date INTO d, r
    FROM borrow_transactions
    WHERE transaction_id = tid;

    IF r IS NULL AND CURRENT_DATE > d THEN
        RETURN (CURRENT_DATE - d) * 10;
    ELSIF r > d THEN
        RETURN (r - d) * 10;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;
