<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/PeopleControl"/>
<jsp:include page="/controller/FavoritePeopleControl"/>

<tag:cardTemplate>

    <jsp:attribute name="head">
        <title>${requestScope.currentPeople.name}'s Card</title>
    </jsp:attribute>

    <jsp:attribute name="subtitle">
        ${requestScope.currentPeople.name}
        <c:if test="${sessionScope.currentUser != null}">
            <form action="<c:url value="/controller/FavoritePeopleControl"/>" class="d-inline" method="post">
                <c:choose>
                    <c:when test="${requestScope.currentFavoritePeople.people_id_pk != 0}">
                        <button class="btn btn-link favorite-btn delete-favorite" name="deleteFavoritePeople" value="${param["id"]}">(Delete from favorites)</button>
                    </c:when>
                    <c:otherwise>
                       <button class="btn btn-link favorite-btn add-favorite" name="addFavoritePeople" value="${param["id"]}">(Add to favorites)</button>
                    </c:otherwise>
                </c:choose>
            </form>
        </c:if>
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
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Name: ${requestScope.currentPeople.name} ${requestScope.currentPeople.surname}
                    </div>
                </div>

            </div>

            <div class="col">
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Birthday: ${requestScope.currentPeople.birthday}
                    </div>
                </div>

            </div>

            <div class="col">
                <div class="row card-attribute">
                    <div class="col mt-2">
                        Nationality: ${requestScope.currentPeople.nationality}
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="row card-attribute">
                    <div class="col mt-2">
                        Favorited: ${requestScope.currentFavoritePeopleCount}
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
                            ${requestScope.currentPeople.biography}
                    </div>
                </div>


            </div>
        </div>


        <!--<div class="row mt-5">
            <div class="col">
                <div class="row">
                    <div class="col">

                        <div class="rounded info-card">
                            <div class="row mt-4">
                                <div class="col mb-2">
                                    <span class="separator-title ml-4 mb-2">Games Made:</span>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col hidden-sm-down ml-3 separator">
                                    <img class="img-fluid imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>
                                </div>
                                <div class="col ml-4 col-5 hidden-md-up section-content">
                                    <span>Hideo GODjima</span>

                                </div>


                                <div class="col hidden-sm-down separator">
                                    <img class="img-fluid imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>

                                </div>
                                <div class="col col-5 hidden-md-up section-content">
                                    <span>Hideo GODjima</span>

                                </div>


                                <div class="col hidden-sm-down separator">
                                    <img class="img-fluid imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                    <span>Hideo GODjima</span>
                                </div>
                                <div class="col ml-4 col-5 hidden-md-up section-content">
                                    <span>Hideo GODjima</span>

                                </div>

                                <div class="col hidden-sm-down mr-3">
                                    <img class="img-fluid imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>
                                </div>
                                <div class="col  col-5 hidden-md-up section-content">
                                    <span>Hideo GODjima</span>

                                </div>
                            </div>


                        </div>
                    </div>

                </div>


            </div>
        </div>-->
    </jsp:attribute>

</tag:cardTemplate>