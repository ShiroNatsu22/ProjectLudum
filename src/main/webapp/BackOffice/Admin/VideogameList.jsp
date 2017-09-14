<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>
<jsp:include page="/controller/CompaniesControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Videogame list</title>
    </jsp:attribute>

    <jsp:body>

        <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#modalAddVideogame">Add
            videogame
        </button>

        <%-- Table that prints a list of all videogames --%>
        <table class="table table-hover table-bordered table-list"  width="100%">
            <thead>
            <tr class="bg-primary text-white">
                <th>Name</th>
                <th>Description</th>
                <th>Edit/Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${requestScope.videogameList}" var="item">
                <tr>
                    <td>
                        <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${item.videogame_id_pk}"/>">${item.name}</a>
                    </td>
                    <td>
                            ${item.description}
                    </td>
                    <td>
                        <form action="<c:url value="/controller/VideogamesControl"/>" method="post">
                            <button type=button onclick="ajaxPetition(${company.company_id_pk})" class="btn btn-danger " data-toggle="modal" data-target="#videogameModal"><i class="fa fa-pencil" aria-hidden="true"></i></button>

                            <button name="deleteVideogame" value="${item.videogame_id_pk}"><i class="fa fa-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%-- Modal with the form that creates new videogames --%>
        <div class="modal fade" id="modalAddVideogame" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Add new videogame</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form action="<c:url value="/controller/VideogamesControl"/>" method="post" accept-charset="UTF-8">
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
                                        <label for="newDescription">Description</label>
                                        <textarea class="form-control" id="newDescription" name="description"
                                                  rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="newDeveloper_id_fk">
                                        Select developers
                                        <select class="col-6" id="newDeveloper_id_fk" name="developer_company_id_fk" multiple>
                                            <c:forEach var="developer" items="${requestScope.companyList}">
                                                <option value="${developer.company_id_pk}">${developer.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                    <label for="newPublisher_id_fk">
                                        Select publishers

                                        <select class="col-6" id="newPublisher_id_fk" name="publisher_company_id_fk" multiple>
                                            <c:forEach var="publisher" items="${requestScope.companyList}">
                                                <option value="${publisher.company_id_pk}">${publisher.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="newCharacter_id_fk">
                                        Select characters
                                        <select class="col-6" id="newCharacter_id_fk" name="character_id_fk" multiple>
                                            <c:forEach var="character" items="${requestScope.characterList}">
                                                <option value="${character.character_id_pk}">${character.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>

                                </div>
                            </div>

                            <input id="videogameImage" onchange="sendFile()" type="file" name="videogameImage"/>
                            <input id="hfFilename" type="hidden" name="hfFilename">

                            <div class="row">
                                <div class="col">
                                    <button class="btn btn-primary">Add videogame</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <div class="modal fade" id="videogameModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Add new videogame</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form action="<c:url value="/controller/VideogamesControl"/>" method="post" accept-charset="UTF-8">
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
                                        <label for="description">Description</label>
                                        <textarea class="form-control" id="description" name="description"
                                                  rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="developer">
                                        Select developers
                                        <select class="col-6" id="developer" name="developer_company_id_fk" multiple>
                                            <c:forEach var="developer" items="${requestScope.companyList}">
                                                <option value="${developer.company_id_pk}">${developer.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                    <label for="publisher">
                                        Select publishers

                                        <select class="col-6" id="publisher" name="publisher_company_id_fk" multiple>
                                            <c:forEach var="publisher" items="${requestScope.companyList}">
                                                <option value="${publisher.company_id_pk}">${publisher.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="character">
                                        Select characters
                                        <select class="col-6" id="character" name="character_id_fk" multiple>
                                            <c:forEach var="character" items="${requestScope.characterList}">
                                                <option value="${character.character_id_pk}">${character.name}</option>
                                            </c:forEach>
                                        </select>
                                    </label>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <button class="btn btn-primary">Modify videogame</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <script>

            function sendFile() {
                var formData = new FormData();
                formData.append("videogameImage", document.getElementById("videogameImage").files[0]);

                var xhr = new XMLHttpRequest();
                xhr.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        $("#hfFilename").val(this.responseText.substring(1, this.responseText.length - 1));
                    }
                };
                xhr.open("POST", "<c:url value="/controller/FileUpload"/>");
                xhr.send(formData);
            }


        </script>

    </jsp:body>

</tag:pageMaster>