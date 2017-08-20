<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="Login form" pageEncoding="UTF-8" %>

<form class="form-inline" action="<c:url value="/controller/Authenticate"/>" method="post">

    <div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
        <span class="input-group-addon" id="navLoginUserAddon"><i class="fa fa-user"></i></span>
        <input class="form-control" placeholder="Username" name="username" aria-describedby="navLoginUserAddon">
    </div>

    <div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
        <span class="input-group-addon" id="navLoginPassAddon"><i class="fa fa-key"></i></span>
        <input class="form-control" type="password" placeholder="Password" name="password">
        <a href="../../BackOffice/Register.jsp">No tienes cuenta?</a>
    </div>

    <button class="btn btn-danger btn-sm my-2 my-sm-0">LogIn</button>

</form>
