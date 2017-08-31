<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags/navbar" %>
<%@ tag description="Navbar" pageEncoding="UTF-8" %>


<nav class="navbar navbar-toggleable-md navbar-inverse bg-primary bg-faded">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#">Gamerlist</a>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav mr-auto mt-2 mt-md-0">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/index.jsp"/>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/BackOffice/VideogameList.jsp"/>">Games</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/BackOffice/characterList.jsp"/>">Characters</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/BackOffice/peopleList.jsp"/>">People</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/BackOffice/UsersList.jsp"/>">Users</a>
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
