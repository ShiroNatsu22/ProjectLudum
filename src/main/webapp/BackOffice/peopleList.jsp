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
        <div class="col">
        <table class="table table-hover table-stripped table-bordered game-list-table">
            <thead>
            <tr>
                <th>#</th>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Juegos</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td><img class="img-fluid"
                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040"></td>
                <td>Vikings</td>
                <td>Completado</td>

            </tr>
            <tr>
                <th scope="row">2</th>
                <td><img class="img-fluid"
                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040"></td>
                <td>Kingdom hearts</td>
                <td>Completado</td>

            </tr>
            <tr>
                <th scope="row">3</th>
                <td><img class="img-fluid"
                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040"></td>
                <td>Metal Gear Solid</td>
                <td>Completado</td>

            </tr>
            </tbody>
        </table>




    </jsp:body>

</tag:pageMaster>

