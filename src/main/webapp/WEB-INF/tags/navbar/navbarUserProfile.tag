<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="User profile in navbar" pageEncoding="UTF-8" %>

<jsp:include page="/controller/PrivateMessagesControl"/>

<ul class="navbar-nav">

    <li class="nav-item">
        <a class="nav-link" href="<c:url value="/BackOffice/MyMessages.jsp" />">
            <i class="fa fa-envelope"></i>
            <c:if test="${requestScope.readedMessagesCount > 0}"><span class="badge badge-default">${requestScope.readedMessagesCount}</span></c:if>
        </a>
    </li>

    <li class="nav-item dropdown">

        <a class="nav-link dropdown-toggle" href="#" id="userOptions" data-toggle="dropdown" aria-expanded="false">
            ${sessionScope.currentUser.username}
        </a>
        <div class="dropdown-menu" aria-labelledby="userOptions">
            <a class="dropdown-item"
               href="<c:url value="/BackOffice/Profile.jsp?id=${sessionScope.currentUser.user_id_pk}" />">
                <i class="fa fa-id-card"></i> Profile
            </a>
            <a class="dropdown-item" href="<c:url value="/BackOffice/UserGameList.jsp?id=${sessionScope.currentUser.user_id_pk}"/>">
                <i class="fa fa-list"></i> Gamelist
            </a>
            <a class="dropdown-item" href="<c:url value="/BackOffice/FriendList.jsp?id=${sessionScope.currentUser.user_id_pk}" />">
                <i class="fa fa-users"></i> Friends
            </a>
            <a class="dropdown-item" href="<c:url value="/BackOffice/MyMessages.jsp" />">
                <i class="fa fa-envelope"></i> Messages
                <c:if test="${requestScope.readedMessagesCount > 0}"><span class="badge badge-default">${requestScope.readedMessagesCount}</span></c:if>
            </a>
            <a class="dropdown-item" href="<c:url value="/controller/LogOut" />">
                <i class="fa fa-sign-out"></i> Logout
            </a>
        </div>
    </li>

</ul>


<a class="navbar-brand" href="<c:url value="/BackOffice/Profile.jsp?id=${sessionScope.currentUser.user_id_pk}" />">

    <c:choose>
        <c:when test="${sessionScope.currentUser.profileImage != null}">
            <img src="/files/${sessionScope.currentUser.profileImage}" width="30" height="30" alt="userImage">
        </c:when>
        <c:otherwise>
            <img src="http://www.zwiftnation.com/Content/AdminLTE/img/anonymous.png" width="30" height="30" alt="userImage">
        </c:otherwise>
    </c:choose>

</a>