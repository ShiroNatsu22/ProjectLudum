<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="Login form" pageEncoding="UTF-8" %>
<link type="text/css" rel="stylesheet" href="<c:url value="../../lib/css/cardCss.min.css" />" />


<c:choose>
    <c:when test="${currentUser != null}">
        User: ${currentUser.getUsername()}
        <form action="${pageContext.request.contextPath}/controller/LogOut">
            <button>LogOut</button>
        </form>
    </c:when>

    <c:otherwise>
        <div id="container" class="col-sm-10 offset-1">
            <div class="row">
                <div class="game-title col-sm-12">{COGER TITULO DE LA BASE DE DATOS}</div>
                <div class="image col-sm-4"><img class="imag-responsive col-sm-12" src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg" alt="gameImg" width="225" height="328"></div>
                <div class="col-sm-8"><p class="main-info">Nombre: VIKINGS
                    <p class="main-info">Distribuidor: Bethesda
                    <p class="main-info">Productor: Ubisoft
                    <p class="main-info">Género: Acción
                    <p class="main-info">Plataforma: PS4
                    <p class="main-info">Jugadores: 25
                    <p class="main-info">PEGI: 18

                </div>
            </div>
            <div class="other-info col-sm-12">
                <span><p>Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}Sipnosis:{COGER SIPNOSIS DE LA BASE DE DATOS}</span>
            </div>
        </div>
    </c:otherwise>
</c:choose>