-- comparison and logical operators
USE book_shop;
-- not equal => not 
SELECT title FROM books WHERE released_year != 2017;
-- NOT LIKE 
SELECT title, author_fname, author_lname FROM books
WHERE author_fname NOT LIKE 'da%';
-- greater than >
SELECT * FROM books WHERE released_year > 2000;
SELECT 80 > 40; -- 1 means true, this is a boolean value
-- less than or equal to
SELECT * FROM books WHERE pages <= 600;
-- AND
SELECT title, author_lname, released_year FROM books
WHERE released_year > 2010 AND author_lname = 'Eggers';
SELECT * FROM books
WHERE author_lname = 'Eggers'
AND released_year > 2010
AND title LIKE '%novel%';

-- OR 
SELECT * FROM books WHERE author_lname = 'Eggers' OR pages < 500;


