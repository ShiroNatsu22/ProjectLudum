<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>


        <div class="row">
            <div class="col-sm-4 mx-auto " id="formContainer">
                <form action="<c:url value="/controller/Authenticate"/>" method="post" id="form">
                    <img alt="logo" id="logoImg" class="col-sm-12" src="http://lavozdelmuro.net/wp-content/uploads/2017/02/PORTADA-1000x523.jpg">

                    <div id="paddings " class=" col py-3 px-3">
                        <div id="errorMessage">

                        </div>

                        <div class="form-group input-group icon ">
                            <span class="input-group-addon" style="color:white; background-color:#1985A1"><i class="fa fa-user" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="username" id="user" placeholder="Enter username">
                        </div>

                        <div class="form-group input-group">
                            <span class="input-group-addon" style="color:white; background-color:#1985A1"><i class="fa fa-key" aria-hidden="true"></i></span>
                            <input type="password" class="form-control" name="password" id="pass" placeholder="Enter user password">
                        </div>
                        <div class="noAccount">
                            <a href="" data-toggle="modal" data-target="#userRegistration">¿No tienes cuenta? Aqui podras crearte una</a>

                        </div>
                        <div class="form-group" id="button">
                            <button class="btn btn-block" name="submit" id="submit">Send</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>

        <%-- Modal with the form that creates new users --%>
        <div class="modal fade" id="userRegistration" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
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
                                        <label for="newUsername">Username</label>
                                        <input class="form-control" id="newUsername" name="username"
                                               placeholder="Enter new username">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newPassword">Password</label>
                                        <input type="password" class="form-control" id="newPassword" name="password"
                                               placeholder="Enter new password">
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
                                        <label for="newName">Name</label>
                                        <input class="form-control" id="newName" name="name"
                                               placeholder="Enter your name">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newSurname">Name</label>
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
                                        <label for="newEmail">Email</label>
                                        <input class="form-control" type="email" id="newEmail" name="email"
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
                                    <button class="btn btn-primary">Add user</button>
                                </div>
                            </div>

                        </form>
                    </div>


                </div>
            </div>
        </div>

    </jsp:body>

</tag:pageMaster>