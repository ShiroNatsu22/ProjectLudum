<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UserSelectedVideogamesControl"/>
<jsp:include page="/controller/FavoriteGamesControl"/>
<jsp:include page="/controller/UsersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
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

                        <ul id="user-list-nav" class="nav nav-tabs hidden-sm-down" role="tablist">

                            <li class="nav-item">
                                <a class="nav-link active" href="#completed" id="completed-tab" role="tab"
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
                                <a class="nav-link " href="#favorite" id="favorite-tab" role="tab"
                                   data-toggle="tab" aria-controls="favorite">Favorites</a>
                            </li>

                        </ul>

                    </div>
                </div>
            </div>
        </div>
        <div id="game-list-nav-content" class="tab-content">

            <div role="tabpanel" class="tab-pane fade show active" id="completed" aria-labelledby="completed-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped responsive table-list" width="100%">
                            <thead>
                            <tr>
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
                                            <img class="img-fluid" width="50" height="50" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                        </td>
                                        <td>
                                            <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                        </td>
                                        <td>
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
                        <table class="table table-hover table-stripped responsive table-list" width="100%">
                            <thead>
                            <tr>
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
                                            <img class="img-fluid" width="50" height="50" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                        </td>
                                        <td>
                                            <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                        </td>
                                        <td>
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
                        <table class="table table-hover table-stripped responsive table-list" width="100%">
                            <thead>
                            <tr>
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
                                            <img class="img-fluid" width="50" height="50" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                        </td>
                                        <td>
                                            <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                        </td>
                                        <td>
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
                        <table class="table table-hover table-stripped responsive table-list" width="100%">
                            <thead>
                            <tr>
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
                                            <img class="img-fluid" width="50" height="50" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                        </td>
                                        <td>
                                            <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}"/>">${userSelectedVideogame.videogame_id_fk.name}</a>
                                        </td>
                                        <td>
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

            <div role="tabpanel" class="tab-pane fade show " id="favorite" aria-labelledby="favorite-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped responsive table-list" width="100%">
                            <thead>
                            <tr>
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
                                        <img class="img-fluid" width="50" height="50" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                    </td>
                                    <td>
                                        <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${favoriteVideogame.videogame_id_fk.videogame_id_pk}"/>">${favoriteVideogame.videogame_id_fk.name}</a>
                                    </td>
                                    <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}">
                                        <td>
                                            <form action="<c:url value="/controller/FavoriteGamesControl"/>" method="post">
                                                <button class="btn btn-danger" name="deleteFavoriteGame" value="${favoriteVideogame.videogame_id_fk.videogame_id_pk}">
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