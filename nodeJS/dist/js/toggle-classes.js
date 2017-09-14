function toggleClass() {
  if ($(window).width() >= 960 && $(".put-separator").hasClass("separator-bottom")) {
    $('.put-separator').toggleClass('separator-bottom separator-right');

  } else if ($(window).width() < 960 && $(".put-separator").hasClass("separator-right")) {
    $('.put-separator').toggleClass('separator-right separator-bottom');
  }

  //Separador del bloque izquierdo del derecho
  if ($(window).width() >= 960 && $(".right-block").hasClass("no-separator")) {
    $('.right-block').toggleClass('no-separator separator-left');

  } else if ($(window).width() < 960 && $(".right-block").hasClass("separator-left")) {
    $('.right-block').toggleClass('separator-left no-separator');
  }



  //Poner inline los favorited times
  if ($(window).width() >= 768 && $(".put-inline").hasClass("no-inline")) {
    $('.put-inline').toggleClass('no-inline d-inline');

  } else if ($(window).width() < 768 && $(".put-inline").hasClass("d-inline")) {
    $('.put-inline').toggleClass('d-inline no-inline');
  }


  resize();


}

function resize() {
  $(window).resize(function() {
    if ($(window).width() >= 960 && $(".put-separator").hasClass("separator-bottom")) {

      $('.put-separator').toggleClass('separator-bottom separator-right');

    } else if ($(window).width() < 960 && $(".put-separator").hasClass("separator-right")) {

      $('.put-separator').toggleClass('separator-right separator-bottom');
    }

    //Separador del bloque izquierdo del derecho
    if ($(window).width() >= 960 && $(".right-block").hasClass("no-separator")) {
      $('.right-block').toggleClass('no-separator separator-left');

    } else if ($(window).width() < 960 && $(".right-block").hasClass("separator-left")) {
      $('.right-block').toggleClass('separator-left no-separator');
    }


    //Poner inline los favorited times
    if ($(window).width() >= 768 && $(".put-inline").hasClass("no-inline")) {
      $('.put-inline').toggleClass('no-inline d-inline');

    } else if ($(window).width() < 768 && $(".put-inline").hasClass("d-inline")) {
      $('.put-inline').toggleClass('d-inline no-inline');
    }
  });
}


toggleClass();
