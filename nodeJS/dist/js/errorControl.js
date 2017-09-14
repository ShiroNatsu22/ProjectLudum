function correctInfo() {
  $('.originalPassword,.repeatPassword').keyup(function(e) {
    if ($(this).hasClass("passwordRegistation") && $(this).val() != "" && $(".originalPassword").val() == $(".repeatPassword").val()) {
      $(".pFill").removeClass("password-notFill");
      $(".pFill").addClass("password-Fill");
      $("p").remove(".wrongPassword");

    } else {
      $(".passwordComprobation").html("<p class='wrongPassword'>Passwords doesn't match</p>")
      $(".pFill").removeClass("password-Fill");
      $(".pFill").addClass("password-notFill");
    }
  });

  $('.requiredField').keyup(function(e) {
    if ($(this).hasClass("requiredField") && $(this).val() == "") {
      $(this).removeClass("required-fill");
      $(this).addClass("required-notFill");
    } else {
      $(this).removeClass(" required-notFill");
      $(this).addClass(" required-fill");
    }
  });
}


correctInfo();

function score() {

$( ".rating:contains('-1')" ).html( "-" );

}

function infoNotFill() {
  if ($(".infoName").text() == "" && $(".infoSurname").text() == "")  {
    $(".infoName").text("Not info available.");
  }

  if ($(".infoGender") == "") {
    $(".infoGender").text("Not info available.");
  }
  if ($(".infoCountry").text() == "") {
    $(".infoCountry").text("Not info available.");
  }
  if ($(".infoEmail").text() == "") {
    $(".infoEmail").text("Not info available.");
  }
  if ($(".infoBirthday").text() == "") {
    $(".infoBirthday").text("Not info available.");
  }if ($(".infoBiography").text() == "") {
    $(".infoBiography").text("Not info available.");
  }
}

score();
infoNotFill();
