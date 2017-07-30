<%@tag description="Overall page template" %>
<%@attribute name="head" fragment="true" %>

<!Doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:invoke fragment="head"/>
</head>

<body>
<ul>
    <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/BackOffice/UserList.jsp">User list</a></li>
</ul>

<jsp:doBody/>

</body>

</html>