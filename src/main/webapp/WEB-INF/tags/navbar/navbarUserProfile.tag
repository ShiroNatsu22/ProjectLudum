<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="User profile in navbar" pageEncoding="UTF-8" %>

<span class="navbar-text mb-2 mr-sm-2 mb-sm-0">
    User: ${sessionScope.currentUser.getUsername()}
</span>

<form class="form-inline" action="<c:url value="/controller/LogOut"/>">
    <button class="btn btn-danger btn-sm my-2 my-sm-0">LogOut</button>
</form>