<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Lista de amigos de USUARIO</title>
    </jsp:attribute>

    <jsp:body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="col">
                            <ul id="messenger-nav" class="nav nav-tabs" role="tablist">

                                <li class="nav-item">
                                    <a class="nav-link active" href="#received" id="received-tab" role="tab"
                                       data-toggle="tab" aria-controls="received" aria-expanded="true">Mensajes recibidos</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="#send" role="tab" id="send-tab" data-toggle="tab"
                                       aria-controls="request">Mensajes enviados</a>
                                </li>


                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div id="friend-nav-content" class="tab-content">

                <div role="tabpanel" class="tab-pane fade show active" id="received" aria-labelledby="received-tab">
                    <div class="row">
                        <div class="col">
                            <table class="table table-hover table-stripped table-bordered game-list-table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Imagen</th>
                                    <th>Nombre</th>
                                    <th>Mensaje</th>
                                    <th>Borrar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>
                                        <div class="col">
                                            <img class="img-fluid"
                                                 src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                        </div>
                                    </td>
                                    <td>Albatros</td>
                                    <td>Adios</td>
                                    <td> <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>
                                        <div class="col">
                                            <img class="img-fluid"
                                                 src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                        </div>
                                    </td>
                                    <td>Hipito</td>
                                    <td>Hola</td>
                                    <td> <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane fade" id="send" aria-labelledby="send-tab">
                    <div class="row">
                        <div class="col">
                            <table class="table table-hover table-stripped table-bordered game-list-table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Imagen</th>
                                    <th>Nombre</th>
                                    <th>Mensaje</th>
                                    <th>Borrar</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>
                                        <div class="col">
                                            <img class="img-fluid"
                                                 src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                        </div>
                                    </td>
                                    <td>Albatros</td>
                                    <td><i class="fa fa-check-circle" aria-hidden="true"></i></td>
                                    <td> <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>
                                        <div class="col">
                                            <img class="img-fluid"
                                                 src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                        </div>
                                    </td>
                                    <td>Hipito</td>
                                    <td>Adios</td>
                                    <td> <button name="deleteMessage" value=""><i class="fa fa-trash"></i>
                                    </button>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>

        </div>


    </jsp:body>

</tag:pageMaster>