(function() {
  'use strict';

  var win = window;
  var _ = win.utils || (win.utils = {});
  var topWin = win.top;
  var inFrame = topWin !== win;
  var doc = win.document;
  var topDoc = topWin.document;
  var $ = win.jQuery;

  // __inline('../../_env/_env.js')

  // __inline('component/_pseudo.js')
  // __inline('component/_date-placeholder.js')
  // __inline('component/_number-input.js')
  // __inline('component/_meter.js')
  // __inline('component/_progress.js')
  // __inline('component/_number-password.js')
  
  var dialogContainer;
  function getDialogContainer() {
    if (dialogContainer) {
      return dialogContainer;
    }

    var body = $('body');
    dialogContainer = body;
    if (inFrame) {
      var dialogContainerId = 'js-dialog-container';
      dialogContainer = $('#' + dialogContainerId, topDoc);
      if (!dialogContainer.length) {
        dialogContainer = $('<div id="' + dialogContainerId + '">').appendTo($('body', topDoc));
      }
    }
    return dialogContainer;
  }

  if (inFrame) {
    $(function() {
      getDialogContainer().empty();
    });
    $(window).on('unload beforeunload', function() {
      getDialogContainer().empty();
    });
  }

  function getDialog(selector) {
    if (selector.jquery) {
      return selector;
    }
    var el = $(selector, doc);

    if (!el.length) {
      el = $(selector, topDoc);
    }

    return el;
  }

  function dialogResize() {
    $(window).on('resize', function() {
      $('.dialog:visible').each(function() {
        resizeDialog(this);
      });
    });
  }

  function resizeDialog(dialog) {
    var main = $('.dialog__main', dialog);
    var winHeight = $(win).height();
    var offsetY = - Math.min(winHeight, main.outerHeight()) / 2;

    main.css({
      marginLeft: -main.outerWidth() / 2,
      marginTop: offsetY
    });
  }

  function showDialog(el) {
    el = getDialog(el);

    if (!el.data('inited')) {
      var mask = $('<div class="dialog__mask">').prependTo(el);
      el.on('click', '.js-close', function() {
        el.removeClass('dialog--show');
      });
      el.on('click', '.dialog__main', function(e) {
        e.stopPropagation();
      });
      if (el.hasClass('dialog--closeable')) {
        mask.on('click', function() {
          el.removeClass('dialog--show');
        });
      }
      el.data('inited', true);
    }

    el.addClass('dialog--show');
    resizeDialog(el);
    return el;
  }

  function hideDialog(el) {
    el = getDialog(el);
    el.removeClass('dialog--show');
  }

  var popMsg = (function() {
    var actions = {
      remove: function() {
        return this.remove();
      },
      close: function() {
        return hideDialog(this);
      },
      show: function() {
        return showDialog(this);
      },
      hide: function() {
        return this.remove();
      }
    };

    var btns = {
     
      confirm: {
        text: '确定',
        classes: 'btn--primary',
        action: actions.remove
      },
     cancel: {
         text: '取消',
         classes: 'btn--grayblue',
         action: actions.remove
       }
    };

    var defaultOptions = {
      title: '',
      text: '',
      btns: [
        btns.confirm
      ],
      closeable: false
    };

    var html = [
      '<div class="dialog msg">',
        '<div class="dialog__main msg__main">',
          '<div class="dialog__header msg__header"></div>',
          '<div class="dialog__body msg__body">',
            '<div class="msg__message">',
            '</div>',
          '</div>',
          '<div class="dialog__footer msg__footer">',
          '</div>',
        '</div>',
      '</div>'
    ].join('')

    function popMsg(options) {
      if (typeof options === 'string') {
        options = {
          text: options
        };
      }

      options = $.extend({}, defaultOptions, options);

      var dialog = $(html).appendTo('body');
      var message = dialog.find('.msg__message');
      var footer = dialog.find('.msg__footer');
      var header = dialog.find('.msg__header');

      if (options.closeable) {
        dialog.addClass('dialog--closeable');
      }

      if (options.title) {
        header.text(options.title);
      } else {
        header.remove();
      }

      if (options.text) {
        message.text(options.text);
      } else if (options.html) {
        message.html(options.html);
      }

      var msgObj = {
        el: dialog,
        close: actions.close.bind(dialog),
        show: actions.show.bind(dialog),
        remove: actions.remove.bind(dialog),
        hide: actions.hide.bind(dialog)
      };


      $.each(options.btns || [], function(_, btnOptions) {
        var action = btnOptions.action || 'remove';
        if (typeof action === 'string') {
          action = msgObj[action] || $.noop;
        }
        var button = $('<button type="button" class="btn">' + btnOptions.text + '</button>').on('click', action.bind(msgObj)).appendTo(footer);
        if (btnOptions.classes) {
          button.addClass(btnOptions.classes)
        }
      });

      showDialog(dialog);
      return msgObj;
    }

    $.extend(popMsg, {
      BTN: btns,
      ACTION: actions
    });
    return popMsg;
  })();


  // 表格添加垂直滚动框
  function initScrollableTable() {
    $('.js-scrollable-table').each(function() {
      var container = $(this);
      var table = container.find('table');
      var thead = table.find('thead');
      var th = thead.find('th');

      var fakeHeadContainer = $('<div class="scrollable-table-head"></div>').appendTo(container);
      var fakeTable = table.clone().html('').appendTo(fakeHeadContainer);
      var fakeHead = thead.clone().appendTo(fakeTable);
      $(window).on('resize', function() {
        fakeHead.find('th').each(function(index) {
          $(this).css({
              width: th.eq(index).outerWidth()
          });
        });
      }).trigger('resize');
      container.on('scroll', function() {
        fakeHeadContainer.css({
            top: $(this).scrollTop()
        });
      });
    });
  }

  function tabControl(el) {
    var tabCurrentClass = 'tab-control__tab--current';
    var contentCurrentClass = 'tab-control__content--current';
    $(el).each(function() {
      var tabs = $('.tab-control__tab', this);
      var contents = $('.tab-control__content', this);

      tabs.on('click', function() {

        tabs.removeClass('tab-control__tab--current');
        var index = $(this).addClass(tabCurrentClass).index();
        contents.removeClass(contentCurrentClass)
          .eq(index).addClass(contentCurrentClass);
        return false;
      });

      var defaultIndex = tabs.filter('.' + tabCurrentClass).index();
      if (defaultIndex < 0) {
        defaultIndex = 0;
      }
      tabs.eq(defaultIndex).trigger('click');
    });
  }
  var initTimepicker = (function() {
    var now = new Date();

    function pad(s) {
      return ('00' + s).slice(-2);
    }

    function setValue(input, values) {
      var v = [
        pad(values[0]),
        pad(values[1]),
        pad(values[2])
      ].join(':');
      input.val(v).trigger('change');
    }

    function blurTimepicker() {
      $('.timepicker__options').css({
        display: 'none'
      });
      $('.timepicker__btn').removeClass('timepicker__btn--focus');
    }

    function initTimepicker(el) {
      var container = $(el);
      if (container.hasClass('timepicker--inited')) {
        return;
      }
      container.addClass('timepicker--inited')
      var display = $('<div class="form__query timepicker__display">').appendTo(container);
      var input = $('.timepicker__value', container);

      // input.on('change', function() { console.log(this.value); });

      var values = input.val();
      if (!values) {
        values = [
          now.getHours(),
          now.getMinutes(),
          0
          // now.getSeconds()
        ];
        setValue(input, values);
      } else {
        values = $.map(values.split(':'), function(value) {
          return + value;
        });
      }


      $.each([
        {
          key: 'hours',
          name: '时',
          total: 24
        },
        {
          key: 'minutes',
          name: '分',
          total: 60
        },
        {
          key: 'seconds',
          name: '秒',
          total: 60
        }
      ], function(index, o) {
        if (index) {
          display.append(':');
        }
        var btn = $('<button class="timepicker__btn" type="button">' + pad(values[index]) + '</button>').appendTo(display);
        var picker = $([
          '<div class="timepicker__options timepicker__options--' + o.key + '">',
            '<div class="timepicker__option-key">' + o.name + '</div>',
            '<div class="timepicker__option-list"></div>',
          '</div>'
        ].join('')).appendTo(container);

        var optionsContainer = $('.timepicker__option-list', picker);
        var options = [];

        var currentValue = values[index];
        for (var i = 0; i < o.total; i++) {
          options[i] = $([
            '<button ',
            'class="timepicker__option' + (i === currentValue ? ' timepicker__option--current' : '') + '" ',
            'type="button">',
            index ? pad(i) : i,
            '</button>'
          ].join('')).appendTo(optionsContainer)[0];
        }

        options = $(options);

        btn.on('click', function(e) {
          blurTimepicker();
          picker.css({
            display: 'block'
          });
          $(this).addClass('timepicker__btn--focus');
          e.stopPropagation();
        });

        optionsContainer.on('click', 'button', function(e) {
          var option = $(this);
          var v = option.index();
          values[index] = v;
          options.removeClass('timepicker__option--current');
          option.addClass('timepicker__option--current');
          btn.text(pad(v));
          values[index] = v;
          setValue(input, values);
        });
      });
    }


    $(document).on('click', blurTimepicker);

    return function(el) {
      return $(el).each(function() {
        initTimepicker(this);
      });
    };
  })();

  $(function() {
    initScrollableTable();
    dialogResize();
    tabControl('.js-tab-control');
    initTimepicker('.js-timepicker');
  });

  $.extend(_, {
    showDialog: showDialog,
    hideDialog: hideDialog,
    msg: popMsg,
    tabControl: tabControl,
    initTimepicker: initTimepicker
  });
})();
function errorAlert(msg) {
    utils.msg({
        title: '错误提示',
        html: '<img onload="$(this).parent().attr(\'style\',\'width=100%;text-align:center;\');" style="width: 80px;height: 80px;" src="data:image/png;base64,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"><div>' + msg + '</div>',
        btns: [
            {
                text: '确定',
                classes: 'btn--green',
                action: utils.msg.ACTION.remove
            },
        ]
    });
}