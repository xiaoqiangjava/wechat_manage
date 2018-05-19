(function() {
  'use strict';
  function trimBlankFunc(str) {
	    return str.replace(/^\s*|\s*$/g, "");
	};
  function initTab() {
    $('.main-tab').each(function() {
      var tabs = $('.main-tab__tab', this);
      var contents = $('.main-tab__content', this);

      tabs.on('click', function() {
        var index = $(this).index();
        tabs.removeClass('main-tab__tab--current').eq(index).addClass('main-tab__tab--current');
        contents.removeClass('main-tab__content--current').eq(index).addClass('main-tab__content--current');
      });

      var initIndex = tabs.filter('.main-tab__tab--current').index();
      if (initIndex < 0) {
        initIndex = 1;
      }

      tabs.eq(initIndex).trigger('click');
    });
  }
//fix Firefox Frame Height
  function fixFirefoxFrameHeight() {
    var frame = $('#js-frame');
    if (frame.length) {
      frame.css({minHeight: 0});
      window.setTimeout(function() {
        frame.css({minHeight: ''});
      });
    }
  };

  $(function() {
    fixFirefoxFrameHeight();
    initTab();
  });
//非法字符校验
  function checkChar(str) {
  	var result = "";
      var wordsArray = new Array("％","%","*", "●", "▲", "■", "@", "＠", "◎", 
      		"★", "※", "＃", "〓", "＼", "§", "☆", "○", "◇", "◆", "□", "△", "＆", 
      		"＾", "￣", "＿","♂","♀","Ю","┭","①","「","」","≮","§","￡","∑","『","』",
      		"⊙","∷","Θ","の","↓","↑","Ф","~","Ⅱ","∈","┣"," ┫","╋","﹉", "＃",
      		"＠", "＆", "＊", "※", "§", "〃", "№", "〓", "○","●", "△", "▲", "◎", "☆", "★",
      		"◇", "◆", "■", "□", "▼", "▽","㊣", "℅", "ˉ", "￣", "＿", "﹍", "﹊", "﹎", "﹋", 
      		"﹌", "﹟", "﹠","﹡", "♀", "♂", "?", "⊙", "↑", "↓", "←", "→", "↖", "↗", "↙","↘", 
      		"┄", "︴", "﹏", "（", "）", "︵", "︶", "｛", "｝", "︷","︸", "〔", "〕", "︹", "︺", 
      		"【", "】", "︻", "︼", "《", "》", "︽","︾", "〈", "〉", "︿", "﹀", "「", "」", 
      		"﹁", "﹂", "『", "』", "﹃","﹄", "﹙", "﹚", "﹛", "﹜", "﹝", "﹞", 
      		"\"", "〝", "〞", "ˋ","ˊ", "≈", "≡", "≠", "＝", "≤", "≥", "＜", "＞", "≮", "≯", "∷",
      		"±", "＋", "×", "÷", "／", "∫", "∮", "∝", "∧", "∨", "∞","∑", "∏", "∪", "∩", "∈", 
      		"∵", "∴", "⊥", "∥", "∠", "⌒", "⊙","≌", "∽", "√", "≦", "≧", "≒", "≡", "﹢", "﹣", 
      		"﹤", "﹥", "﹦","～", "∟", "⊿", "∥", "㏒", "㏑", "∣", "｜", "︱", "︳", "|", "／","＼", "∕", 
      		"﹨", "¥", "€", "￥", "£", "®", "™", "©", "々","～", "‖", "ˇ", "ˉ", "&", "*", "#", "`", "~",
      		"=", "(", ")", "^","$", "@", "\\", "/", ">", "<", "[", "]", "{", "}");
      var len = wordsArray.length;
      for (var i = 0; i < len; i++) {
          if (str.indexOf(wordsArray[i]) != -1) {
          	result = wordsArray[i];
          	break;
          }
      }
      if(result != ""){
      	return true;
      }else{
      	return false;
      }
  }

})();
