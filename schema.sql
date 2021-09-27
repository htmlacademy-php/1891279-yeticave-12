CREATE DATABASE yeticave
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE UTF8_GENERAL_CI;

USE YETICAVE;
CREATE TABLE cats (
	id INT AUTO_INCREMENT PRIMARY KEY,
	cat_name VARCHAR(12),
	cat_code VARCHAR(10)
);
CREATE UNIQUE INDEX cat_name ON cats(cat_name);
CREATE UNIQUE INDEX cat_code ON cats(cat_code);

CREATE TABLE lots (
	id INT AUTO_INCREMENT PRIMARY KEY,
	creation_date TIMESTAMP,
	lot_name CHAR,
	description CHAR,
	image CHAR,
	start_price INT,
	exp_date TIMESTAMP,
	bet_range INT,
	creator_id INT,
	winner_id INT,
	cat_id TINYINT
);

CREATE TABLE bets (
	id INT AUTO_INCREMENT PRIMARY KEY,
	bet_date TIMESTAMP,
	price INT,
	user_id INT,
	lot_id INT
);

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	reg_date TIMESTAMP,
	email CHAR,
	user_name CHAR,
	pass CHAR,
	contacts CHAR,
	lot_id INT,
	bet_id INT
);
CREATE UNIQUE INDEX email ON users(email);
