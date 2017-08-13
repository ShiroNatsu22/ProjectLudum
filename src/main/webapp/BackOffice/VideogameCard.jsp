<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
        <%--<link type="text/css" rel="stylesheet" href="<c:url value="/lib/css/cardCss.min.css" />" />--%>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col game-title">
                <h3>${requestScope.currentVideogame.getName()}</h3>
            </div>
        </div>

        <div class="row">

            <div class="col-4 image">
                <img class="img-fluid imag-responsive"
                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                     alt="gameImg">
            </div>

            <div class="col">

                <ul class="list-group">
                    <li class="list-group-item">Nombre: VIKINGS</li>
                    <li class="list-group-item">Distribuidor: Bethesda</li>
                    <li class="list-group-item">Productor: Ubisoft</li>
                    <li class="list-group-item">Género: Acción</li>
                    <li class="list-group-item">Plataforma: PS4</li>
                    <li class="list-group-item">Jugadores: 25</li>
                    <li class="list-group-item">PEGI: 18</li>
                </ul>

                    <%--<p class="main-info">Nombre: VIKINGS</p>
                    <p class="main-info">Distribuidor: Bethesda</p>
                    <p class="main-info">Productor: Ubisoft</p>
                    <p class="main-info">Género: Acción</p>
                    <p class="main-info">Plataforma: PS4</p>
                    <p class="main-info">Jugadores: 25</p>
                    <p class="main-info">PEGI: 18</p>--%>

            </div>

        </div>

        <div class="row">
            <div class="col col-sm-12 mt-2 other-info">
                <p>${requestScope.currentVideogame.getDescription()}</p>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>