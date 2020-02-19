
  $(function() {

  //マウスを乗せたら発動
  $('.header-title').mouseover(function() {

    //マウスを乗せたら色が変わる
    $(this).animate({fontSize : '36px'}, 500);

  //ここにはマウスを離したときの動作を記述
  }).mouseout(function() {

    //アニメーションしながらテキストサイズが元のサイズに戻る
    $(this).animate({fontSize : '24px'}, 500);

  });
});