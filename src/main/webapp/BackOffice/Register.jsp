<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>
<link type="text/css" rel="stylesheet" href="<c:url value="../lib/css/login.min.css" />" />

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>

            <div class="row">
                <div class="col-sm-5 " id="formContainer">
                    <p> Formulario de registro</p>
                    <form id="form">


                        <div id="paddings">


                            <div class="registrerUser">
                                <p>(*)Usuer Name:</p>
                                <input type="text" class="form-control" name="user " id="user" placeholder="Enter username">
                            </div>

                            <div class="registrerPass">
                                <p>(*)Password:</p>
                                <input type="password" class="form-control" name="password" id="pass" placeholder="Enter user password">
                            </div>
                            <div class="registrerPass">
                                <p>(*)Repeat password:</p>
                                <input type="password" class="form-control" name="password" id="re-Pass" placeholder="Repeat Password">
                            </div>

                            <div class="registrerMail">
                                <p>(*)Enter email:</p>
                                <input type="email" class="form-control" name="password" id="email" placeholder="Enter email">
                            </div>

                            <div class="registrerMail">
                                <p>(*)Repeat email email:</p>
                                <input type="email" class="form-control" name="password" id="re-email" placeholder="Repeat email">
                            </div>

                            <div class="registrerGender">
                                <p>Gender:</p>
                                <select class="custom-select ">
                                    <option selected>What is your gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <div class="registrerCountry">
                                <p>Country:</p>
                                <input type="text" class="form-control" name="password" id="country" placeholder="Where are you from">
                            </div>

                            <div class="registerBirthday">
                                <p>Country:</p>
                                <input type="date" class="form-control" name="password" id="birthday" placeholder="When is your birthday?">
                            </div>

                            <div class="registerBiography">
                                <p>Something about you:</p>
                                <input type="text" class="form-control" name="password" id="biography" placeholder="Enter some text">
                            </div>



                            <div class="form-group" id="button">
                                <button type="button" class="btn btn-block" name="submit" value="Envia" onclick="" id="submit">Send</button>
                            </div>

                        </div>
                    </form>
                </div>
            </div>




    </jsp:body>

</tag:pageMaster>