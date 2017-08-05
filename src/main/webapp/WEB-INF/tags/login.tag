%@tag description="Overall page template" %>
<%@attribute name="head" fragment="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:invoke fragment="head"/>
    <title>Login</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/login.min.css" />" />

    <script src="http://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>

<body>

<jsp:doBody/>

<div id="container" class="col-lg-12 col-sm-4 col-sm-offset-4">
    <div class="row">
        <div class="col-lg-12" id="formContainer">
            <form id="form">
                <img alt="logo" id="logoImg" src="http://lavozdelmuro.net/wp-content/uploads/2017/02/PORTADA-1000x523.jpg">

                <div id="paddings">
                    <div id="errorMessage">

                    </div>

                    <div class="form-group input-group icon ">
                        <span class="input-group-addon" style="color:white; background-color:#1985A1"><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" name="user " id="user" placeholder="Enter username">
                    </div>

                    <div class="form-group input-group">
                        <span class="input-group-addon" style="color:white; background-color:#1985A1"><i class="glyphicon glyphicon-lock"></i></span>
                        <input type="password" class="form-control" name="password" id="pass" placeholder="Enter user password">
                    </div>
                    <div class="form-group" id="button">
                        <button type="button" class="btn btn-block" name="submit" value="Envia" onclick="" id="submit">Send</button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>

</body>

</html>
