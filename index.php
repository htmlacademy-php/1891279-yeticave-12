<?php
    $is_auth = rand(0, 1);

    $user_name = 'Савелий';

    function price_format($input) {
        $input = ceil($input);
        return number_format($input, 0, ".", " ") . ' <b class="rub">р</b>';
    }
    function hsc($input) {
        $input = htmlspecialchars($input, ENT_QUOTES, 'UTF-8');
        return $input;
    }
    function date_range($input) {
        $input = strtotime($input);
        $input -= time();
        $input = floor($input / 60);
        $hours = str_pad(floor($input / 60), 2, '0', STR_PAD_LEFT);
        $minutes = str_pad(($input % 60), 2, '0', STR_PAD_LEFT);
        $input = [$hours, $minutes];
        return $input;
    }
    require 'helpers.php';
    $page_title = 'Главная';
    $main = include_template ('main.php', ['cats' => $cats, 'adverts' => $adverts]);
    $layout = include_template ('layout.php', ['main' => $main, 'user_name' => $user_name, 'page_title' => $page_title, 'is_auth' => $is_auth, 'cats' => $cats]);
    echo $layout;
?>
