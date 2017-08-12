<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="Login form" pageEncoding="UTF-8" %>
<link type="text/css" rel="stylesheet" href="<c:url value="../../lib/css/login.min.css" />" />


<c:choose>
    <c:when test="${currentUser != null}">
        User: ${currentUser.getUsername()}
        <form action="${pageContext.request.contextPath}/controller/LogOut">
            <button>LogOut</button>
        </form>
    </c:when>

    <c:otherwise>
        <div id="container" class="col-lg-12 col-sm-4 cffset-4">
            <div class="row">
                <div class="col-sm-4 " id="formContainer">
                    <form id="form">
                        <img alt="logo" id="logoImg"  class="col-sm-12" src="http://lavozdelmuro.net/wp-content/uploads/2017/02/PORTADA-1000x523.jpg">

                        <div id="paddings">
                            <div id="errorMessage">

                            </div>

                            <div class="form-group input-group icon ">
                                <span class="input-group-addon" style="color:white; background-color:#1985A1"><i class="fa fa-user" aria-hidden="true"></i>
</span>
                                <input type="text" class="form-control" name="user " id="user" placeholder="Enter username">
                            </div>

                            <div class="form-group input-group">
                                <span class="input-group-addon" style="color:white; background-color:#1985A1"><i class="fa fa-key" aria-hidden="true"></i>
</span>
                                <input type="password" class="form-control" name="password" id="pass" placeholder="Enter user password">
                            </div>
                            <div class="noAccount">
                                <a href="#">¿No tienes cuenta? Aqui podras crearte una</a>

                            </div>
                            <div class="form-group" id="button">
                                <button type="button" class="btn btn-block" name="submit" value="Envia" onclick="" id="submit">Send</button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>