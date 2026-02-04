CREATE OR REPLACE VIEW fine_dashboard AS
SELECT
    s.student_id,
    s.name,
    COUNT(bt.transaction_id) AS total_borrows,
    COUNT(CASE WHEN bt.return_date > bt.due_date THEN 1 END) AS late_returns,
    SUM(bt.fine_amount) AS total_fine
FROM borrow_transactions bt
JOIN students s ON bt.student_id = s.student_id
GROUP BY s.student_id, s.name;
