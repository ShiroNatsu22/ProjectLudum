<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="Login form" pageEncoding="UTF-8" %>

<form class="form-inline" action="<c:url value="/controller/Authenticate"/>" method="post">

    <div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
        <span class="input-group-addon" id="navLoginUserAddon"><i class="fa fa-user"></i></span>
        <input class="form-control" placeholder="Username" name="username" aria-describedby="navLoginUserAddon">
    </div>
    <div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
        <span class="input-group-addon" id="navLoginPassAddon"><i class="fa fa-key"></i></span>
        <input class="form-control" type="password" placeholder="Password" name="password">
    </div>
    <button class="btn btn-danger btn-sm mr-2 my-2 my-sm-0">LogIn</button>
        <button type=button class="btn btn-danger btn-sm my-2 my-sm-0 float-right" data-toggle="modal" data-target="#userRegistration">SigIn</button>


</form>

<!-- MODAL -->

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


