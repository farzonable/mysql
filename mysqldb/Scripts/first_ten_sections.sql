USE firstmillion;

CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

SELECT * FROM cats;
SELECT name FROM cats;
SELECT age FROM cats;
SELECT name, age FROM cats;
SELECT * FROM cats WHERE age=9;
SELECT name, age FROM cats WHERE age=4;

SELECT cat_id FROM cats;

SELECT name, breed FROM cats;

SELECT name, age FROM cats WHERE breed = 'Tabby';

SELECT cat_id, age FROM cats WHERE cat_id = age;

SELECT cat_id AS id, name FROM cats;

SELECT * FROM theofficeemployees;
UPDATE theofficeemployees SET first_name='Angela' WHERE first_name='Schrute';
UPDATE theofficeemployees SET last_name='Noelle Schrute' WHERE last_name='Angela';
SELECT * FROM cats;
UPDATE cats SET name='Jack' WHERE name='Jackson'
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo'
UPDATE cats SET age=12 WHERE breed='Maine Coon'
DELETE FROM cats WHERE name='Egg'
DELETE FROM cats WHERE cat_id=age
DELETE FROM cats

CREATE DATABASE shirts_db;
USE shirts_db;
CREATE TABLE shirts(
	shirt_id INT AUTO_INCREMENT PRIMARY KEY,
	article VARCHAR(10) NOT NULL,
	color VARCHAR(10) NOT NULL,
	shirt_size VARCHAR (1) NOT NULL,
	last_worn INT NOT NULL)

INSERT INTO shirts
(article, color, shirt_size, last_worn)
VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

INSERT INTO shirts 
(article, color, shirt_size, last_worn)
VALUES
('polo shirt', 'purple', 'M', 50)

SELECT article, color FROM shirts;
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M'

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt'
UPDATE shirts SET last_worn=0 WHERE last_worn=15
UPDATE shirts SET shirt_size='X', color='off_white'
DELETE FROM shirts WHERE last_worn=200
DELETE FROM shirts WHERE article='tank top'
DELETE FROM shirts
DROP TABLE shirts
SHOW TABLES;
DESC shirts;

CREATE DATABASE book_shop;
USE book_shop;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;
DESC books;
SELECT CONCAT('HELL', 'OOOOH')

SELECT CONCAT (author_fname,' ', author_lname) AS author_name FROM books;
SELECT CONCAT_WS (' ', author_fname, author_lname) AS author_name FROM books;
SELECT SUBSTR(title, 1, 15) AS short_name FROM books;
SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS short_title FROM books;
SELECT REPLACE('I have earned this month 1 million dollar in BTC', '1', '100')
SELECT REPLACE(title) FROM books;
SELECT CHAR_LENGTH(title) AS len, title FROM books;
SELECT CONCAT(author_fname, ' ', UCASE(author_lname)) AS author_name FROM books;
SELECT TRIM(' pickle ')

SELECT REPLACE (CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '-');
SELECT REPLACE (CONCAT(title), ' ', '->') from books;
SELECT CONCAT (UCASE(author_fname), ' ', UCASE(author_lname)) AS full_name_in_caps FROM books;
SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;
SELECT title, CHAR_LENGTH(title) AS len FROM books;
SELECT CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
		CONCAT(author_lname, ',', author_fname) as author,
		CONCAT(stock_quantity, ' in stock') as quantity 
		FROM books;
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT released_year FROM books;
SELECT DISTINCT CONCAT (author_fname, ' ', author_lname) as distinct_name FROM books;
SELECT DISTINCT author_fname, author_lname FROM books;	
SELECT book_id, author_fname, author_lname FROM books ORDER BY book_id;
SELECT book_id, author_fname, author_lname, title, released_year FROM books ORDER BY released_year;
SELECT title, pages FROM books ORDER BY pages;
SELECT book_id, title, released_year FROM books ORDER BY released_year DESC LIMIT 2, 5;

SELECT title, author_fname, author_lname FROM books WHERE author_fname LIKE '%da%';
SELECT * FROM books WHERE title LIKE '%:%';
SELECT * FROM books WHERE author_fname LIKE '_____';
SELECT * FROM books WHERE author_fname LIKE '%a';
SELECT * FROM books WHERE author_fname LIKE '%n';

SELECT title FROM books WHERE title LIKE '%stories%';
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 0, 1;
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 0, 3;
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity ASC LIMIT 0, 3;
SELECT title, author_lname FROM books ORDER BY author_lname ASC, title DESC;

SELECT COUNT(*) FROM books;
SELECT COUNT(author_fname) FROM books;
SELECT COUNT(DISTINCT released_year) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT * FROM books;
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
USE book_shop;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT MAX(pages) FROM books;
SELECT MIN(author_lname) FROM books;
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT author_fname, author_lname, COUNT(*) 
FROM books
GROUP BY author_fname, author_lname;

SELECT author_fname, author_lname, MIN(released_year) FROM books GROUP BY author_fname, author_lname;

SELECT 
	author_lname,
	COUNT(*) as books_written,
	MAX(released_year) AS latest_release,
	MIN(released_year) AS earliest_release,
	MAX(released_year) AS longest_page_count
FROM books GROUP BY author_lname;

SELECT
	author_lname,
	author_fname,
	COUNT(*) AS books_written,
	MAX(released_year) AS latest_release,
	MIN(released_year) AS earliest_release
FROM books GROUP BY author_lname, author_fname;

SELECT SUM(pages) FROM books;

SELECT author_lname, SUM(pages) FROM books GROUP BY author_lname;

SELECT author_lname, COUNT(*), SUM(released_year) FROM books GROUP BY author_lname;

SELECT released_year, AVG(stock_quantity), COUNT(*) FROM books GROUP BY released_year;
-- homework
SELECT COUNT(title) FROM books;
SELECT COUNT(*) FROM books;

SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

SELECT SUM(stock_quantity) FROM books;

SELECT AVG(released_year)
FROM books GROUP BY author_fname, author_lname;

SELECT CONCAT(author_fname, ' ', author_lname) AS full_name, 
pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT
	released_year AS year,
	COUNT(title) AS '# books',
	AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;

-- VARCHAR
CREATE DATABASE friends;
USE friends;
CREATE TABLE friends (name VARCHAR(10));
INSERT INTO friends (name) VALUES ('Tom'), ('Juan Pablo'), ('James');
SELECT * FROM friends;
SELECT CHAR_LENGTH(name) FROM friends;
CREATE TABLE parent (children TINYINT);
INSERT INTO parent(children) VALUES (2), (7), (0);
SELECT * FROM parent;

CREATE TABLE people (
	name VARCHAR(100),
	birthdate DATE,
	birthtime TIME,
	birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES
('Zara', '2000-12-12', '10:00:10', '2000-12-12 10:00:10'),
('Ilyas', '2000-10-01', '19:00:50', '2000-10-01 19:00:50');

SELECT * FROM people;

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES
('Lex', CURDATE(), CURTIME(), NOW());
SELECT birthdate FROM people;
SELECT 
	birthdate, 
	DAY(birthdate),
	DAYOFWEEK(birthdate),
	DAYOFYEAR(birthdate)
FROM people;

SELECT
	birthdate,
	MONTHNAME(birthdate),
	YEAR(birthdate)
FROM people;

SELECT
	name,
	birthtime,
	HOUR(birthtime)
FROM people;

SELECT
	name,
	birthtime,
	MINUTE(birthtime)
FROM people;

SELECT
	birthdt,
	MONTH(birthdt),
	DAY(birthdt),
	HOUR(birthdt),
	MINUTE(birthdt)
FROM people;

SELECT MONTHNAME(birthdate), DAY(birthdate), YEAR(birthdate) FROM people;

SELECT (CONCAT(
	MONTHNAME(birthdate), ' ', DAY(birthdate), ' ', YEAR(birthdate)))
	AS birthdate
FROM people;

