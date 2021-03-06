<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>
<jsp:include page="/controller/UserSelectedVideogamesControl"/>
<jsp:include page="/controller/FavoriteGamesControl"/>

<tag:cardTemplate>

    <jsp:attribute name="head">
        <title>${requestScope.currentVideogame.name}</title>
    </jsp:attribute>

    <jsp:attribute name="subtitle">
        ${requestScope.currentVideogame.name}  <c:if test="${sessionScope.currentUser != null}">
                <form action="<c:url value="/controller/FavoriteGamesControl"/>" class="d-inline" method="post">
                            <c:choose>
                                <c:when test="${requestScope.currentFavoriteGame.videogame_id_pk != 0}">
                                    <button class="btn btn-link favorite-btn delete-favorite" name="deleteFavoriteGame" value="${param["id"]}">(Delete from favorites)</button>
                                </c:when>
                                <c:otherwise>
                                   <button class="btn btn-link favorite-btn add-favorite" name="addFavoriteGame" value="${param["id"]}">(Add to favorites)</button>
                                </c:otherwise>
                            </c:choose>

                        </form>
                </c:if>
    </jsp:attribute>

    <jsp:attribute name="leftBlock">

        <div id="card-effect">
            <div class="row">
                <div class="col image">
                    <c:choose>
                        <c:when test="${requestScope.currentVideogame.image != null}">
                            <img class="img-fluid imag-responsive" src="/files/${requestScope.currentVideogame.image}" alt="gameImg">
                        </c:when>
                        <c:otherwise>
                            <img class="img-fluid imag-responsive"
                                 src="http://www.freeiconspng.com/uploads/video-game-controller-icon-33.png"
                                 alt="gameImg">
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>

            <div class="col">

                <div class="row ">
                    <div class="col px-0 separator-bottom mt-2">
                            ${requestScope.currentVideogame.name}'s info
                    </div>
                </div>

                <div class="row card-attribute">

                    <div class="col mt-2">
                        Name: ${requestScope.currentVideogame.name}
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Developer:
                        <c:forEach var="developer" items="${requestScope.currentVideogameDeveloperList}">
                            <a class="ml-1" href="<c:url value="/BackOffice/CompanyCard.jsp?id=${developer.company_id_fk.company_id_pk}" />">${developer.company_id_fk.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Publisher:
                        <c:forEach var="publisher" items="${requestScope.currentVideogamePublisherList}">
                            <a class="ml-1" href="<c:url value="/BackOffice/CompanyCard.jsp?id=${publisher.company_id_fk.company_id_pk}" />">${publisher.company_id_fk.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Genre:
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Platform:
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col hidden-xs  mt-2">
                        Number of players:
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        PEGI:
                    </div>
                </div>

                <div class="row card-attribute">
                    <div class="col mt-2">
                        Favorited: ${requestScope.currentFavoriteGamesCount}
                    </div>
                </div>

                <div class="row ">
                    <div class="col px-0 separator-bottom mt-2">

                    </div>
                </div>


            </div>

        </div>

    </jsp:attribute>

    <jsp:attribute name="rightBlock">

        <!-- Bloque de biografía -->
        <div class="row ">
            <div class="col">
                    ${requestScope.currentVideogame.description}
            </div>
        </div>

        <c:if test="${sessionScope.currentUser != null}">
            <!-- Bloque de agregar juego a la lista y puntuarlo -->
            <div class="row  separator-top ">
                <div class="col py-2 mt-5">
                    <form id="formAddGame" action="<c:url value="/controller/UserSelectedVideogamesControl"/>" method="post">
                        <div class="col">
                            <div class="row ">

                                <div class="col-12 col-md-6  ">
                                <c:choose>
                                    <c:when test="${requestScope.currentUserSelectedVideogame.userSelectedVideogame_id_pk != 0}">
                                        <button class="btn btn-primary col-5" name="updateUserList" value="${param["id"]}">Update</button>
                                        <button class="btn btn-danger  col-6" name="deleteFromUserList" value="${param["id"]}">
                                            Delete
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn col-12" name="addToUserList" value="${param["id"]}">Add to list</button>
                                    </c:otherwise>
                                </c:choose>
                                </div>


                                <div class=" col-12 col-md-3 py-1">
                                    <select form="formAddGame" name="status" class="form-control">
                                        <option value="none">Select one state</option>
                                        <option value="completed"
                                                <c:if test="${requestScope.currentUserSelectedVideogame.status.equals('completed')}">selected</c:if>>Completed
                                        </option>
                                        <option value="playing"
                                                <c:if test="${requestScope.currentUserSelectedVideogame.status.equals('playing')}">selected</c:if>>Playing
                                        </option>
                                        <option value="dropped"
                                                <c:if test="${requestScope.currentUserSelectedVideogame.status.equals('dropped')}">selected</c:if>>Dropped
                                        </option>
                                        <option value="planToPlay"
                                                <c:if test="${requestScope.currentUserSelectedVideogame.status.equals('planToPlay')}">selected</c:if>>Plan to play
                                        </option>
                                    </select>
                                </div>
                                <div class="col-12 col-md-3 py-1">
                                    <select form="formAddGame" name="rating" class="form-control">
                                        <option value="-1">Select score</option>
                                        <c:forEach varStatus="index" begin="0" end="10">
                                        <option value="${index.index}"
                                                <c:if test="${requestScope.currentUserSelectedVideogame.rating == index.index}">selected</c:if>>${index.index}</option>
                                    </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>

        <div class="row mt-5">
            <div class="col">
                <div class="row  separator-top ">
                    <div class="col">

                        <div class="rounded info-card">

                            <div class="row mb-4">
                                <div class="col separator">
                                    <div class=" game-title">Hideo Godjima</div>
                                    <img class="img-fluid  hidden-sm-down imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                </div>


                                <div class="col  separator">
                                    <div class=" game-title">Hideo Godjima</div>
                                    <img class="img-fluid  hidden-sm-down imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                </div>


                                <div class="col separator">
                                    <div class=" game-title">Hideo Godjima</div>
                                    <img class="img-fluid  hidden-sm-down imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                </div>

                                <div class="col separator">
                                    <div class=" game-title">Hideo Godjima</div>
                                    <img class="img-fluid  hidden-sm-down imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                </div>
                            </div>



                        </div>
                    </div>

                </div>

                <div class="row  separator-top ">
                    <div class="col">

                        <div class="rounded info-card">
                            <!-- DESKTOP -->
                            <div class="row mt-4">
                                <div class="col col-12 mb-2">
                                    <span class="separator-title mb-2">People: </span>
                                </div>
                            </div>
                            <!-- END DESKTOP -->
                            <div class="row mb-4">
                                <div class="col separator">
                                    <div class=" game-title">Hideo Godjima</div>
                                    <img class="img-fluid  hidden-sm-down imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                </div>


                                <div class="col  separator">
                                    <div class=" game-title">Hideo Godjima</div>
                                    <img class="img-fluid  hidden-sm-down imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                </div>


                                <div class="col separator">
                                    <div class=" game-title">Hideo Godjima</div>
                                    <img class="img-fluid  hidden-sm-down imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                </div>

                                <div class="col separator">
                                    <div class=" game-title">Hideo Godjima</div>
                                    <img class="img-fluid  hidden-sm-down imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
        </div>

    </jsp:attribute>

</tag:cardTemplate>