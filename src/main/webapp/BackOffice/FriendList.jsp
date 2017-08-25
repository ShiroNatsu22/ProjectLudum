<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UsersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Lista de amigos de USUARIO</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col">
                <ul id="friend-nav" class="nav nav-tabs" role="tablist">

                    <li class="nav-item">
                        <a class="nav-link active" href="#friend" id="friend-tab" role="tab"
                           data-toggle="tab" aria-controls="friend" aria-expanded="true">Amigos</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#request" role="tab" id="request-tab" data-toggle="tab"
                           aria-controls="request">Peticiones de amistad</a>
                    </li>


                </ul>
            </div>
        </div>

        <div id="friend-nav-content" class="tab-content">

            <div role="tabpanel" class="tab-pane fade show active" id="friend" aria-labelledby="friend-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" cellspacing="0"
                               width="100%">
                            <thead>

                            <tr>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Delete friend</th>
                            </tr>

                            </thead>
                            <tbody>

                            <c:forEach var="friend" items="${requestScope.friendsCurrentUser}">

                                <tr>
                                    <td class="align-middle">
                                        <img height="50" width="50"
                                             src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                    </td>
                                    <td class="align-middle">
                                        <a href="<c:url value="/BackOffice/Profile.jsp?id=${friend.user_id_pk}" />">${friend.username}</a>

                                    </td>
                                    <td class="align-middle">
                                        <form action="<c:url value="/controller/UsersControl" />" method="post">
                                            <button class="btn btn-danger" name="rejectRelationship"
                                                    value="${friend.user_id_pk}"><i class="fa fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="request" aria-labelledby="request-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list" cellspacing="0"
                               width="100%">
                            <thead>
                            <tr>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Status</th>

                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="request" items="${requestScope.friendRequestsCurrentUser}">

                                <tr>
                                    <td class="align-middle">
                                        <a href="<c:url value="/BackOffice/Profile.jsp?id=${request.user_id_pk}" />">${request.username}</a>
                                    </td>
                                    <td class="align-middle">
                                        <img height="50" width="50" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                    </td>
                                    <td class="align-middle">
                                        <form action="<c:url value="/controller/UsersControl" />" method="post">

                                            <c:choose>
                                                <c:when test="${sessionScope.currentUser.user_id_pk == requestScope.currentRelationship.receiver_user_id_fk}">
                                                    <button class="btn btn-primary" name="acceptRelationship" value="${requestScope.currentUser.user_id_pk}">Accept</button>
                                                    <button class="btn btn-danger" name="rejectRelationship" value="${requestScope.currentUser.user_id_pk}">Reject</button>
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


        </div>


    </jsp:body>

</tag:pageMaster>