<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col">
                <div class="row">
                    <div class="col">

                        <ul id="user-list-nav" class="nav nav-tabs hidden-sm-down" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" href="#completed" id="completed-tab" role="tab"
                                       data-toggle="tab" aria-controls="completed" aria-expanded="true">Completed</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="#process" id="process-tab" role="tab"
                                       data-toggle="tab" aria-controls="process" aria-expanded="true">In process</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="#dropped" id="dropped-tab" role="tab"
                                       data-toggle="tab" aria-controls="dropped" aria-expanded="true">Dropped</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="#pending" id="pending-tab" role="tab"
                                       data-toggle="tab" aria-controls="pending" aria-expanded="true">Pending</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="#favorite" id="favorite-tab" role="tab"
                                       data-toggle="tab" aria-controls="favorite" aria-expanded="true">Favorites</a>
                                </li>

                        </ul>


                    </div>
                </div>
            </div>
        </div>
        <div id="game-list-nav-content" class="tab-content">

            <div role="tabpanel" class="tab-pane fade show active" id="completed" aria-labelledby="completed-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped responsive table-bordered table-list">
                            <thead>
                            <tr>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Rating</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="userSelectedVideogame" items="${requestScope.currentUserSelectedVideogamesList}">

                            </c:forEach>

                            <tr>
                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Vikings</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Kingdom hearts</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Metal Gear Solid</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show" id="process" aria-labelledby="process-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped responsive table-bordered table-list">
                            <thead>
                            <tr>

                                <th>Imagen</th>
                                <th>Titulo</th>
                                <th>Estado</th>
                                <th>Puntuación</th>
                                <th>Eliminar juego</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Vikings</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Kingdom hearts</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Metal Gear Solid</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show" id="dropped" aria-labelledby="dropped-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped responsive table-bordered table-list">
                            <thead>
                            <tr>

                                <th>Imagen</th>
                                <th>Titulo</th>
                                <th>Estado</th>
                                <th>Puntuación</th>
                                <th>Eliminar juego</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Vikings</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Kingdom hearts</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Metal Gear Solid</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show " id="pending" aria-labelledby="pending-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped responsive table-bordered table-list">
                            <thead>
                            <tr>

                                <th>Imagen</th>
                                <th>Titulo</th>
                                <th>Estado</th>
                                <th>Puntuación</th>
                                <th>Eliminar juego</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Vikings</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Kingdom hearts</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Metal Gear Solid</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade show " id="favorite" aria-labelledby="favorite-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped responsive table-bordered table-list">
                            <thead>
                            <tr>

                                <th>Imagen</th>
                                <th>Titulo</th>
                                <th>Estado</th>
                                <th>Puntuación</th>
                                <th>Eliminar juego</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Vikings</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Kingdom hearts</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>

                                <td><img class="img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </td>
                                <td>Metal Gear Solid</td>
                                <td>Completado</td>
                                <td>10</td>
                                <td>
                                    <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>


        </div>


    </jsp:body>

</tag:pageMaster>