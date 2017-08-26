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
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap4.min.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap4.min.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="../../lib/css/login.min.css" />
    <link rel="stylesheet" href="../lib/css/all.min.css">





</head>

<body>

<c:if test="${sessionScope.currentUser.isAdmin()}">
    <navbar:navbarAdmin/>
</c:if>

<navbar:navbar/>

<div class="container py-2">
    <jsp:doBody/>

</div>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>


<!-- Datatables -->
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>


<!-- FontAwesome -->
<script src="https://use.fontawesome.com/7ec73d1c1e.js"></script>
<!-- Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

<!-- Libraries -->

<script src="../../lib/js/libraries.min.js"></script>

<script src="../../lib/js/calculations.min.js"></script>



</body>

</html>