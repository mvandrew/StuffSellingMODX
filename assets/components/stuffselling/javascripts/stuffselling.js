// Generated by CoffeeScript 1.12.6
(function() {
  (function($) {
    var cpaInit, popupCallbackChangeOperator, popupItemsInit, popupToggleForm;
    window.anchorAnimate = function() {
      return $("a[href*='#']").on("click", function(event) {
        var hrefValue, pattern;
        pattern = /#.*$/g;
        hrefValue = pattern.exec($(this).attr("href"))[0];
        $("html, body").animate({
          scrollTop: $(hrefValue).offset().top + "px"
        });
        return event.preventDefault();
      });
    };
    window.youtubeContainer = function() {
      return $(".youtube").each(function() {
        var youControl, youThumb;
        youThumb = document.createElement("img");
        youThumb.setAttribute("src", "http://i.ytimg.com/vi/" + this.id + "/hqdefault.jpg");
        youThumb.setAttribute("class", "thumb");
        youControl = document.createElement("div");
        youControl.setAttribute("class", "play");
        this.appendChild(youThumb);
        this.appendChild(youControl);
        return $(this).on("click", function(event) {
          var youFrame;
          youFrame = document.createElement("iframe");
          youFrame.setAttribute("src", "https://www.youtube.com/embed/" + this.id + "?autoplay=1&autohide=1&border=0&wmode=opaque&enablejsapi=1");
          youFrame.setAttribute("allowfullscreen", "");
          youFrame.style.width = this.style.width;
          youFrame.style.height = this.style.height;
          return this.parentNode.replaceChild(youFrame, this);
        });
      });
    };
    window.robotTest = function() {
      return setTimeout(function() {
        var dateNow;
        dateNow = new Date();
        return $("form.order_form").each(function() {
          var curDay, curDayStr, curMonth, curMonthStr, modeField;
          modeField = document.createElement("input");
          modeField.name = "mode";
          modeField.setAttribute("type", "hidden");
          curMonth = dateNow.getMonth() + 1;
          curMonthStr = curMonth < 10 ? "0" + curMonth.toString() : curMonth.toString();
          curDay = dateNow.getDate();
          curDayStr = curDay < 10 ? "0" + curDay.toString() : curDay.toString();
          modeField.setAttribute("value", dateNow.getFullYear().toString() + curMonthStr + curDayStr);
          return this.appendChild(modeField);
        });
      }, 3e3);
    };
    window.validateOrderForm = function() {
      return $("form.order_form").on("submit", function(event) {
        var testResult;
        testResult = true;
        if (this.name.value === "") {
          alert("Введите Ваше имя");
          testResult = false;
        }
        if (this.phone.value === "") {
          alert("Введите Ваш номер телефона");
          testResult = false;
        }
        return testResult;
      });
    };
    popupToggleForm = function() {
      if ($(".pp_wrapper").css("display") === "none") {
        return $(".pp_wrapper").fadeIn(300, function() {
          return $(".pp_form").fadeIn(500);
        });
      } else {
        return $(".pp_form").fadeOut(500, function() {
          return $(".pp_wrapper").fadeOut(300);
        });
      }
    };
    popupItemsInit = function() {
      var callback_enabled, callback_timeout, comebacker_enabled;
      callback_enabled = true;
      callback_timeout = 1e3;
      comebacker_enabled = true;
      if (callback_enabled || comebacker_enabled) {
        $(".pp_close").on("click", function(eventData) {
          popupToggleForm();
          return eventData.preventDefault();
        });
      }
      if (comebacker_enabled && !window.device.mobile()) {
        $(window).on("mouseout", function(eventData) {
          var res;
          if ($(".pp_wrapper").css("display") === "none" && eventData.pageY - $(window).scrollTop() < 1) {
            popupToggleForm();
            return res = false;
          }
        });
      }
      if (callback_enabled && !window.device.mobile()) {
        window.popupOperatorId = -1;
        window.popupOperatorCount = 0;
        $(".pop_call_cont").on("click", function(eventData) {
          return popupToggleForm();
        });
        return setTimeout(function() {
          popupCallbackChangeOperator();
          $("#pop_callback_button").fadeIn();
          return setInterval(function() {
            popupCallbackChangeOperator();
            return $(".pop_call_cont").toggleClass("pop_call_spinner");
          }, 3e3);
        }, callback_timeout);
      }
    };
    popupCallbackChangeOperator = function() {
      var curOperator, imageUrl, operatorAmount;
      if ($(".pop_call_cont").hasClass("pop_call_spinner")) {
        if (window.popupOperatorCount < 1) {
          window.popupOperatorCount = Math.floor(Math.random() * 4) + 2;
          operatorAmount = 6;
          curOperator = Math.floor(Math.random() * operatorAmount) + 1;
          if (curOperator === window.popupOperatorId) {
            curOperator++;
          }
          if (curOperator > 6) {
            curOperator = 1;
          }
          window.popupOperatorId = curOperator;
          imageUrl = 'url("' + window.ssAssetsUrl + 'images/call-phone-' + window.popupOperatorId.toString() + '.png")';
          return $(".pop_call_front").css("background-image", imageUrl);
        } else {
          return window.popupOperatorCount--;
        }
      }
    };
    window.checkMobile = function() {
      var isMobileVersion, mobURL, mobileUrl;
      isMobileVersion = $('body').attr('data-is-mobile');
      mobileUrl = $('body').attr('data-mobile-url');
      if (window.device.mobile() && isMobileVersion !== '1' && mobileUrl.length > 0) {
        mobURL = mobileUrl + document.location.search;
        return window.location.replace(mobURL);
      }
    };
    cpaInit = function() {
      var m1Enabled;
      m1Enabled = $('body').attr('data-m1-enabled');
      if (m1Enabled === "1") {
        return window.m1_cpaInit();
      }
    };
    return $(document).ready(function() {
      window.checkMobile();
      window.youtubeContainer();
      window.robotTest();
      window.validateOrderForm();
      window.anchorAnimate();
      cpaInit();
      return popupItemsInit();
    });
  })(jQuery);

}).call(this);
