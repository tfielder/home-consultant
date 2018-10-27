$(document).ready(function() {
  $('.log-in-submit').on('click', function () {
    var emailInput = $('#user_address').val();
    if (emailInput === '') {
      $('.message').text('Invalid Email');
      $("#user_address").css({"border-color": "red"});
    }
  });
});
