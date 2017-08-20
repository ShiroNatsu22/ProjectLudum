<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>
<link type="text/css" rel="stylesheet" href="<c:url value="../lib/css/login.min.css" />" />

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>

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




    </jsp:body>

</tag:pageMaster>