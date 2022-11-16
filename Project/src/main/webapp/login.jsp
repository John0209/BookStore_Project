<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link href="https://fonts.googleapis.com/css?family=Assistant:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/loginFormStyle.css">
</head>

<body>

<c:if test="${countLogin==1}">
<div class="toast" data-autohide="false">
    <div >
        <h1 class="title">Login Failed</h1>
    </div>
    <div class="content">
        Sorry, an unexpected error occurred.Please try again later <hr/>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
    </div>
</div>
</c:if>

<section class='login' id='login'>
    <div class='head'>
        <h1 class='company'>Phuong Nam Book Store</h1>
    </div>
    <p class='msg'>Welcome to Login</p>
    <div class='form'>
        <form action="loginAction" method="POST">
            <input type="hidden" name="countLogin" value="1" >
            <input type="text" placeholder='Username' class='text' id='username' required name="txtAccountId"><br>
            <input type="password" placeholder='Password' class='password' required name="txtPassword"><br>
                    <input type="submit" class='btn-login' value="Login" />
                    <input type="reset" class="btn-cancel" value="Cancel" />    
                </form>
            </div>
        </section>
        <!-- partial -->
        <script  src="./js/LoginForm.js"></script>
    </body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function(){
        $('.toast').toast('show');
    });
</script>
</html>
