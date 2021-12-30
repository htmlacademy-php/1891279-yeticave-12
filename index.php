<?php
    $is_auth = rand(0, 1);

    $user_name = 'Савелий';

    require 'helpers.php';

    $con = mysqli_connect("localhost", "root", "", "yeticave");
    if (!$con) {
        echo "Ошибка: " . mysqli_connect_error();
    }
    mysqli_set_charset($con, "utf8mb4");
    $query = 'SELECT `l`.`id`, `image`, `category_name`, `lot_name`, `start_price`, `exp_date` FROM `lots` `l` JOIN `categories` `c` ON `l`.`category_id` = `c`.`id`';
    $result_lots = mysqli_query($con, $query);
    if (!$result_lots) {
        echo "Ошибка: " . mysqli_error($con);
    }
    $result_lots = mysqli_fetch_all($result_lots, MYSQLI_ASSOC);

    $query = 'SELECT `category_name`, `category_code` FROM `categories`';
    $result_categories = mysqli_query($con, $query);
    if (!$result_categories) {
        echo "Ошибка: " . mysqli_error($con);
    }
    $result_categories = mysqli_fetch_all($result_categories, MYSQLI_ASSOC);

    $page_title = 'Главная';
    $main = include_template ('main.php', ['result_categories' => $result_categories, 'result_lots' => $result_lots]);
    $layout = include_template ('layout.php', ['main' => $main, 'user_name' => $user_name, 'result_categories' => $result_categories, 'page_title' => $page_title, 'is_auth' => $is_auth]);
    echo $layout;
