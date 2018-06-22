<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
<meta charset="utf-8" />
<title>Login</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
    
<link href="assets/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/scripts.js"></script>
</head>
    
<body>
    <div class="login-page">
  <div class="form">
      <a href="#"><img src="assets/img/logo.png"></a>
      <h1><span>Sign in</span> to continue to
brayana</h1>
    <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    <form class="login-form">
      <input type="text" placeholder="username"/>
      <input type="password" placeholder="password"/>
      <button class="log" type="button">login</button>
     

      <p class="message">Don't have an account? <a href="#">Signup</a></p>
    </form>
  </div>
</div>
    
<script type="text/javascript">
    $(document).ready(function(){
          $('.message a').click(function(){
             $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
          });
      $('.log').click(function(){
             $.ajax({
              type: "POST",
              url: "http://brayana.tweenix.com/Auth/validateLogin",
              dataType:"JSON",
              data: {"username":"admin","password":"admin"},
              cache: false,
              success: function(data){
                 console.log(data);
              }
            });
      });

      $('.getlands').click(function(){
             $.ajax({
              type: "GET",
              url: "http://brayana.tweenix.com/Api/lands",
              headers: { "auth":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEiLCJlbWFpbCI6bnVsbCwibW9iaWxlIjoiOTAwMzUwMjcxOSIsInR5cGUiOiIxIiwidHlwZV9pZCI6IjEifQ.-ORoFj4UQO7ERht08yAt5eBFsgLb2JbqkHRDF0qMY7o"},
              dataType:"JSON",
              cache: false,
              success: function(data){
                 console.log(data);
              }
            });
      });
      
    });
</script>    
</body>
</html>
