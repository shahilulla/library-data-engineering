CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    join_date DATE,
    status VARCHAR(20)
);

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    available_copies INT
);

CREATE TABLE borrow_transactions (
    transaction_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    book_id INT REFERENCES books(book_id),
    borrow_date DATE,
    due_date DATE,
    return_date DATE,
    fine_amount NUMERIC(10,2)
);
