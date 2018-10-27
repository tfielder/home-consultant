$(document).ready(function() {
  $('.log-in-submit').on('click', function () {
    var emailInput = $('#user_address').val();
    if (emailInput === '') {
      $('.message').text('Please fill in the email field.');
      $("#user_address").css({"border-color": "red"});
      event.preventDefault();
      event.stopPropagation();
    } else {
      $('.message').text('Please fill in the password field.');
      $("#password").css({"border-color": "red"});
      event.preventDefault();
      event.stopPropagation();
    }
  });
});
