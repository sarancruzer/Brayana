
function loginSubmit(){
        var username = $("#username").val();
        var password = $("#password").val();
         $.ajax({
              type: "POST",
              url: api_url+"/Auth/validateLogin",
              dataType:"JSON",
              data: {"username":username,"password":password},
              cache: false,
              success: function(data, textStatus, xhr) {
                    var status = data.STATUS;
                    var data = data.RESPONSE;
                    if(status == "OK"){
                      setLocal("auth",data.token);
                      getLocal("auth");
                      islogged();
                    }else{
                      alert("Invalid Username/Password");
                    }
                }
            });
        return false;
}
