<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ tag description="Navbar" pageEncoding="UTF-8" %>

<nav class="navbar navbar-toggleable-sm navbar-inverse bg-primary">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">GamerList</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a>
            </li>
            <li>
                <a class="nav-link" href="${pageContext.request.contextPath}/BackOffice/UserList.jsp">User list</a>
            </li>
        </ul>

        <tag:login/>
    </div>


</nav>
