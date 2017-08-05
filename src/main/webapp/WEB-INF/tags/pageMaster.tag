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

<form action="${pageContext.request.contextPath}/controller/Authenticate" method="post">
    <label>
        Username: <input name="username">
    </label>

    <label>
        Password: <input type="password" name="password">
    </label>
    <input type="submit">
</form>

<jsp:doBody/>

</body>

</html>