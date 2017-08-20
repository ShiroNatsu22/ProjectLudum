<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags/navbar" %>
<%@ tag description="Navbar" pageEncoding="UTF-8" %>

<nav class="navbar navbar-toggleable-sm navbar-inverse bg-primary">
    <div class="container">

        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <a class="navbar-brand" href="<c:url value="/index.jsp"/>">GamerList</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/index.jsp"/>">Home</a>
                </li>
            </ul>

            <c:choose>
                <c:when test="${sessionScope.currentUser != null}">
                    <navbar:navbarUserProfile/>
                </c:when>

                <c:otherwise>
                    <navbar:navbarLogin/>
                </c:otherwise>
            </c:choose>

        </div>

    </div>
</nav>
