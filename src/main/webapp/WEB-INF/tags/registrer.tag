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
                <div class="col-sm-5 " id="formContainer">
                    <p> Formulario de registro</p>
                    <form id="form">


                        <div id="paddings">


                            <div class="registrerUser">
                                <p>Usuario:</p>
                                <input type="text" class="form-control" name="user " id="user" placeholder="Enter username">
                            </div>

                            <div class="registrerPass">
                                <p>Contraseña:</p>
                                <input type="password" class="form-control" name="password" id="pass" placeholder="Enter user password">
                            </div>
                            <div class="registrerPass">
                                <p>Vuelva a introducir la contraseña:</p>
                                <input type="password" class="form-control" name="password" id="rePass" placeholder="Repeat Password">
                            </div>

                            <div class="registrerMail">
                                <p>Introduzca su email:</p>
                                <input type="email" class="form-control" name="password" id="email" placeholder="Enter email">
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