<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/PeopleControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>People list</title>
    </jsp:attribute>

    <jsp:body>

        <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#modalAddPeople">Add
            people
        </button>

        <%-- Table that prints a list of all companies --%>
        <table class="table table-hover table-bordered table-list cell-border" style="width: 100%">
            <thead>
            <tr class="bg-primary text-white">
                <th>Complete name</th>
                <th>Birthay</th>
                <th>Nationality</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${requestScope.peopleList}" var="people">
                <tr>
                    <td>
                        <a href="<c:url value="/BackOffice/PeopleCard.jsp?id=${people.people_id_pk}" />">${people.name} ${people.surname}</a>
                    </td>
                    <td>
                            ${people.birthday}
                    </td>
                    <td>
                            ${people.nationality}
                    </td>
                    <td>
                        <form action="<c:url value="/controller/PeopleControl"/>" method="post">
                            <button name="deletePeople" value="${people.people_id_pk}"><i class="fa fa-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%-- Modal with the form that creates new users --%>
        <div class="modal fade" id="modalAddPeople" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Add new company</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="modal-body">
                                <form action="<c:url value="/controller/PeopleControl"/>" method="post">
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="newPeopleName">Name</label>
                                                <input class="form-control" id="newPeopleName" name="name"
                                                       placeholder="Enter person name">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="newPeopleSurname">Surname</label>
                                                <input class="form-control" id="newPeopleSurname" name="surname" placeholder="Enter person surname">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="newPeopleBirthday">Birthday</label>
                                                <input type="date" class="form-control" id="newPeopleBirthday" name="birthday"
                                                       placeholder="Enter person birthday">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="newPeopleNationality">Nationality</label>
                                                <input class="form-control" id="newPeopleNationality" name="nationality" placeholder="Enter person nationality">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="newPeopleBiography">Biography</label>
                                                <input class="form-control" id="newPeopleBiography" name="biography"
                                                       placeholder="Enter something about the person">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <button class="btn btn-primary">Add person</button>
                                        </div>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</tag:pageMaster>







