USE yeticave;

INSERT INTO categories (category_name, category_code)
VALUES
	('Доски и лыжи', 'boards'),
	('Крепления', 'attachment'),
	('Ботинки', 'boots'),
	('Одежда', 'clothing'),
	('Инструменты', 'tools'),
	('Разное', 'other');

INSERT INTO users (reg_date, email, user_name, pass)
VALUES
	('2020-09-15 13:00', 'p.ivan@gmail.com', 'Иван Петров', 'qweqwe123'),
	('2021-03-07 06:00', 'vasyliev1995@mail.ru', 'Сергей Васильев', 'qwerty12345');

INSERT INTO lots (creation_date, lot_name, image, start_price, exp_date, bet_range, creator_id, category_id)
VALUES
	('2021-09-27 00:00', '2014 Rossignol District Snowboard', 'img/lot-1.jpg', 10999, '2021-10-10 00:00', 1000, 1, 1),
	('2021-09-27 03:00', 'DC Ply Mens 2016/2017 Snowboard', 'img/lot-2.jpg', 159999, '2021-10-11 00:00', 2000, 1, 1),
	('2021-09-26 00:00', 'Крепления Union Contact Pro 2015 года размер L/XL', 'img/lot-3.jpg', 8000, '2021-10-12 15:00', 1000, 2, 2),
	('2021-09-25 00:00', 'Ботинки для сноуборда DC Mutiny Charocal', 'img/lot-4.jpg', 10999, '2021-10-13 00:00', 1000, 1, 3),
	('2021-09-24 20:00', 'Куртка для сноуборда DC Mutiny Charocal', 'img/lot-5.jpg', 7500, '2021-10-14 10:00', 500, 2, 4),
	('2021-09-24 17:00', 'Маска Oakley Canopy', 'img/lot-6.jpg', 5400, '2021-10-14 18:00', 500, 2, 6);

INSERT INTO bets (bet_date, price, user_id, lot_id)
VALUES
	('2021-09-28 11:00', 12000, 1, 1),
	('2021-09-29 07:00', 162000, 2, 2),
	('2021-09-28 22:00', 13000, 2, 1),
	('2021-09-29 15:00', 165000, 1, 2);

SELECT * FROM categories; # выбор всех категорий

SELECT lot_name, start_price, image, COALESCE(MAX(b.price), start_price) AS price, category_name FROM lots l LEFT JOIN bets b ON l.id = b.lot_id 
JOIN categories c ON l.category_id = c.id WHERE exp_date > NOW() GROUP BY l.id; # выбор открытых лотов

SELECT l.id, creation_date, lot_name, description, image, start_price, exp_date, bet_range, creator_id, winner_id, category_id, category_name FROM lots l
JOIN categories c ON l.category_id = c.id WHERE l.id = 5; # выбор лота по идентификатору

UPDATE lots SET lot_name = 'Маска Oakley Canopy' WHERE id = 6; # обновление названия лота

SELECT * FROM bets WHERE lot_id = 1 ORDER BY bet_date; # выбор ставок для лота с сортировкой