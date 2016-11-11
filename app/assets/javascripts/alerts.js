//$( document ).ready(function() {
$(document).on('turbolinks:load', function() {
    $( ".alert" ).delay(800).fadeOut( "slow", function() {
    // Animation complete.
  });
});

