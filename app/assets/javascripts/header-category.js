$(document).on("turbolinks:load", function() {

  $(".bottom-content__item__category").hover(function () {
    $(".header-category__box").show();
    $(".header-category__box__first").show();
    }, function () {
    $(".header-category__box").hide();
    $(".header-category__box__first").hide();
  });

  $(".header-category__box__first").hover(function(){
    $(".header-category__box__first").show()
    $(".header-category__box__second").show()
  }, function(){
    $(".header-category__box__first").hide()
    $(".header-category__box__second").hide()
  })

  $(".header-category__box__second").hover(function(){
    $(".header-category__box__first").show()
    $(".header-category__box__second").show()
    $(".header-category__box__third").show()
  }, function(){
    $(".header-category__box__first").hide()
    $(".header-category__box__second").hide()
    $(".header-category__box__third").hide()
  })

  $(".header-category__box__third").hover(function(){
    $(".header-category__box__first").show()
    $(".header-category__box__second").show()
    $(".header-category__box__third").show()
  }, function(){
    $(".header-category__box__first").hide()
    $(".header-category__box__second").hide()
    $(".header-category__box__third").hide()
  })



  function showSecondCategory(second){
    let secondCategory = `<div class="header-category__box__second__list" data-category-id="${second.id}" >
                            <a href="/categories/${second.id}">
                              ${second.name}
                            </a>
                          </div>`;
    $(".header-category__box__second").append(secondCategory);
  }

  function showThirdCategory(third){
    let thirdCategory = `<div class="header-category__box__third__list" data-category-id="${third.id}">
                          <a href="/categories/${third.id}">
                            ${third.name}
                          </div>
                        </div>`;
    $(".header-category__box__third").append(thirdCategory);
  }

  $(".header-category__box__first__list").mouseover(function() {
    let first_category_id = $(this).attr("data-category-id");
    $(this).last().addClass("active-list-red");
    $('.header-category__box__first__list').mouseout(function() {
      $(this).removeClass("active-list-red");
    })
    
    $.ajax({
      url: '/products/header_second_category',
      type: 'GET',
      data: {first_category_id: first_category_id},
      dataType: 'json',
    })
    .done(function(seconds){
      $(".header-category__box__second__list").remove();
      seconds.forEach(function(second){
        showSecondCategory(second);
      })
    })
  })

  $(document).on("mouseover", ".header-category__box__second__list", function(){
    let second_category_id = $(this).attr("data-category-id");
    $(this).last().addClass("active-list-gray");
    $('.header-category__box__second__list').mouseout(function() {
      $(this).removeClass("active-list-gray");
    })

    $.ajax({
      url: '/products/header_third_category',
      type: 'GET',
      data: {second_category_id: second_category_id},
      dataType: 'json',
    })
    .done(function(thirds){
      $(".header-category__box__third__list").remove();

      thirds.forEach(function(third){
        showThirdCategory(third);
      })
    })
  })

  $(document).on("mouseover", ".header-category__box__third__list", function(){
    $(this).last().addClass("active-list-gray");
    $('.header-category__box__third__list').mouseout(function() {
      $(this).removeClass("active-list-gray");
    })
  })

  false

})