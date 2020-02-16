$(function() {
  
  $('.bottom-content__item__category').mouseover(function(){
    $('.bottom-content__item__category__menu').toggle(true);
    $('.bottom-content__item__category__part').addClass("categoryselect");
  });

  $('.bottom-content__item__category').mouseout(function(){
    $('.bottom-content__item__category__menu').toggle(false);
    $('.bottom-content__item__category__part').removeClass("categoryselect");
  });

  $('.bottom-content__item__category__menu__list__ladies').mouseover(function(){
    $('.bottom-content__item__category__menu__list__ladies__list').toggle(true);
    $('.bottom-content__item__category__menu__list__ladies__Atag').addClass("tagselect1");
  });

  $('.bottom-content__item__category__menu__list__ladies').mouseout(function(){
    $('.bottom-content__item__category__menu__list__ladies__list').toggle(false);
    $('.bottom-content__item__category__menu__list__ladies__Atag').removeClass("tagselect1");
  });

  $('.bottom-content__item__category__menu__list__ladies__list__tops').mouseover(function(){
    $('.bottom-content__item__category__menu__list__ladies__list__tops__list').toggle(true);
    $('.bottom-content__item__category__menu__list__ladies__list__tops__Atag').addClass("tagselect2");
  });

  $('.bottom-content__item__category__menu__list__ladies__list__tops').mouseout(function(){
    $('.bottom-content__item__category__menu__list__ladies__list__tops__list').toggle(false);
    $('.bottom-content__item__category__menu__list__ladies__list__tops__Atag').removeClass("tagselect2");
  });
});