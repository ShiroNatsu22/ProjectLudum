<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/CompaniesControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col">
                <h3>${requestScope.currentCompany.getName()}</h3>
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
                        Name: ${requestScope.currentCompany.getName()}
                    </li>
                    <li class="list-group-item">
                        Founded: ${requestScope.currentCompany.getFounded()}
                    </li>
                    <li class="list-group-item">
                        Games developed:
                        <c:forEach var="videogame" items="${requestScope.currentCompanyDeveloperList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/VideogameCard.jsp?id=${videogame.videogame_id_pk}" />">${videogame.name}</a>
                        </c:forEach>
                    </li>
                    <li class="list-group-item">
                        Games published:
                        <c:forEach var="videogame" items="${requestScope.currentCompanyPublisherList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/VideogameCard.jsp?id=${videogame.videogame_id_pk}" />">${videogame.name}</a>
                        </c:forEach>
                    </li>
                </ul>

            </div>

        </div>

    </jsp:body>

</tag:pageMaster>