<?php
$is_auth = rand(0, 1);

$user_name = 'Савелий'; // укажите здесь ваше имя

$cats = ['Доски и лыжи', 'Крепления', 'Ботинки', 'Одежда', 'Инструменты', 'Разное'];
$adverts = [
    ['name' => '2014 Rossignol District Snowboard', 'cat' => 'Доски и лыжи', 'price' => '10999', 'url' => 'img/lot-1.jpg', 'expiration' => '2021-09-21'],
    ['name' => 'DC Ply Mens 2016/2017 Snowboard', 'cat' => 'Доски и лыжи', 'price' => '159999', 'url' => 'img/lot-2.jpg', 'expiration' => '2021-09-22'],
    ['name' => 'Крепления Union Contact Pro 2015 года размер L/XL', 'cat' => 'Крепления', 'price' => '8000', 'url' => 'img/lot-3.jpg', 'expiration' => '2021-09-23'],
    ['name' => 'Ботинки для сноуборда DC Mutiny Charocal', 'cat' => 'Ботинки', 'price' => '10999', 'url' => 'img/lot-4.jpg', 'expiration' => '2021-09-24'],
    ['name' => 'Куртка для сноуборда DC Mutiny Charocal', 'cat' => 'Одежда', 'price' => '7500', 'url' => 'img/lot-5.jpg', 'expiration' => '2021-09-25'],
    ['name' => 'Маска Oakley Canopy', 'cat' => 'Разное', 'price' => '5400', 'url' => 'img/lot-6.jpg', 'expiration' => '2021-09-26']
];
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
