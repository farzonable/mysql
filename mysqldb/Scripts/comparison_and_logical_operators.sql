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
SELECT title FROM books WHERE pages BETWEEN 200 and 300;
SELECT title FROM books WHERE pages NOT BETWEEN 200 and 300;
-- comparing dates
SHOW databases;
USE friends;
SELECT * FROM people WHERE birthdate < '2005-01-01';
-- CAST 
SELECT CAST('09:00:00' AS TIME); -- the data is a string, after casting, it's time
SELECT * FROM people WHERE birthtime
BETWEEN CAST('12:00:00' AS TIME)
AND CAST('16:00.00' AS TIME);
SELECT * FROM people WHERE HOUR(birthtime)
BETWEEN 12 and 16;
-- IN
USE book_shop;
SELECT title, author_lname FROM books WHERE author_lname IN('Carver', 'Smith');
SELECT title, author_lname FROM books WHERE author_lname NOT IN('Carver', 'Smith');
-- %
SELECT 10 % 4;
-- IS NULL
USE book_shop;
SELECT * FROM books WHERE title IS NULL;
INSERT INTO books (title, author_lname, author_fname)
VALUES (DEFAULT, NULL, NULL);
DELETE FROM books WHERE title IS NULL;

-- Exercise
SELECT 10 != 10;
SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10;
SELECT 15 > 14 AND 99 - 5 <= 94;

SELECT * FROM books WHERE released_year < 1980;
SELECT * FROM books WHERE author_lname = 'Eggers' OR 'Chabbon';
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE author_lname LIKE 'C%' OR 'S%';
SELECT title, author FROM books WHERE title LIKE IF
'%stories%' AS 'Short Stories',
'%kids&' AND '%heartbreaking%' AS 'Memoir',
ELSE AS 'Novel'; -- non sence, but a nice try
SELECT title, author_lname,
CASE
	WHEN title LIKE '%stories%' THEN 'Short Stories'
	WHEN title = 'Just Kids' OR title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
	ELSE 'Novel'
END AS TYPE
FROM books;