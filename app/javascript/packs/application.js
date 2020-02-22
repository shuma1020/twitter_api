// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
require ('packs/application.js')


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require jquery
//= require jquery_ujs
//= require_tree .


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

  $("button").on("click", function() {
    $(".popup")
      .addClass("show")
      .fadeIn();
    // return false;
  });

  $("#close").on("click", function() {
    $(".popup").fadeOut();
    // return false;
  });

});