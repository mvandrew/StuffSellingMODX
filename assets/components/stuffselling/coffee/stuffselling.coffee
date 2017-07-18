(($) ->

  window.anchorAnimate = () -> # Анимация перехода по якорям
    $("a[href*='#']").on "click", (event) ->
      pattern = /#.*$/g
      hrefValue = pattern.exec($(@).attr("href"))[0]
      $("html, body").animate { scrollTop: $(hrefValue).offset().top + "px" }
      event.preventDefault()

  window.youtubeContainer = () -> # Формирование контейнера для youtube ролика
    $(".youtube").each ->
      # Подготовка превьюшки ролика
      youThumb = document.createElement "img"
      youThumb.setAttribute "src", "http://i.ytimg.com/vi/" + this.id + "/hqdefault.jpg"
      youThumb.setAttribute "class", "thumb"
      # Подготовка кнопки запуска
      youControl = document.createElement "div"
      youControl.setAttribute "class", "play"
      # Добавление новых элементов
      this.appendChild youThumb
      this.appendChild youControl
      # Обработка нажатия на контрол
      $(this).on "click", (event) ->
        youFrame = document.createElement "iframe"
        youFrame.setAttribute "src", "https://www.youtube.com/embed/" + @.id + "?autoplay=1&autohide=1&border=0&wmode=opaque&enablejsapi=1"
        youFrame.setAttribute "allowfullscreen", ""
        youFrame.style.width = @.style.width
        youFrame.style.height = @.style.height
        @.parentNode.replaceChild youFrame, @


  window.robotTest = () -> # Вставка проверки на робота
    setTimeout ->
      dateNow = new Date()
      $("form.order_form").each ->
        modeField = document.createElement "input"
        modeField.name = "mode"
        modeField.setAttribute "type", "hidden"
        curMonth = dateNow.getMonth() + 1
        curMonthStr = if curMonth < 10 then "0" + curMonth.toString() else curMonth.toString()
        curDay = dateNow.getDate()
        curDayStr = if curDay < 10 then "0" + curDay.toString() else curDay.toString()
        modeField.setAttribute "value", dateNow.getFullYear().toString() + curMonthStr + curDayStr
        @.appendChild modeField
    , 3e3


  window.validateOrderForm = () -> # Контроль заполнения формы для старых браузеров
    $("form.order_form").on "submit", (event) ->
      testResult = true
      # Проверка имени заказчика
      if @.name.value == ""
        alert "Введите Ваше имя"
        testResult = false
      if @.phone.value == ""
        alert "Введите Ваш номер телефона"
        testResult = false
      testResult



  popupToggleForm = () -> # Показывает модальную форму с данными для заказа
    if $(".pp_wrapper").css("display") == "none"
      $(".pp_wrapper").fadeIn 300, () ->
        $(".pp_form").fadeIn 500
    else
      $(".pp_form").fadeOut 500, () ->
        $(".pp_wrapper").fadeOut 300

  popupItemsInit = () -> # Инициализая элементов повышения конверсии
    #try # Подключена ли кнопка обратного звонка
    # callback_enabled = window.pop_callback_enabled
    #catch err
    # callback_enabled = false
    callback_enabled = true

    #try # Таймаут показа кнопки заказа звонка
    #  callback_timeout = window.pop_callback_timeout
    #catch err
    #  callback_timeout = 1e3
    callback_timeout = 1e3

    #try # Пол оператора на кнопке обратного звонка
    #  callback_gender = window.pop_callback_gender
    #catch err
    #  callback_gender = 0

    #try # Подключён ли Comebacker
    #  comebacker_enabled = window.pop_popup_enabled
    #catch err
    #  comebacker_enabled = false
    comebacker_enabled = true

    if callback_enabled or comebacker_enabled
      $(".pp_close").on "click", (eventData) ->
        popupToggleForm()
        eventData.preventDefault()

    if comebacker_enabled
      $(window).on "mouseout", (eventData) ->
        if $(".pp_wrapper").css("display") == "none" and eventData.pageY - $(window).scrollTop() < 1
          popupToggleForm()
          res = false

    if callback_enabled
      window.popupOperatorId = -1
      window.popupOperatorCount = 0
      $(".pop_call_cont").on "click", (eventData) ->
        popupToggleForm()
      setTimeout ->
        popupCallbackChangeOperator()
        $("#pop_callback_button").fadeIn()
        setInterval ->
          popupCallbackChangeOperator()
          $(".pop_call_cont").toggleClass "pop_call_spinner"
        , 3e3
      , callback_timeout

  popupCallbackChangeOperator = () -> # Изменение оператора на кнопке обратного вызова
    if $(".pop_call_cont").hasClass "pop_call_spinner"
      if window.popupOperatorCount < 1
        # Выбираем количество оборотов спиннера
        window.popupOperatorCount = Math.floor( Math.random() * 4) + 2

        # Выбираем оператора
        operatorAmount = 6
        curOperator = Math.floor( Math.random() * operatorAmount) + 1
        curOperator++ if curOperator == window.popupOperatorId
        curOperator = 1 if curOperator > 6
        window.popupOperatorId = curOperator

        # Формирование ссылки на изображение оператора
        imageUrl = 'url("' + window.ssAssetsUrl + 'images/call-phone-' + window.popupOperatorId.toString() + '.png")'
        $(".pop_call_front").css "background-image", imageUrl
      else
        window.popupOperatorCount--



  cpaInit = () -> # Инициализация взаимодействия с CPA сетями
    m1Enabled = $('body').attr 'data-m1-enabled'
    window.m1_cpaInit() if m1Enabled == "1"



  $(document).ready ->
    window.youtubeContainer()
    window.robotTest()
    window.validateOrderForm()
    window.anchorAnimate()

    cpaInit()

    popupItemsInit()

) jQuery