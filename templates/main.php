<?php
    $con = mysqli_connect("localhost", "root", "", "yeticave");
    if (!$con) {
        echo "Ошибка: " . mysqli_connect_error();
    }
    mysqli_set_charset($con, "utf8mb4");
    $query = 'SELECT * FROM lots l JOIN categories c ON l.category_id = c.id';
    $result_lots = mysqli_query($con, $query);
    if (!$result_lots) {
        echo "Ошибка: " . mysqli_error($con);
    }
    $result_lots = mysqli_fetch_all($result_lots, MYSQLI_ASSOC);

    $query = 'SELECT category_name, category_code FROM categories';
    $result_categories = mysqli_query($con, $query);
    if (!$result_categories) {
        echo "Ошибка: " . mysqli_error($con);
    }
    $result_categories = mysqli_fetch_all($result_categories, MYSQLI_ASSOC);
?>
<section class="promo">
    <h2 class="promo__title">Нужен стафф для катки?</h2>
    <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
    <ul class="promo__list">
        <!--заполните этот список из массива категорий-->
        <?php foreach ($result_categories as $category):?>
            <li class="promo__item promo__item--<?=hsc($category['category_code']) ?>">
                <a class="promo__link" href="pages/all-lots.html"><?=hsc($category['category_name']) ?></a>
            </li>
        <?php endforeach ?>
    </ul>
</section>
<section class="lots">
    <div class="lots__header">
        <h2>Открытые лоты</h2>
    </div>
    <ul class="lots__list">
        <!--заполните этот список из массива с товарами-->
        <?php foreach ($result_lots as $lot):?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?=$lot['image'] ?>" width="350" height="260" alt="">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?=hsc($lot['category_name']) ?></span>
                    <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?=hsc($lot['lot_name']) ?></a></h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount">Стартовая цена</span>
                            <span class="lot__cost"><?=price_format($lot['start_price']) ?></span>
                        </div>
                        <?php list($hours, $minutes) = date_range($lot['exp_date']) ?>
                        <div class="lot__timer timer <?php if ($hours === '00'): ?>timer--finishing<?php endif ?>">
                            <?=hsc($hours . ':' . $minutes) ?>
                        </div>
                    </div>
                </div>
            </li>
        <?php endforeach ?>
    </ul>
</section>
