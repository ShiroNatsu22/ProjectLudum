<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>
<link type="text/css" rel="stylesheet" href="<c:url value="../lib/css/login.min.css" />"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>
        <div class="row">
            <div class="col">
                <div class="row">
                    <div class="col">
                        <ul class="nav nav-tabs nav-fill col">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Juegos Completados</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Juegos en proceso</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Juegos dropeados</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">TOP juegos favoritos</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col">
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>