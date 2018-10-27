$(document).ready(function() {
  $('.log-in-submit').on('click', function () {
    var emailInputElement = $('#user_address')
    var passwordInputElement = $('#password')
    var submitButtonElement = $('.log-in-submit')

    const invalidEmailMessage = "Please provide valid email"
    const userAddressId = "#user_address"

    passwordInputElement.on('click', function (event) {
      if (isEmail(emailInputElement.val())) {
        $('.message').text();
        $(emailInputElement).css({"border-color": "initial"});
      }
    })

    submitButtonElement.on('click', function (event) {
      if (isEmail(emailInputElement.val())) {
        $('.message').text();
        $(emailInputElement).css({"border-color": "initial"});
      }
    })

    function isEmail(email) {
      var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      return regex.test(email);
    }

    // function setInvalidCSS(e) {
    //   $(e).css({border})
    // }
    // function setMessage(e, message) {
    //
    // }

    if (!isEmail(emailInputElement.val())) {
      $('.message').text('Please provide valid email.');
      $("#user_address").css({"border-color": "red"});
      // setMessage(userAddressId, invalidEmailMessage)
      // setInvalidCSS(userAddressId)
      event.preventDefault();
    } else if (passwordInputElement.val() === '') {
      $('.message').text('Please fill in the password field.');
      $("#password").css({"border-color": "red"});
      event.preventDefault();
    } else {}
  });
});
