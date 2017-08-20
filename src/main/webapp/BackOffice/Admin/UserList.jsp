<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UsersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>User list</title>
    </jsp:attribute>

    <jsp:body>

        <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#modalAddUser">Add user
        </button>

        <%-- Table that prints a list of all users --%>
        <table class="table table-hover table-bordered">
            <thead>
            <tr class="bg-primary text-white">
                <th>Username</th>
                <th>Password</th>
                <th>Admin</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${requestScope.userList}" var="item">
                <tr>
                    <td>
                        <a href="<c:url value="/BackOffice/Profile.jsp?username=${item.username}" />">${item.username}</a>
                    </td>
                    <td>
                            ${item.password}
                    </td>
                    <td>
                        <input type="checkbox" class="form-check disabled" disabled
                               <c:if test="${item.admin}">checked</c:if> >
                    </td>
                    <td>
                        <form action="<c:url value="/controller/UsersControl"/>" method="post">
                            <button name="deleteUser" value="${item.user_id_pk}"><i class="fa fa-trash"></i></button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%-- Modal with the form that creates new users --%>
        <div class="modal fade" id="modalAddUser" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Add new user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form action="<c:url value="/controller/UsersControl"/>" method="post">
                            <div class="form-group">
                                <label for="newUsername">Username</label>
                                <input class="form-control" id="newUsername" name="username"
                                       placeholder="Enter new username">
                            </div>

                            <div class="form-group">
                                <label for="newPassword">Password</label>
                                <input type="password" class="form-control" id="newPassword" name="password"
                                       placeholder="Enter new password">
                            </div>

                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" id="newAdmin" name="admin"
                                           value="true">
                                    Is admin?
                                </label>
                            </div>

                            <button class="btn btn-primary">Add user</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>

    </jsp:body>

</tag:pageMaster>