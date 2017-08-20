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
            <div style="background:lightgreen" class="col">Juegos completados</div>
            <div style="background:lightblue" class="col ">Juegos dropeados</div>
            <div style="background:lightgreen" class="col">Jugando</div>

        </div>

    </div>

    </jsp:body>

</tag:pageMaster>