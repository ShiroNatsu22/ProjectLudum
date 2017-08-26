<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="User profile in navbar" pageEncoding="UTF-8" %>

<jsp:include page="/controller/UsersControl"/>

<ul class="navbar-nav">

    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="userOptions" data-toggle="dropdown" aria-expanded="false">
            ${sessionScope.currentUser.username}
        </a>
        <div class="dropdown-menu" aria-labelledby="userOptions">
            <a class="dropdown-item"
               href="<c:url value="/BackOffice/Profile.jsp?id=${sessionScope.currentUser.user_id_pk}" />">
                <i class="fa fa-id-card"></i> Profile
            </a>
            <a class="dropdown-item" href="<c:url value="/BackOffice/FriendList.jsp?id=${sessionScope.currentUser.user_id_pk}" />">
                <i class="fa fa-list"></i> Friends
            </a>
            <a class="dropdown-item" href="<c:url value="/BackOffice/MyMessages.jsp" />">
                <i class="fa fa-envelope"></i> Messages ${requestScope.readedMessagesCount}
            </a>
            <a class="dropdown-item" href="<c:url value="/controller/LogOut" />">
                <i class="fa fa-sign-out"></i> Logout
            </a>
        </div>
    </li>

</ul>


<a class="navbar-brand" href="<c:url value="/BackOffice/Profile.jsp?id=${sessionScope.currentUser.user_id_pk}" />">
    <img src="http://www.zwiftnation.com/Content/AdminLTE/img/anonymous.png" width="30" height="30" alt="userImage">
</a>