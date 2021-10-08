USE yeticave;

INSERT INTO categories SET category_name = 'Доски и лыжи', category_code = 'boards';
INSERT INTO categories SET category_name = 'Крепления', category_code = 'attachment';
INSERT INTO categories SET category_name = 'Ботинки', category_code = 'boots';
INSERT INTO categories SET category_name = 'Одежда', category_code = 'clothing';
INSERT INTO categories SET category_name = 'Инструменты', category_code = 'tools';
INSERT INTO categories SET category_name = 'Разное', category_code = 'other';

INSERT INTO lots SET creation_date = '2021-09-27 00:00', lot_name = '2014 Rossignol District Snowboard',
	image = 'img/lot-1.jpg', start_price = 10999, exp_date = '2021-10-10 00:00', creator_id = 1, category_id = 1;
INSERT INTO lots SET creation_date = '2021-09-27 03:00', lot_name = 'DC Ply Mens 2016/2017 Snowboard',
	image = 'img/lot-2.jpg', start_price = 159999, exp_date = '2021-10-11 00:00', creator_id = 1, category_id = 1;
INSERT INTO lots SET creation_date = '2021-09-26 00:00', lot_name = 'Крепления Union Contact Pro 2015 года размер L/XL',
	image = 'img/lot-3.jpg', start_price = 8000, exp_date = '2021-10-12 15:00', creator_id = 2, category_id = 2;
INSERT INTO lots SET creation_date = '2021-09-25 00:00', lot_name = 'Ботинки для сноуборда DC Mutiny Charocal',
	image = 'img/lot-4.jpg', start_price = 10999, exp_date = '2021-10-13 00:00', creator_id = 1, category_id = 3;
INSERT INTO lots SET creation_date = '2021-09-24 20:00', lot_name = 'Куртка для сноуборда DC Mutiny Charocal',
	image = 'img/lot-5.jpg', start_price = 7500, exp_date = '2021-10-14 10:00', creator_id = 2, category_id = 4;
INSERT INTO lots SET creation_date = '2021-09-24 17:00', lot_name = 'Маска Oakley Canopy',
	image = 'img/lot-6.jpg', start_price = 5400, exp_date = '2021-10-14 18:00', creator_id = 2, category_id = 6;
	
CREATE INDEX lot_name ON lots(lot_name); # Для поиска лота по названию

INSERT INTO users SET reg_date = '2020-09-15 13:00', email = 'p.ivan@gmail.com', user_name = 'Иван Петров', pass = 'qweqwe123';
INSERT INTO users SET reg_date = '2021-03-07 06:00', email = 'vasyliev1995@mail.ru', user_name = 'Сергей Васильев', pass = 'qwerty12345';

INSERT INTO bets SET bet_date = '2021-09-28 11:00', price = 12000, user_id = 1, lot_id = 1;
INSERT INTO bets SET bet_date = '2021-09-29 07:00', price = 162000, user_id = 2, lot_id = 2;

SELECT * FROM categories; # выбор всех категорий

SELECT lot_name, start_price, image, COALESCE(MAX(b.price), start_price) AS price, category_name FROM lots l LEFT JOIN bets b ON l.id = b.lot_id 
JOIN categories c ON l.category_id = c.id WHERE (TIMEDIFF(exp_date, NOW()) > 0) GROUP BY l.id; # выбор открытых лотов

SELECT l.id, creation_date, lot_name, description, image, start_price, exp_date, bet_range, creator_id, winner_id, category_id, category_name FROM lots l
JOIN categories c ON l.category_id = c.id WHERE l.id = 5; # выбор лота по идентификатору

UPDATE lots SET lot_name = 'Маска Oakley Canopy' WHERE id = 6; # обновление названия лота

SELECT * FROM bets WHERE lot_id = 1 ORDER BY bet_date; # выбор ставок для лота с сортировкой