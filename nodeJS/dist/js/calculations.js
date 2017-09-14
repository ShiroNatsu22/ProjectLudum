$(document).ready(function() {

  total_entries();
});

function total_entries() {

  var completed = $(".total-completed").text();
  var dropped = $(".total-dropped").text();
  var pending = $(".total-pending").text();
  var playing = $(".total-playing").text();
  var total = parseInt(completed) + parseInt(dropped) + parseInt(pending) + parseInt(playing);

  $(".total-entry").html(total);


}
