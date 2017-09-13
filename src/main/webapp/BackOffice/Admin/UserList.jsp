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
        <table class="table table-hover table-bordered"  width="100%">
            <thead>
            <tr class="bg-primary text-white">
                <th>Username</th>
                <th>Password</th>
                <th>Admin</th>
                <th>Edit/Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${requestScope.userList}" var="item">
                <tr>
                    <td>
                        <a href="<c:url value="/BackOffice/Profile.jsp?id=${item.user_id_pk}" />">${item.username}</a>
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
                            <button onclick="ajaxPetition(${item.user_id_pk})" type=button class="btn btn-danger" data-toggle="modal" data-target="#createModify"><i class="fa fa-pencil" aria-hidden="true"></i></button>

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
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newUsername">Username(*)</label>
                                        <input  required class="form-control userRegistration requiredField required-notFill" id="newUsername" name="username"
                                                placeholder="Enter new username">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" id="newAdmin" name="admin"
                                                   value="true">
                                            Is admin?
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newPassword">Password(*)</label>
                                        <input type="password"  required class="form-control originalPassword  passwordRegistation pFill password-notFill" id="newPassword" name="password"
                                               placeholder="Enter new password">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group ">
                                        <div class="passwordComprobation errorMessage"></div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group ">
                                        <label for="newRepeatPassword">Repeat password(*)</label>
                                        <input required type="password" class="form-control repeatPassword  passwordRegistation pFill password-notFill" id="newRepeatPassword" name="password"
                                               placeholder="Enter new password">
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newName">Name</label>
                                        <input class="form-control" id="newName" name="name"
                                               placeholder="Enter your name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newSurname">Surname</label>
                                        <input class="form-control" id="newSurname" name="surname"
                                               placeholder="Enter your Surname">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="newGender">
                                        Select your gender
                                        <select class="col-6" id="newGender" name="gender">
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>
                                            <option value="O">Other</option>
                                        </select>
                                    </label>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newCountry">Country</label>
                                        <input class="form-control" id="newCountry" name="country"
                                               placeholder="Enter your country">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newEmail">Email(*)</label>
                                        <input  required class="form-control emailRegistration requiredField required-notFill" type="email" id="newEmail" name="email"
                                                placeholder="Enter your email">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newBirthday">Birthday</label>
                                        <input type="date" class="form-control" id="newBirthday" name="birthday"
                                               placeholder="Enter your birthday">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newBiography">Biography</label>
                                        <input class="form-control" id="newBiography" name="biography"
                                               placeholder="Enter something about you">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <button class="btn addUser btn-primary">Add user</button>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>


        <div class="modal fade" id="modifyUser" tabindex="-1" role="dialog" aria-labelledby="modifyUserLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modifyModalLabel">Send message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<c:url value="/controller/UsersControl"/>" method="post">


                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newPassword">Password(*)</label>
                                        <input type="password"  class="form-control originalPassword   passwordRegistation pFill password-notFill" id="password" name="password"
                                               placeholder="Enter new password">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group ">
                                        <div class="passwordComprobation errorMessage"></div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group ">
                                        <label for="newRepeatPassword">Repeat password(*)</label>
                                        <input  type="password" class="form-control repeatPassword passwordRegistation pFill password-notFill" id="repeatPassword" name="password"
                                               placeholder="Enter new password">
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newName">Name</label>
                                        <input class="form-control modifyName" id="name" name="name"
                                               placeholder="Enter your name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newSurname">Surname</label>
                                        <input class="form-control modifySurname" id="surname" name="surname"
                                               placeholder="Enter your Surname">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="newGender">
                                        Select your gender
                                        <select class="col-6 modifyGender" id="gender" name="gender">
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>
                                            <option value="O">Other</option>
                                        </select>
                                    </label>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newCountry">Country</label>
                                        <input class="form-control modifyCountry" id="country" name="country"
                                               placeholder="Enter your country">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newEmail">Email</label>
                                        <input class="form-control modifyEmail emailRegistration" type="email" id="email" name="email"
                                               placeholder="Enter your email">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newBirthday">Birthday</label>
                                        <input type="date" class="form-control modifyBirthday" id="birthday" name="birthday"
                                               placeholder="Enter your birthday">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newBiography">Biography</label>
                                        <input class="form-control modifyBiography" id="biography" name="biography"
                                               placeholder="Enter something about you">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <button class="btn addUser btn-primary">Add user</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function ajaxPetition(id) {


                $(document).ready(function () {
                    $.get({
                        url: '<c:url value="/controller/UsersControl"/>',
                        data:{
                            id: id
                        },
                        success: function (data) {
                            console.log(data);
                        }
                    });
                });
            }
        </script>
    </jsp:body>

</tag:pageMaster>