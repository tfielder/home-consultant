$(document).ready(function() {
  $('.log-in-submit').on('click', function () {
    var input = $('#user_address').val();
    if (input === '') {
      $('.message').text('Invalid Email');
      $("#user_address").css({"border-color": "red"});
    }
  });
});
