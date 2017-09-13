<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UsersControl"/>
<jsp:include page="/controller/RelationshipsControl"/>
<jsp:include page="/controller/UserSelectedVideogamesControl"/>
<jsp:include page="/controller/FavoriteGamesControl"/>
<jsp:include page="/controller/FavoriteCharactersControl"/>
<jsp:include page="/controller/FavoritePeopleControl"/>

<tag:cardTemplate>

    <jsp:attribute name="head">
        <title>Perfil de ${requestScope.currentUser.username} </title>
    </jsp:attribute>

    <jsp:attribute name="subtitle">
        ${requestScope.currentUser.username}
        <c:if test="${sessionScope.currentUser.user_id_pk == param['id']}"><button type=button class="btn btn-danger" data-toggle="modal" data-target="#createModify">Edit profile</button></c:if>
    </jsp:attribute>

    <jsp:attribute name="leftBlock">
        <div id="card-effect">

            <div class="row">
                <div class="col image">
                    <c:choose>
                        <c:when test="${requestScope.currentUser.profileImage != null}">
                            <img class="img-fluid imag-responsive" src="${initParam.UserProfileImageFolder}${requestScope.currentUser.profileImage}" alt="userImage">
                        </c:when>
                        <c:otherwise>
                            <img class="img-fluid imag-responsive" src="http://www.zwiftnation.com/Content/AdminLTE/img/anonymous.png" alt="userImage">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <a class="btn btn-primary" href="<c:url value="/BackOffice/UserGameList.jsp?id=${param['id']}"/>"><i class="fa fa-3x fa-gamepad" aria-hidden="true"></i></a>
                </div>
                <c:if test="${sessionScope.currentUser != null && requestScope.currentUser.user_id_pk != sessionScope.currentUser.user_id_pk}">

            <!-- Bloque de petición de amistad -->
                    <div class="col">
                        <form action="<c:url value="/controller/RelationshipsControl" />" method="post">

                    <c:choose>

                        <c:when test="${requestScope.currentRelationship.relationship_id_pk == 0}">
                            <button class="btn btn-primary" name="newRelationshipRequest" value="${requestScope.currentUser.user_id_pk}">
                                <i class="fa fa-3x fa-user-plus" aria-hidden="true"></i>
                            </button>
                        </c:when>

                        <c:when test='${requestScope.currentRelationship.status.equals("pending")}'>

                            <c:choose>
                                <c:when test="${sessionScope.currentUser.user_id_pk == requestScope.currentRelationship.receiver_user_id_fk}">
                                    <button class="btn btn-primary" name="acceptRelationship" value="${requestScope.currentRelationship.sender_user_id_fk}">Accept</button>
                                    <button class="btn btn-danger" name="rejectRelationship" value="${requestScope.currentRelationship.sender_user_id_fk}">Reject</button>
                                </c:when>

                                <c:when test="${sessionScope.currentUser.user_id_pk == requestScope.currentRelationship.sender_user_id_fk}">
                                    Pending request...
                                </c:when>
                            </c:choose>

                        </c:when>

                        <c:when test='${requestScope.currentRelationship.status.equals("accepted")}'>

                            <button type=button class="btn btn-danger" data-toggle="modal" data-target="#deleteFriend">
                                <i class="fa fa-3x fa-user-times" aria-hidden="true"></i>
                            </button>
                        </c:when>

                    </c:choose>


                        </form>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createPrivateMessage">
                            <i class="fa fa-envelope-o fa-3x" aria-hidden="true"></i>

                        </button>
                    </div>

                    </c:if>

            </div>

            <div class="col">

                <div class="row ">
                    <div class="col px-0 separator-bottom mt-2">
                            ${requestScope.currentUser.username}'s info
                    </div>
                </div>


                <div class="row ">
                    <div class="col mt-2">
                        Registered: ${requestScope.currentUser.registration}
                    </div>
                </div>

                <div class="row ">
                    <div class="col mt-2">
                        Name:
                        <span class="infoName">${requestScope.currentUser.name}</span><span class="infoSurname">${requestScope.currentUser.surname}</span>
                    </div>
                </div>


                <div class="row ">
                    <div class="col mt-2">
                        Gender: <span class="infoGender">${requestScope.currentUser.gender}</span>
                    </div>
                </div>

                <div class="row ">
                    <div class="col mt-2">
                        Country: <span class="infoCountry"> ${requestScope.currentUser.country}</span>
                    </div>
                </div>

                <div class="row ">
                    <div class="col mt-2">
                        Email: <span class="infoEmail">${requestScope.currentUser.email}</span>
                    </div>
                </div>

                <div class="row ">
                    <div class="col mt-2">
                        BirthDay: <span class="infoBirthaday">${requestScope.currentUser.birthday}
                    </div>
                </div>

                <div class="row ">
                    <div class="col separator-bottom mt-2">
                    </div>
                </div>

            </div>

        </div>




        <!-- Sección de amigos -->
        <div class="mt-2">
            <div class="row">

                <div class="col">
                    <span class=""> Friends(${requestScope.friendsCurrentUser.size()}) <a href="<c:url value="/BackOffice/FriendList.jsp?id=${requestScope.currentUser.user_id_pk}" />">See all</a></span>
                </div>

            </div>

            <div class="row">

                <div class="col  my-2">

                    <div class="row ml-3 mr-3">

                        <c:forEach var="friend" varStatus="count" items="${requestScope.friendsCurrentUser}">
                            <c:if test="${friend != null}">
                                <c:if test="${count.index < 3}">
                                    <div class="col">
                                        <a href="<c:url value="/BackOffice/Profile.jsp?id=${friend.user_id_pk}" />">${friend.username}</a>
                                        <!--<img class="  img-fluid" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">-->
                                    </div>
                                </c:if>
                            </c:if>

                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>

    <jsp:attribute name="rightBlock">
        <div class="row">
            <div class="col">
                <div class="row mt-3">
                    <div class="col px-0">
                        <span class="col px-0 section-title">Stats</span>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">

            <div class="col px-0">
                <div class="progress">
                    <c:forEach var="countPercent" varStatus="index" items="${requestScope.currentUserSelectedVideogamesCountPercent}">
                        <div class="progress-bar" role="progressbar" style="width: ${countPercent}%; background:
                        <c:choose>
                        <c:when test="${index.index == 0}">#29ba66</c:when>
                        <c:when test="${index.index == 1}">#719994</c:when>
                        <c:when test="${index.index == 2}">#a55c52</c:when>
                        <c:when test="${index.index == 3}">#cfc5c4</c:when>
                                </c:choose>" aria-valuenow="${countPercent}" aria-valuemin="0" aria-valuemax="100"></div>
                    </c:forEach>
                </div>
            </div>

        </div>

        <div class="row mt-3 mb-3">

            <div class="col-md-5 col-12">
                <div class="row">
                    <div class="completed-leyend d-inline-block"></div>
                    <div class="d-inline px-3">Completed :
                        <span class="total-completed">
                                ${requestScope.currentUserSelectedVideogamesCount.get(0)}
                        </span>
                    </div>
                </div>
                <div class="row">
                    <div class="playing-leyend d-inline-block"></div>
                    <div class="d-inline px-3">Playing :
                        <span class="total-playing">
                                ${requestScope.currentUserSelectedVideogamesCount.get(1)}
                        </span>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-12">
                <div class="row">
                    <div class="dropped-leyend d-inline-block"></div>
                    <div class="d-inline px-3">Dropped :
                        <span class="total-dropped">
                                ${requestScope.currentUserSelectedVideogamesCount.get(2)}
                        </span>
                    </div>
                </div>
                <div class="row">
                    <div class="pending-leyend d-inline-block"></div>
                    <div class="d-inline px-3">Pending:
                        <span class="total-pending">
                                ${requestScope.currentUserSelectedVideogamesCount.get(3)}
                        </span>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-3">
                Total entries:
                <span class="total-entry">
                        ${requestScope.currentUserSelectedVideogamesList.size()}
                </span>
            </div>


        </div>

        <div class="row">

            <div class="col">

                <div class="row ">
                    <div class="col separator-bottom mt-2">

                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <div class="row mt-3">
                            <div class="col px-0">
                                <span class="col px-0 section-title">Last updates</span>

                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-12">
                                <div class="row">
                                    <c:choose>
                                        <c:when test="${requestScope.currentUserSelectedVideogamesListReversed.size() == 0}">
                                            <p>No updates yet</p>
                                        </c:when>
                                        <c:otherwise>
                                             <c:forEach var="userSelectedVideogame" varStatus="index" items="${requestScope.currentUserSelectedVideogamesListReversed}">
                                        <c:if test="${index.index < 4}">
                                            <div class="col-6  ">
                                                <div class="col-12 px-0 col-md-4 game-title put-inline no-inline">
                                                    <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${userSelectedVideogame.videogame_id_fk.videogame_id_pk}" />">${userSelectedVideogame.videogame_id_fk.name}</a>
                                                </div>
                                                <div class="col-12 px-0 put-inline no-inline col-md-4 ">
                                                <c:choose>
                                                    <c:when test="${userSelectedVideogame.rating == -1}">
                                                        -
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${userSelectedVideogame.rating}
                                                    </c:otherwise>
                                                </c:choose> <i class="fa fa-star"></i>
                                                </div>
                                                <div class="col-12 px-0 put-inline no-inline col-md-4 ">
                                                        ${userSelectedVideogame.status}
                                                </div>

                                                <img src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a" class="col-12 px-0 img-fluid hidden-sm-down imag-responsive">

                                            </div>
                                        </c:if>

                                    </c:forEach>
                                        </c:otherwise>
                                    </c:choose>


                                </div>

                            </div>

                        </div>
                        <c:if test="${requestScope.currentUserSelectedVideogamesListReversed.size() != 0}">

                            <div class="col  mt-2 ml-3">
                                <button class="btn  float-right" onclick="window.location.href='<c:url
                                    value='/BackOffice/UserGameList.jsp?id=${param["id"]}'/>'">Show more
                                </button>

                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="row ">
                    <div class="col separator-bottom mt-2">

                    </div>
                </div>

                <div class="row py-3">
                    <div class="col-lg-4 col-12 separator-right  put-separator">
                        <div class="row ml-1">
                            <div class=" section-title  mb-2 col px-1">
                                Favorite games
                            </div>
                        </div>
                        <div class="row ml-1">
                            <c:choose>

                                <c:when test="${requestScope.currentFavoriteGamesListReversed.size() == 0}">
                                    <p>Not favorite games yet</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="favoriteGame" varStatus="index" items="${requestScope.currentFavoriteGamesListReversed}">
                                        <c:if test="${index.index < 3}">

                                            <div class="col-4 col-lg-12">
                                                <img src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a" class="col  px-0 img-fluid imag-responsive hidden-sm-down">
                                                <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${favoriteGame.videogame_id_pk}"/>" class="col px-0">${favoriteGame.name}</a>
                                            </div>

                                        </c:if>
                                    </c:forEach>
                                    <div class="row float-right">
                                        <div class="col mt-2">
                                            <button class="btn">Show more</button>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>

                    <div class="col-lg-4 col-12 separator-right put-separator">
                        <div class="row ml-1">
                            <div class=" section-title  mb-2 col px-1">
                                Favorite characters

                            </div>
                        </div>

                        <div class="row ml-1">

                            <c:choose>

                                <c:when test="${requestScope.currentFavoriteCharactersListReversed.size() == 0}">
                                    <p>Not favorite characters yet</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="favoriteCharacter" varStatus="index" items="${requestScope.currentFavoriteCharactersListReversed}">
                                        <c:if test="${index.index < 3}">

                                            <div class="col-4 col-lg-12">
                                                <img src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a" class="col  px-0 img-fluid imag-responsive hidden-sm-down">
                                                <a href="<c:url value="/BackOffice/CharacterCard.jsp?id=${favoriteCharacter.character_id_pk}"/>" class="col px-0">${favoriteCharacter.name}</a>
                                            </div>

                                        </c:if>
                                    </c:forEach>
                                    <div class="row float-right">
                                        <div class="col mt-2">
                                            <button class="btn">Show more</button>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                    <div class="col-lg-4 col-12 ">
                        <div class="row ml-1">
                            <div class=" section-title col  mb-2 px-1">
                                Favorite people

                            </div>
                        </div>
                        <div class="row ml-1">

                            <c:choose>

                                <c:when test="${requestScope.currentFavoritePeopleListReversed.size() == 0}">
                                    <p>Not favorite people yet</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="favoritePeople" varStatus="index" items="${requestScope.currentFavoritePeopleListReversed}">
                                        <c:if test="${index.index < 3}">

                                            <div class="col-4 col-lg-12">
                                                <img src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a" class="col  px-0 img-fluid imag-responsive hidden-sm-down">
                                                <a href="<c:url value="/BackOffice/PeopleCard.jsp?id=${favoritePeople.people_id_pk}"/>" class="col px-0">${favoritePeople.name}</a>
                                            </div>

                                        </c:if>
                                    </c:forEach>
                                    <div class="row float-right">
                                        <div class="col mt-2">
                                            <button class="btn">Show more</button>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>

                </div>
            </div>


    </jsp:attribute>

    <jsp:attribute name="modalBlock">

        <!-- Modal para enviar mensajes privados -->
        <div class="modal fade" id="createPrivateMessage" tabindex="-1" role="dialog" aria-labelledby="createPrivateMessageLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Send message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="privateMessageForm" action="<c:url value="/controller/PrivateMessagesControl" />" method="post">
                            <div class="row">
                                <div class="col">
                                    <label for="subject">Subject </label>
                                    <input id="subject" name="subject">
                                </div>
                            </div>


                        </form>

                    </div>
                    <div class="modal-footer">
                        <button form="privateMessageForm" name="sendPrivateMessage" value="${requestScope.currentUser.user_id_pk}" class="btn btn-primary">Send</button>
                    </div>
                </div>
            </div>
        </div>
    <!--Modal para eliminar amigo -->

        <div class="modal fade" id="deleteFriend" tabindex="-1" role="dialog" aria-labelledby="deleteFriend">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteFriendLabel">Are you sure to delete this friend?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="deleteFriendForm" action="<c:url value="/controller/RelationshipsControl" />" method="post">
                            <div class="row">
                                <div class="col">
                                    <button class="btn btn-danger" name="rejectRelationship" value="${requestScope.currentUser.user_id_pk}">
                                        <i class="fa fa-check fa-3x" aria-hidden="true"></i>
                                    </button>
                                </div>

                                <div class="col">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <i class="fa fa-times fa-3x" aria-hidden="true"></i>

                                    </button>
                                </div>
                            </div>


                        </form>

                    </div>

                </div>
            </div>
        </div>

        <!-- Modal para enviar editar usuario -->
        <div class="modal fade" id="createModify" tabindex="-1" role="dialog" aria-labelledby="createModifyLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modifyModalLabel">Send message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<c:url value="/controller/UsersControl"/>" method="post">


                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newPassword">Password(*)</label>
                                        <input type="password" required class="form-control originalPassword   passwordRegistation pFill password-notFill" id="newPassword" name="password"
                                               placeholder="Enter new password">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group ">
                                        <div class="passwordComprobation errorMessage"></div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group ">
                                        <label for="newRepeatPassword">Repeat password(*)</label>
                                        <input required type="password" class="form-control repeatPassword passwordRegistation pFill password-notFill" id="newRepeatPassword" name="password"
                                               placeholder="Enter new password">
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newName">Name</label>
                                        <input class="form-control modifyName" id="newName" name="name"
                                               placeholder="Enter your name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newSurname">Surname</label>
                                        <input class="form-control modifySurname" id="newSurname" name="surname"
                                               placeholder="Enter your Surname">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="newGender">
                                        Select your gender
                                        <select class="col-6 modifyGender" id="newGender" name="gender">
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>
                                            <option value="O">Other</option>
                                        </select>
                                    </label>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newCountry">Country</label>
                                        <input class="form-control modifyCountry" id="newCountry" name="country"
                                               placeholder="Enter your country">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newEmail">Email</label>
                                        <input class="form-control modifyEmail emailRegistration" type="email" id="newEmail" name="email"
                                               placeholder="Enter your email">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newBirthday">Birthday</label>
                                        <input type="date" class="form-control modifyBirthday" id="newBirthday" name="birthday"
                                               placeholder="Enter your birthday">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newBiography">Biography</label>
                                        <input class="form-control modifyBiography" id="newBiography" name="biography"
                                               placeholder="Enter something about you">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <button class="btn addUser btn-primary">Add user</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>

</tag:cardTemplate>