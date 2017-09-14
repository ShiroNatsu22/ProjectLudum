<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UserSelectedVideogamesControl"/>
<jsp:include page="/controller/FavoriteGamesControl"/>
<jsp:include page="/controller/FavoritePeopleControl"/>
<jsp:include page="/controller/FavoriteCharactersControl"/>
<jsp:include page="/controller/UsersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>${requestScope.currentUser.username}'s game list</title>
    </jsp:attribute>

    <jsp:body>
        <div class="row ">
            <div class="col px-0 separator-bottom mt-2">
                    ${requestScope.currentUser.username}'s game list
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="row">
                    <div class="col">

                        <ul id="user-list-nav" class="nav nav-tabs hidden-sm-down" role="tablist" width="100%">
                            <li class="nav-item">
                                <a class="nav-link active" href="#all" id="all-tab" role="tab"
                                   data-toggle="tab" aria-controls="all">All</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#completed" id="completed-tab" role="tab"
                                   data-toggle="tab" aria-controls="completed">Completed</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#playing" id="playing-tab" role="tab"
                                   data-toggle="tab" aria-controls="process">Playing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#dropped" id="dropped-tab" role="tab"
                                   data-toggle="tab" aria-controls="dropped">Dropped</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#planToPlay" id="planToPlay-tab" role="tab"
                                   data-toggle="tab" aria-controls="pending">Plan to play</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#favoriteGame" id="favorite-game-tab" role="tab"
                                   data-toggle="tab" aria-controls="favoriteGame">Favorite game</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#favoritePeople" id="favorite-peopel-tab" role="tab"
                                   data-toggle="tab" aria-controls="favoritePeople">Favorite people</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " href="#favoriteCharacter" id="favorite-character-tab" role="tab"
                                   data-toggle="tab" aria-controls="favoriteCharacter">Favorite character</a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
        <div id="game-list-nav-content" class="tab-content">
            <div role="tabpanel" class="tab-pane fade show active" id="all" aria-labelledby="all-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" width="100%">
                            <thead>
                            <tr class="bg-primary text-white">
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Rating</th>
                                <th>Status</th>
                                <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                    <th>Delete</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="userSelectedVideogame" varStatus="count" items="${requestScope.currentUserSelectedVideogamesList}">

                                <tr>
                                    <td>
                                            ${count.count}
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${userSelectedVideogame.videogame_id_fk.image != null}">
                                                <img class="img-fluid imag-responsive" src="/files/${userSelectedVideogame.videogame_id_fk.image}" width="50" height="50" alt="gameImg">
                                            </c:when>
                                            <c:otherwise>
                                                <img class="img-fluid imag-responsive" width="50" height="50"
                                                     src="http://www.freeiconspng.com/uploads/video-game-controller-icon-33.png"
                                                     alt="gameImg">
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                    </td>
                                    <td class="rating">
                                            ${userSelectedVideogame.rating}
                                    </td>
                                    <td>
                                            ${userSelectedVideogame.status}
                                    </td>
                                    <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                        <td>
                                            <form action="<c:url value="/controller/UserSelectedVideogamesControl"/>" method="post">
                                                <button class="btn btn-danger" name="deleteFromUserList" value="${userSelectedVideogame.videogame_id_fk.videogame_id_pk}">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </c:if>

                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show " id="completed" aria-labelledby="completed-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" width="100%">
                            <thead>
                            <tr class="bg-primary text-white">
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Rating</th>
                                <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                    <th>Delete</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="userSelectedVideogame" varStatus="count" items="${requestScope.currentUserSelectedVideogamesList}">
                                <c:if test="${userSelectedVideogame.status.equals('completed')}">
                                    <tr>
                                        <td>
                                                ${count.count}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${userSelectedVideogame.videogame_id_fk.image != null}">
                                                    <img class="img-fluid imag-responsive" src="/files/${userSelectedVideogame.videogame_id_fk.image}" width="50" height="50" alt="gameImg">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="img-fluid imag-responsive" width="50" height="50"
                                                         src="http://www.freeiconspng.com/uploads/video-game-controller-icon-33.png"
                                                         alt="gameImg">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                        </td>
                                        <td class="rating">
                                                ${userSelectedVideogame.rating}
                                        </td>
                                        <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                            <td>
                                                <form action="<c:url value="/controller/UserSelectedVideogamesControl"/>" method="post">
                                                    <button class="btn btn-danger" name="deleteFromUserList" value="${userSelectedVideogame.videogame_id_fk.videogame_id_pk}">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show" id="playing" aria-labelledby="process-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" width="100%">
                            <thead>
                            <tr class="bg-primary text-white">
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Rating</th>
                                <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                    <th>Delete</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="userSelectedVideogame" varStatus="count" items="${requestScope.currentUserSelectedVideogamesList}">
                                <c:if test="${userSelectedVideogame.status.equals('playing')}">
                                    <tr>
                                        <td>
                                                ${count.count}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${userSelectedVideogame.videogame_id_fk.image != null}">
                                                    <img class="img-fluid imag-responsive" src="/files/${userSelectedVideogame.videogame_id_fk.image}" width="50" height="50" alt="gameImg">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="img-fluid imag-responsive" width="50" height="50"
                                                         src="http://www.freeiconspng.com/uploads/video-game-controller-icon-33.png"
                                                         alt="gameImg">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                        </td>
                                        <td class="rating">
                                                ${userSelectedVideogame.rating}
                                        </td>
                                        <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                            <td>
                                                <form action="<c:url value="/controller/UserSelectedVideogamesControl"/>" method="post">
                                                    <button class="btn btn-danger" name="deleteFromUserList" value="${userSelectedVideogame.videogame_id_fk.videogame_id_pk}">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show" id="dropped" aria-labelledby="dropped-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" width="100%">
                            <thead>
                            <tr class="bg-primary text-white">
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Rating</th>
                                <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                    <th>Delete</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="userSelectedVideogame" varStatus="count" items="${requestScope.currentUserSelectedVideogamesList}">
                                <c:if test="${userSelectedVideogame.status.equals('dropped')}">
                                    <tr>
                                        <td>
                                                ${count.count}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${userSelectedVideogame.videogame_id_fk.image != null}">
                                                    <img class="img-fluid imag-responsive" src="/files/${userSelectedVideogame.videogame_id_fk.image}" width="50" height="50" alt="gameImg">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="img-fluid imag-responsive" width="50" height="50"
                                                         src="http://www.freeiconspng.com/uploads/video-game-controller-icon-33.png"
                                                         alt="gameImg">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                        </td>
                                        <td class="rating">
                                                ${userSelectedVideogame.rating}
                                        </td>
                                        <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                            <td>
                                                <form action="<c:url value="/controller/UserSelectedVideogamesControl"/>" method="post">
                                                    <button class="btn btn-danger" name="deleteFromUserList" value="${userSelectedVideogame.videogame_id_fk.videogame_id_pk}">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show " id="planToPlay" aria-labelledby="pending-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" width="100%">
                            <thead>
                            <tr class="bg-primary text-white">
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Rating</th>
                                <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                    <th>Delete</th>
                                </c:if>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="userSelectedVideogame" varStatus="count" items="${requestScope.currentUserSelectedVideogamesList}">
                                <c:if test="${userSelectedVideogame.status.equals('planToPlay')}">
                                    <tr>
                                        <td>
                                                ${count.count}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${userSelectedVideogame.videogame_id_fk.image != null}">
                                                    <img class="img-fluid imag-responsive" src="/files/${userSelectedVideogame.videogame_id_fk.image}" width="50" height="50" alt="gameImg">
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="img-fluid imag-responsive" width="50" height="50"
                                                         src="http://www.freeiconspng.com/uploads/video-game-controller-icon-33.png"
                                                         alt="gameImg">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                        </td>
                                        <td class="rating">
                                                ${userSelectedVideogame.rating}
                                        </td>
                                        <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                            <td>
                                                <form action="<c:url value="/controller/UserSelectedVideogamesControl"/>" method="post">
                                                    <button class="btn btn-danger" name="deleteFromUserList" value="${userSelectedVideogame.videogame_id_fk.videogame_id_pk}">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show " id="favoriteGame" aria-labelledby="favorite-game-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" width="100%">
                            <thead>
                            <tr class="bg-primary text-white">
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                                <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                    <th>Delete</th>
                                </c:if>

                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="favoriteVideogame" varStatus="count" items="${requestScope.currentFavoriteGamesList}">
                                <tr>
                                    <td>
                                            ${count.count}
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${favoriteVideogame.image != null}">
                                                <img class="img-fluid imag-responsive" src="/files/${favoriteVideogame.image}" width="50" height="50" alt="gameImg">
                                            </c:when>
                                            <c:otherwise>
                                                <img class="img-fluid imag-responsive" width="50" height="50"
                                                     src="http://www.freeiconspng.com/uploads/video-game-controller-icon-33.png"
                                                     alt="gameImg">
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${favoriteVideogame.videogame_id_pk}"/>">${favoriteVideogame.name}</a>
                                    </td>
                                    <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                        <td>
                                            <form action="<c:url value="/controller/FavoriteGamesControl"/>" method="post">
                                                <button class="btn btn-danger" name="deleteFavoriteGame" value="${favoriteVideogame.videogame_id_pk}">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </c:if>
                                </tr>


                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show " id="favoritePeople" aria-labelledby="favorite-people-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" width="100%">
                            <thead>
                            <tr class="bg-primary text-white">
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                                <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                    <th>Delete</th>
                                </c:if>

                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="favoritePeople" varStatus="count" items="${requestScope.currentFavoritePeopleList}">
                                <tr>
                                    <td>
                                            ${count.count}
                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        <a href="<c:url value="/BackOffice/PeopleCard.jsp?id=${favoritePeople.people_id_pk}"/>">${favoritePeople.name} ${favoritePeople.surname}</a>
                                    </td>
                                    <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                        <td>
                                            <form action="<c:url value="/controller/FavoritePeopleControl"/>" method="post">
                                                <button class="btn btn-danger" name="deleteFavoritePeople" value="${favoritePeople.people_id_pk}">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </c:if>
                                </tr>


                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show " id="favoriteCharacter" aria-labelledby="favorite-character-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" width="100%">
                            <thead>
                            <tr class="bg-primary text-white">
                                <th>#</th>
                                <th>Image</th>
                                <th>Name</th>
                                <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                    <th>Delete</th>
                                </c:if>

                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="favoriteCharacter" varStatus="count" items="${requestScope.currentFavoriteCharactersList}">
                                <tr>
                                    <td>
                                            ${count.count}
                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        <a href="<c:url value="/BackOffice/CharacterCard.jsp?id=${favoriteCharacter.character_id_pk}"/>">${favoriteCharacter.name}</a>
                                    </td>
                                    <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                        <td>
                                            <form action="<c:url value="/controller/FavoriteCharactersControl"/>" method="post">
                                                <button class="btn btn-danger" name="deleteFavoriteCharacter" value="${favoriteCharacter.character_id_pk}">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </form>
                                        </td>
                                    </c:if>
                                </tr>


                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>