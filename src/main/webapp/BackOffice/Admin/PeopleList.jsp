<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/CompaniesControl"/>
<jsp:include page="/controller/VideogamesControl"/>


<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Companies list</title>
    </jsp:attribute>

    <jsp:body>

        <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#modalAddPeople">Add
            company
        </button>

        <%-- Table that prints a list of all companies --%>
        <table class="table table-hover table-bordered table-list cell-border">
            <thead>
            <tr class="bg-primary text-white">
                <th>Name</th>
                <th>Founded</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${requestScope.companyList}" var="company">
                <tr>
                    <td>
                        <a href="<c:url value="/BackOffice/CompanyCard.jsp?id=${company.company_id_pk}" />">${company.name}</a>
                    </td>
                    <td>
                            ${company.founded}
                    </td>
                    <td>
                        <form action="<c:url value="/controller/CompaniesControl"/>" method="post">
                            <button name="deleteCompany" value="${company.company_id_pk}"><i class="fa fa-trash"></i>
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
                                <form action="" method="post">
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="newPeopleName">Name</label>
                                                <input class="form-control" id="newPeopleName" name="name"
                                                       placeholder="Enter character name">
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
                                                <label for="newPeopleCompany">Location</label>
                                                <input class="form-control" id="newPeopleCompany" name="company"
                                                       placeholder="Enter person actual company">
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







