<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/RelationshipsControl"/>
<jsp:include page="/controller/UsersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Lista de amigos de USUARIO</title>
    </jsp:attribute>

    <jsp:body>
        <div class="row ">
            <div class="col px-0 separator-bottom mt-2">
                    ${requestScope.currentUser.username}'s friends
            </div>
        </div>
        <div class="row">
            <div class="col">
                <ul id="friend-nav" class="nav nav-tabs" role="tablist">

                    <li class="nav-item">
                        <a class="nav-link active" href="#friend" id="friend-tab" role="tab"
                           data-toggle="tab" aria-controls="friend" aria-expanded="true">Amigos</a>
                    </li>

                    <c:if test="${sessionScope.currentUser != null}">
                        <c:if test="${sessionScope.currentUser.user_id_pk == param.id}">
                            <li class="nav-item">
                                <a class="nav-link" href="#request" role="tab" id="request-tab" data-toggle="tab"
                                   aria-controls="request">Peticiones de amistad</a>
                            </li>
                        </c:if>
                    </c:if>

                </ul>
            </div>
        </div>

        <div id="friend-nav-content" class="tab-content">

            <div role="tabpanel" class="tab-pane fade show active" id="friend" aria-labelledby="friend-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" cellspacing="0" width="100%">
                            <thead>
                            <tr>

                                <th>Image</th>

                                <th>Name</th>

                                <c:if test="${sessionScope.currentUser != null}">
                                    <c:if test="${sessionScope.currentUser.user_id_pk == param.id}">
                                        <th>Delete friend</th>
                                    </c:if>
                                </c:if>

                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="friend" items="${requestScope.friendsCurrentUser}">

                                <tr>

                                    <td class="align-middle">
                                        <img height="50" width="50" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                    </td>

                                    <td class="align-middle">
                                        <a href="<c:url value="/BackOffice/Profile.jsp?id=${friend.user_id_pk}" />">${friend.username}</a>

                                    </td>

                                    <c:if test="${sessionScope.currentUser != null}">
                                        <c:if test="${sessionScope.currentUser.user_id_pk == param.id}">
                                            <td class="align-middle">
                                                <form action="<c:url value="/controller/RelationshipsControl" />" method="post">
                                                    <button class="btn btn-danger" name="rejectRelationship"
                                                            value="${friend.user_id_pk}"><i class="fa fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </c:if>
                                    </c:if>

                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <c:if test="${sessionScope.currentUser != null}">
                <c:if test="${sessionScope.currentUser.user_id_pk == param.id}">
                    <div role="tabpanel" class="tab-pane fade" id="request" aria-labelledby="request-tab">
                        <div class="row">
                            <div class="col">
                                <table class="table table-hover table-stripped table-bordered table-list" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Status</th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="friends" items="${requestScope.friendRequestsCurrentUser}">

                                        <tr>
                                            <td class="align-middle">
                                                <a href="<c:url value="/BackOffice/Profile.jsp?id=${friends.user_id_pk}" />">${friends.username}</a>
                                            </td>
                                            <td class="align-middle">
                                                <img height="50" width="50" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                            </td>
                                            <td class="align-middle">
                                                <form action="<c:url value="/controller/RelationshipsControl" />" method="post">

                                                    <c:choose>
                                                        <c:when test="${sessionScope.currentUser.user_id_pk == requestScope.currentRelationship.receiver_user_id_fk}">
                                                            <button class="btn btn-primary" name="acceptRelationship" value="${requestScope.currentRelationship.sender_user_id_fk}">Accept</button>
                                                            <button class="btn btn-danger" name="rejectRelationship" value="${requestScope.currentRelationship.sender_user_id_fk}">Reject</button>
                                                        </c:when>

                                                        <c:when test="${sessionScope.currentUser.user_id_pk == requestScope.currentRelationship.sender_user_id_fk}">
                                                            Pending request...
                                                        </c:when>
                                                    </c:choose>

                                                </form>
                                            </td>
                                        </tr>

                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:if>


        </div>


    </jsp:body>

</tag:pageMaster>