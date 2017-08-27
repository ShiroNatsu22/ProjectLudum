<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/CompaniesControl"/>

<tag:cardTemplate>

    <jsp:attribute name="head">
        <title>${requestScope.currentCompany.getName()}</title>
    </jsp:attribute>

    <jsp:attribute name="subtitle">
        ${requestScope.currentCompany.name}
    </jsp:attribute>

    <jsp:attribute name="leftBlock">
        <div id="card-effect">
            <div class="row">
                <div class="col image">
                    <img class="img-fluid imag-responsive"
                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                         alt="gameImg">
                </div>
            </div>

            <div class="col">
                <div class="row ">
                    <div class="col separator-bottom mt-2">
                            ${requestScope.currentCompany.name}'s info
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col mt-2">
                        Name: ${requestScope.currentCompany.getName()}                        </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Founded: ${requestScope.currentCompany.getFounded()}

                    </div>
                </div>
                <div class="row ">
                    <div class="col separator-bottom mt-2">
                    </div>
                </div>
            </div>

        </div>
    </jsp:attribute>

    <jsp:attribute name="rightBlock">
        <div class="row">
            <div class="col ">

                <div class="row">
                    <div class="col col-sm-12 mt-2 other-info">
                        <p>sadfsadfsadfsafasdfasdfsafasfasfasfasf sdaff asd fas f sadfas f</p>
                    </div>
                </div>


            </div>
        </div>

        <div class="row mt-5">
            <div class="col">
                <div class="row">
                    <div class="col">

                        <div class="rounded info-card">
                            <div class="row mt-4">
                                <div class="col mb-2">
                                    <span class="separator-title ml-4 mb-2">Games Developed: <button type="button" class="btn hidden-sm-down show-button">Show me more</button></span>
                                </div>
                            </div>
                            <div class="row mb-4">

                                <c:forEach var="videogame" items="${requestScope.currentCompanyDeveloperList}">
                                    <div class="col  ml-3 separator">

                                        <img class="img-fluid hidden-sm-down imag-responsive"
                                             src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                             alt="gameImg">

                                        <a class="ml-1"
                                           href="<c:url value="/BackOffice/VideogameCard.jsp?id=${videogame.videogame_id_pk}" />">${videogame.name}
                                        </a>

                                    </div>


                                </c:forEach>


                                <!-- MOBILE -->
                                <div class="row  mb-2 mr-1 hidden-md-up">
                                    <div class="col ">
                                        <button type="button" class="btn show-button float-right">Show me more</button>
                                        </span>
                                    </div>
                                </div>
                                <!--END MOBILE -->
                            </div>

                        </div>
                    </div>

                </div>

                <div class="row mt-4">
                    <div class="col">
                        <div class="rounded info-card">
                            <div class="row mt-4">
                                <div class="col mb-2">
                                    <span class="separator-title ml-4 mb-2">Games Published: <button type="button" class="btn hidden-sm-down show-button">Show me more</button></span>
                                </div>
                            </div>
                            <div class="row mb-4">

                                <c:forEach var="videogame" items="${requestScope.currentCompanyPublisherList}">
                                    <div class="col  ml-3 separator">

                                        <img class="img-fluid hidden-sm-down imag-responsive"
                                             src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                             alt="gameImg">

                                        <a class="ml-1"
                                           href="<c:url value="/BackOffice/VideogameCard.jsp?id=${videogame.videogame_id_pk}" />">${videogame.name}
                                        </a>

                                    </div>

                                </c:forEach>

                                <!-- MOBILE -->
                                <div class="row  mb-2 mr-1 hidden-md-up">
                                    <div class="col ">
                                        <button type="button" class="btn show-button float-right">Show me more</button>
                                        </span>
                                    </div>
                                </div>
                                <!--END MOBILE -->
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>

</tag:cardTemplate>