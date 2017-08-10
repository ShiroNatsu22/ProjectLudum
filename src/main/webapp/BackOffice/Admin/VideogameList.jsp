<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Videogame list</title>
    </jsp:attribute>

    <jsp:body>

        <jsp:include page="/controller/VideogamesControl"/>

        <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#modalAddVideogame">Add
            videogame
        </button>

        <%-- Table that prints a list of all videogames --%>
        <table class="table table-hover table-bordered">
            <thead>
            <tr class="bg-primary text-white">
                <th>Name</th>
                <th>Description</th>
                <th>Delete</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${requestScope.videogameList}" var="item">
                <tr>
                    <td>
                            ${item.name}
                    </td>
                    <td>
                            ${item.description}
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/controller/VideogamesControl" method="post">
                            <button name="deleteVideogame" value="${item.videogame_id_pk}"><i class="fa fa-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%-- Modal with the form that creates new users --%>
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
                        <form action="${pageContext.request.contextPath}/controller/VideogamesControl" method="post">
                            <div class="form-group">
                                <label for="newName">Name</label>
                                <input class="form-control" id="newName" name="name"
                                       placeholder="Enter new name">
                            </div>

                            <div class="form-group">
                                <label for="newDescription">Description</label>
                                <textarea class="form-control" id="newDescription" name="description"
                                          rows="3"></textarea>
                            </div>

                            <button class="btn btn-primary">Add videogame</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>

    </jsp:body>

</tag:pageMaster>