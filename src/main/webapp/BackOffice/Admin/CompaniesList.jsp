<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/CompaniesControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Companies list</title>
    </jsp:attribute>

    <jsp:body>

        <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#modalAddCompany">Add
            company
        </button>

        <%-- Table that prints a list of all companies --%>
        <table class="table table-hover table-bordered">
            <thead>
            <tr class="bg-primary text-white">
                <th>Name</th>
                <th>Founded</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${requestScope.companyList}" var="item">
                <tr>
                    <td>
                            ${item.name}
                    </td>
                    <td>
                            ${item.founded}
                    </td>
                    <td>
                        <form action="<c:url value="/controller/CompaniesControl"/>" method="post">
                            <button name="deleteCompany" value="${item.company_id_pk}"><i class="fa fa-trash"></i>
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

                    <div class="modal-body">
                        <form action="<c:url value="/controller/CompaniesControl"/>" method="post">
                            <div class="form-group">
                                <label for="newName">Name</label>
                                <input class="form-control" id="newName" name="name"
                                       placeholder="Enter new name">
                            </div>

                            <div class="form-group">
                                <label for="newFounded">Founded</label>
                                <input type="date" class="" id="newFounded" name="founded"
                                       placeholder="Enter new founded">
                            </div>

                            <button class="btn btn-primary">Add company</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>

    </jsp:body>

</tag:pageMaster>