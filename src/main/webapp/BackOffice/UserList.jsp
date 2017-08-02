<%@page pageEncoding="UTF-8" %>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>User list</title>
    </jsp:attribute>

    <jsp:body>
        <jsp:include page="/controller/UsersControl"/>

        <p>Aquí habrá una lista con los usuarios</p>

        <table>
            <tr>
                <th>Name</th>
                <th>Password</th>
            </tr>

            <c:forEach items="${userList}" var="item">
                <tr>
                    <td>${item.username}</td>
                    <td>${item.password}</td>
                </tr>
            </c:forEach>
        </table>

    </jsp:body>

</tag:pageMaster>