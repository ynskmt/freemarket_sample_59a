$(document).on("turbolinks:load", function() {
  $('.slider').slick({
    prevArrow:'.slick-prev',
    nextArrow:'.slick-next',
    dotsClass: 'slick-dots',
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 800,
});
})