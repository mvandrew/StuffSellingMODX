(($) ->

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



  $(document).ready ->
    window.youtubeContainer()

) jQuery