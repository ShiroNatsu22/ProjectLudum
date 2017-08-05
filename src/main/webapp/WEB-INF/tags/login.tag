<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="Login form" pageEncoding="UTF-8" %>

<c:choose>
    <c:when test="${currentUser != null}">
        User: ${currentUser.getUsername()}
        <form action="${pageContext.request.contextPath}/controller/LogOut">
            <button>LogOut</button>
        </form>
    </c:when>

    <c:otherwise>
        <form class="form-inline" action="${pageContext.request.contextPath}/controller/Authenticate" method="post">

            <input class="form-control form-control-sm mr-sm-2" placeholder="Username" name="username">
            <input class="form-control form-control-sm mr-sm-2" type="password" placeholder="Password" name="password">
            <button class="btn btn-danger btn-sm my-2 my-sm-0">LogIn</button>

        </form>
    </c:otherwise>
</c:choose>