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

            <div class="col-4 image">
                <img class="img-fluid imag-responsive"
                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                     alt="gameImg">
            </div>

            <div class="col">

                <ul class="list-group">
                    <li class="list-group-item">
                        Name: ${requestScope.currentVideogame.name}
                    </li>
                    <li class="list-group-item">
                        Developer:
                        <c:forEach var="developer" items="${requestScope.currentVideogameDeveloperList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/CompanyCard.jsp?id=${developer.company_id_pk}" />">${developer.name}</a>
                        </c:forEach>
                    </li>
                    <li class="list-group-item">
                        Publisher:
                        <c:forEach var="publisher" items="${requestScope.currentVideogamePublisherList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/CompanyCard.jsp?id=${publisher.company_id_pk}" />">${publisher.name}</a>
                        </c:forEach>
                    </li>
                    <li class="list-group-item">
                        Genre:
                    </li>
                    <li class="list-group-item">
                        Platform:
                    </li>
                    <li class="list-group-item">
                        Number of players:
                    </li>
                    <li class="list-group-item">
                        PEGI:
                    </li>
                </ul>

            </div>

        </div>

        <div class="row">
            <div class="col col-sm-12 mt-2 other-info">
                <p>${requestScope.currentVideogame.description}</p>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>