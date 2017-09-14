<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/CharactersControl"/>
<jsp:include page="/controller/FavoriteCharactersControl"/>

<tag:cardTemplate>

    <jsp:attribute name="head">
        <title>${requestScope.currentCharacter.name}'s card</title>
    </jsp:attribute>

    <jsp:attribute name="subtitle">
        ${requestScope.currentCharacter.name}
        <c:if test="${sessionScope.currentUser != null}">
            <form action="<c:url value="/controller/FavoriteCharactersControl"/>" class="d-inline" method="post">
                <c:choose>
                    <c:when test="${requestScope.currentFavoriteCharacter.character_id_pk != 0}">
                        <button class="btn btn-link favorite-btn delete-favorite" name="deleteFavoriteCharacter" value="${param["id"]}">(Delete from favorites)</button>
                    </c:when>
                    <c:otherwise>
                       <button class="btn btn-link favorite-btn add-favorite" name="addFavoriteCharacter" value="${param["id"]}">(Add to favorites)</button>
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
                <div class="row ">
                    <div class="col px-0 separator-bottom mt-2">
                        Characters's info
                    </div>
                </div>

                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Name: ${requestScope.currentCharacter.name}
                    </div>
                </div>

                <div class="row card-attribute">
                    <div class="col mt-2">
                        Favorited: ${requestScope.currentFavoriteCharacterCount}
                    </div>
                </div>

                <div class="col  separator-bottom mt-2">

                </div>
            </div>


        </div>
    </jsp:attribute>

    <jsp:attribute name="rightBlock">
        <div class="row">
            <div class="col">

                <div class="row">
                    <div class="col col-sm-12 mt-2 other-info">
                            ${requestScope.currentCharacter.biography}
                    </div>
                </div>


            </div>
        </div>


        <div class="row mt-5">
            <div class="col">
                <div class="row  separator-top ">
                    <div class="col">

                        <div class="rounded info-card">
                            <!-- DESKTOP -->
                            <div class="row mt-4">
                                <div class="col col-12 mb-2">
                                    <span class="separator-title mb-2">Games appeared: </span>
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

    <jsp:body>

        <div class="row">
            <div class="col game-title">
                <h3></h3>
            </div>
        </div>

        <div class="row">

            <div class="col col-12 col-xl-4 col-md-12 ">

            </div>

            <div class="col col-12 col-lg-12 col-xl-8">

            </div>
        </div>


    </jsp:body>

</tag:cardTemplate>