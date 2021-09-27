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
	bet_range INT
);
CREATE INDEX creation_date ON lots(creation_date);
CREATE INDEX lot_name ON lots(lot_name);
CREATE INDEX description ON lots(description);
CREATE UNIQUE INDEX image ON lots(image);
CREATE INDEX start_price ON lots(start_price);
CREATE INDEX exp_date ON lots(exp_date);
CREATE INDEX bet_range ON lots(bet_range);

CREATE TABLE bets (
	id INT AUTO_INCREMENT PRIMARY KEY,
	bet_date TIMESTAMP,
	price INT
);
CREATE INDEX bet_date ON bets(bet_date);
CREATE INDEX price ON bets(price);

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	reg_date TIMESTAMP,
	email CHAR,
	user_name CHAR,
	pass CHAR,
	contacts CHAR
);
CREATE INDEX reg_date ON users(reg_date);
CREATE UNIQUE INDEX email ON users(email);
CREATE UNIQUE INDEX user_name ON users(user_name);
CREATE INDEX pass ON users(pass);
CREATE INDEX contacts ON users(contacts);lots