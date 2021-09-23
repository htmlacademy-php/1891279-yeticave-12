<section class="promo">
    <h2 class="promo__title">Нужен стафф для катки?</h2>
    <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
    <ul class="promo__list">
        <!--заполните этот список из массива категорий-->
        <?php foreach ($cats as $category):?>
            <li class="promo__item promo__item--boards">
                <a class="promo__link" href="pages/all-lots.html"><?=hsc($category) ?></a>
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
        <?php foreach ($adverts as $lot):?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?=$lot['url'] ?>" width="350" height="260" alt="">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?=hsc($lot['cat']) ?></span>
                    <h3 class="lot__title"><a class="text-link" href="pages/lot.html"><?=hsc($lot['name']) ?></a></h3>
                    <div class="lot__state">
                        <div class="lot__rate">
                            <span class="lot__amount">Стартовая цена</span>
                            <span class="lot__cost"><?=price_format($lot['price']) ?></span>
                        </div>
                        <?php list($hours, $minutes) = date_range($lot['expiration']) ?>
                        <div class="lot__timer timer <?php if ($hours === '00'): ?>timer--finishing<?php endif ?>">
                            <?=hsc($hours . ':' . $minutes) ?>
                        </div>
                    </div>
                </div>
            </li>
        <?php endforeach ?>
    </ul>
</section>
