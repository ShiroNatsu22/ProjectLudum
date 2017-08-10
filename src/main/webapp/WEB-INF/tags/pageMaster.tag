<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags/navbar" %>
<%@ tag description="Overall page template" pageEncoding="UTF-8" %>
<%@ attribute name="head" fragment="true" %>

<!Doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <jsp:invoke fragment="head"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

</head>

<body>

<c:if test="${sessionScope.currentUser.isAdmin()}">
    <navbar:navbarAdmin/>
</c:if>

<navbar:navbar/>

<div class="container px-2 py-2">
    <jsp:doBody/>
</div>


<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/7ec73d1c1e.js"></script>

</body>

</html>