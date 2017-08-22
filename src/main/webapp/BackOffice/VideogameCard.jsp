<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col game-title">
                <h3>${requestScope.currentVideogame.name}</h3>
            </div>
        </div>

        <div class="row">

            <div class="col-4 ">
                <div class="row">
                    <div class="col image">
                        <img class="img-fluid imag-responsive"
                             src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                             alt="gameImg">
                    </div>
                </div>


                <div class="row">
                    <div class="col ">
                    <span>
                        Status;
                    </span>
                    </div>
                </div>
                <div class="row">
                    <div class="col ">
                        <div class="dropdown show">
                            <a class="btn btn-secondary dropdown-toggle" id="dropdownStatus" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                Seleccione el estado
                            </a>

                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item">Completado</a>
                                <a class="dropdown-item">Jugando</a>
                                <a class="dropdown-item">Dropeado</a>
                                <a class="dropdown-item">En proceso</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col ">
                        <a> Añadir a favoritos</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col ">
                        <button> Envia la información</button>
                    </div>
                </div>

            </div>
            <div class="col-8">
                <div class="row">
                    <div class="col">
                        Name: ${requestScope.currentVideogame.name}
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        Developer:
                        <c:forEach var="developer" items="${requestScope.currentVideogameDeveloperList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/CompanyCard.jsp?id=${developer.company_id_pk}" />">${developer.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        Publisher:
                        <c:forEach var="publisher" items="${requestScope.currentVideogamePublisherList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/CompanyCard.jsp?id=${publisher.company_id_pk}" />">${publisher.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        Genre:
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        Platform:
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        Number of players:
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        PEGI:
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col col-sm-12 mt-2 other-info">
                <p>${requestScope.currentVideogame.description}</p>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>