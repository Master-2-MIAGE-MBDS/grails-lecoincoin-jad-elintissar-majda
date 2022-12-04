<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <asset:stylesheet src="login.css"/>
    <title>Login</title>


</head>
<body>
<sec:ifNotLoggedIn>
    <div class="wrapper">
        <div class="title">Login Form</div>
        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" autocomplete="off">
            <div class="field">
                <input type="text" required name="${usernameParameter ?: 'username'}" >
                <label>Username</label>
            </div>
            <div class="field">
                <input type="password" required name="${passwordParameter ?: 'password'}" >
                <label>Password</label>
            </div>
            <div class="content">
                <div class="checkbox">
                    <input type="checkbox" id="remember-me" name="${rememberMeParameter ?: 'remember-me'}" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                    <label for="remember-me">Remember me</label>
                </div>
                <div class="pass-link"><a href="#">Stay logged in</a></div>
            </div>
            <div class="field">
                <input type="submit" value="Login">
            </div>

        </form>
    </div>

</sec:ifNotLoggedIn>
<input type="hidden" id="refreshed" value="no">
<sec:ifLoggedIn>
    <g:javascript>
        onload=function(){
            var e=document.getElementById("refreshed");
            if(e.value=="no")e.value="yes";
            else{e.value="no";location.reload();}
        }
    </g:javascript>
    <g:javascript>window.location.replace("/home");</g:javascript>
</sec:ifLoggedIn>

</div>

</body>

</html>
