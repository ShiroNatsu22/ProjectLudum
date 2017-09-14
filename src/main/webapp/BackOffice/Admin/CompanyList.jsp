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

        <button type="button" class="btn btn-primary mb-2 " data-toggle="modal" data-target="#modalAddCompany">Add
            company
        </button>

        <%-- Table that prints a list of all companies --%>
        <table class="table table-hover table-bordered table-list cell-border"  width="100%">
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
                            <button style="display:none" type=button onclick="ajaxPetition(${company.company_id_pk})" class="btn btn-danger " data-toggle="modal" data-target="#modifyCompany"><i class="fa fa-pencil" aria-hidden="true"></i></button>

                            <button name="deleteCompany" value="${company.company_id_pk}"><i class="fa fa-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%-- Modal with the form that creates new users --%>

        <div class="modal fade" id="modalAddCompany" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
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
                                <form action="<c:url value="/controller/CompaniesControl"/>" method="post">
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="newName">Name</label>
                                                <input class="form-control" id="newName" name="name"
                                                       placeholder="Enter new name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="newFounded">Founded</label>
                                                <input type="date" class="" id="newFounded" name="founded"
                                                       placeholder="Enter new founded">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="newDeveloperVideogame_id_fk">
                                                Games developed
                                                <select class=col-6 id="newDeveloperVideogame_id_fk" name="developer_videogame_id_fk" multiple="multiple">
                                                    <c:forEach var="videogame" items="${requestScope.videogameList}">
                                                        <option value="${videogame.videogame_id_pk}">${videogame.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label for="newPublisherVideogame_id_fk">
                                                Games published
                                                <select class="col-6" id="newPublisherVideogame_id_fk" name="publisher_videogame_id_fk" multiple="multiple">
                                                    <c:forEach var="videogame" items="${requestScope.videogameList}">
                                                        <option value="${videogame.videogame_id_pk}">${videogame.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <button class="btn btn-primary">Add company</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modifyCompany" tabindex="-1" role="dialog" aria-labelledby="modifyCompany">
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
                                <form action="<c:url value="/controller/CompaniesControl"/>" method="post">
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="name">Name</label>
                                                <input class="form-control" id="name" name="name"
                                                       placeholder="Enter new name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="founded">Founded</label>
                                                <input type="date" class="" id="founded" name="founded"
                                                       placeholder="Enter new founded">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="developerVideogame">
                                                Games developed
                                                <select class=col-6 id="developerVideogame" name="developer_videogame_id_fk" multiple="multiple">
                                                    <c:forEach var="videogame" items="${requestScope.videogameList}">
                                                        <option value="${videogame.videogame_id_pk}">${videogame.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                            <label for="publisherVideogame">
                                                Games published
                                                <select class="col-6" id="publisherVideogame" name="publisher_videogame_id_fk" multiple="multiple">
                                                    <c:forEach var="videogame" items="${requestScope.videogameList}">
                                                        <option value="${videogame.videogame_id_pk}">${videogame.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <button class="btn btn-primary">Modify company</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>

            function ajaxPetition(id) {


                $(document).ready(function () {
                    $.get({
                        url: '<c:url value="/controller/CompaniesControl"/>',
                        data:{
                            id: id
                        },
                        success: function (data) {

                            $("#modalAddCompany").modal("show");
                            console.log(data);

                        }
                    });
                });
            }
        </script>
    </jsp:body>

</tag:pageMaster>