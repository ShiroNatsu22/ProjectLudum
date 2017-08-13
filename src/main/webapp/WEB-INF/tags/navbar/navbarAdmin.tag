<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="Admin navbar" pageEncoding="UTF-8" %>

<nav class="navbar navbar-toggleable-sm navbar-inverse bg-inverse">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#adminNavbar" aria-controls="adminNavbar" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <a class="navbar-brand" href="#">Administration</a>

    <div class="collapse navbar-collapse" id="adminNavbar">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/BackOffice/Admin/UserList.jsp"/>">User
                    list</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/BackOffice/Admin/VideogameList.jsp"/>">Videogame
                    list</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/BackOffice/Admin/CompaniesList.jsp"/>">Company
                    list</a>
            </li>
        </ul>

    </div>


</nav>