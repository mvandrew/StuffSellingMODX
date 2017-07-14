<div class="popup_section">
    <div class="pp_wrapper"></div>
    <div class="pp_form"><a class="pp_close"></a>
        <div class="pp_title">Вам понравилось это предложение?</div>
        <div class="pp_body">
            <p class="pp_about">Мы расскажем Вам все об этом товаре, предложим наилучшие условия и ознакомим с подходящими акционными
                предложениями!</p>

            <form class="order_form" action="/order.php" method="post">
                <input type="text" name="name" placeholder="Как Вас зовут?" required>
                <input type="text" name="phone" placeholder="Ваш номер телефона" required>

                <button class="pp_button"><span>Перезвоните мне</span></button>

                [[$ssOrderFields]]
            </form>

            <p class="pp_operator">Оператор перезвонит Вам через 5-10 минут</p>

        </div>
    </div>
</div>