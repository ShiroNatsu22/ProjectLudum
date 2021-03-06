<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/CharactersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Character list</title>
    </jsp:attribute>

    <jsp:body>

        <button type="button" class="btn btn-primary mb-2" data-toggle="modal" data-target="#modalAddCharacter">Add
            character
        </button>

        <%-- Table that prints a list of all characters --%>
        <table class="table table-hover table-bordered table-list cell-border" style="width: 100%">
            <thead>
            <tr class="bg-primary text-white">
                <th>Name</th>
                <th>Biography</th>
                <th></th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${requestScope.characterList}" var="character">
                <tr>
                    <td>
                        <a href="<c:url value="/BackOffice/CharacterCard.jsp?id=${character.character_id_pk}" />">${character.name}</a>
                    </td>
                    <td>
                            ${character.biography}
                    </td>
                    <td>
                        <form action="<c:url value="/controller/CharactersControl"/>" method="post">
                            <button style="display:none" type=button class="btn btn-danger" data-toggle="modal" data-target="#characterModal"><i class="fa fa-pencil" aria-hidden="true"></i></button>

                            <button name="deleteCharacter" value="${character.character_id_pk}">
                                <i class="fa fa-trash"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%-- Modal with the form that creates new  --%>
        <div class="modal fade" id="modalAddCharacter" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Add new character</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form action="<c:url value="/controller/CharactersControl"/>" method="post">

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newCharacterName">Name</label>
                                        <input class="form-control" id="newCharacterName" name="name"
                                               placeholder="Enter character name">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newCharacterBiography">Biography</label>
                                        <input class="form-control" id="newCharacterBiography" name="biography"
                                               placeholder="Enter something about the character">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <button class="btn btn-primary">Add character</button>
                                </div>
                            </div>

                        </form>
                    </div>


                </div>
            </div>
        </div>


        <div class="modal fade" id="characterModal" tabindex="-1" role="dialog" aria-labelledby="characterModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title">Modify character</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form action="<c:url value="/controller/CharactersControl"/>" method="post">

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newCharacterName">Name</label>
                                        <input class="form-control" id="characterName" name="name"
                                               placeholder="Enter character name">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="newCharacterBiography">Biography</label>
                                        <input class="form-control" id="characterBiography" name="biography"
                                               placeholder="Enter something about the character">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <button class="btn btn-primary">Modify character</button>
                                </div>
                            </div>

                        </form>
                    </div>


                </div>
            </div>
        </div>
    </jsp:body>

</tag:pageMaster>







