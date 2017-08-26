<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UsersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Perfil de ${requestScope.currentUser.username} </title>
    </jsp:attribute>

    <jsp:body>
        <div class="row">
            <div class="col user-name">
                <h3>${requestScope.currentUser.username}</h3>
            </div>
        </div>

        <!-- Bloque información usuario -->
        <div class="row">

            <div class="col col-12 col-lg-4 col-sm-12 ">
                <div id="card-effect">
                    <!-- Título -->

                    <div class="row">
                        <div class="col image">
                            <img class="img-fluid imag-responsive"
                                 src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                 alt="gameImg">
                        </div>


                    </div>

                    <div class="col">
                        <div class="row card-attribute">
                            <div class="col mt-2">
                                Registered: ${requestScope.currentUser.registration}
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col mt-2">
                                Name: ${requestScope.currentUser.name}, ${requestScope.currentUser.surname}
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col mt-2">
                                Age: calculo de JS
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col mt-2">
                                Gender: ${requestScope.currentUser.gender}
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col mt-2">
                                Country: ${requestScope.currentUser.country}
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col mt-2">
                                Email: ${requestScope.currentUser.email}
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col mt-2">
                                BirthDay: ${requestScope.currentUser.birthday}
                            </div>
                        </div>

                    </div>

                </div>

                <c:if test="${sessionScope.currentUser != null && requestScope.currentUser.user_id_pk != sessionScope.currentUser.user_id_pk}">

                    <!-- Bloque de petición de amistad -->
                    <li class="list-group-item">
                        <form action="<c:url value="/controller/UsersControl" />" method="post">

                            <c:choose>

                                <c:when test="${requestScope.currentRelationship.relationship_id_pk == 0}">
                                    <button class="btn btn-primary" name="newRelationshipRequest"
                                            value="${requestScope.currentUser.user_id_pk}">Send friendship request
                                    </button>
                                </c:when>

                                <c:when test='${requestScope.currentRelationship.status.equals("pending")}'>

                                    <c:choose>
                                        <c:when test="${sessionScope.currentUser.user_id_pk == requestScope.currentRelationship.receiver_user_id_fk}">
                                            <button class="btn btn-primary" name="acceptRelationship" value="${requestScope.currentUser.user_id_pk}">Accept</button>
                                            <button class="btn btn-danger" name="rejectRelationship" value="${requestScope.currentUser.user_id_pk}">Reject</button>
                                        </c:when>

                                        <c:when test="${sessionScope.currentUser.user_id_pk == requestScope.currentRelationship.sender_user_id_fk}">
                                            Pending request...
                                        </c:when>
                                    </c:choose>

                                </c:when>

                                <c:when test='${requestScope.currentRelationship.status.equals("accepted")}'>
                                    Friend
                                    <button class="btn btn-danger" name="rejectRelationship" value="${requestScope.currentUser.user_id_pk}">Delete</button>
                                </c:when>

                            </c:choose>


                        </form>
                    </li>

                    <li class="list-group-item">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createPrivateMessage">
                            Send message
                        </button>
                    </li>

                </c:if>


                </ul>


                <!-- Sección de amigos -->
                <div class="mt-2">
                    <div class="row">

                        <div class="col">
                            <span class="">Friends <a href="<c:url value="/BackOffice/FriendList.jsp?id=${requestScope.currentUser.user_id_pk}" />"><button> See all</button></a></span>
                        </div>

                    </div>


                    <div class="row">

                        <div class="col  my-2">

                            <div class="row ml-3 mr-3">
                                <div class="col">
                                    <img class="  img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </div>
                                <div class="col">
                                    <img class="  img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </div>
                                <div class="col">
                                    <img class=" img-fluid"
                                         src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Bloque derecho -->
            <div class="status col col-md-12 col-sm-12 col-12 col-lg-8">


                <div class="row">
                    <div class="completed-game col"></div>
                    <div class="playing-game col "></div>
                    <div class="dropped-game col "></div>
                    <div class="pending-game col "></div>
                </div>

                <div class="row mt-3 mb-3">

                    <div class="col-4">
                        <div class="row">
                            <div class="completed-leyend d-inline-block"></div>
                            <div class="d-inline">Completed games:<span class="total-completed">10</span></div>
                        </div>
                        <div class="row">
                            <div class="playing-leyend d-inline-block"></div>
                            <div class="d-inline">Playing games:<span class="total-playing">10</span></div>
                        </div>
                    </div>

                    <div class="col-4">
                        <div class="row">
                            <div class="dropped-leyend d-inline-block"></div>
                            <div class="d-inline">Dropped games:<span class="total-dropped">10</span></div>
                        </div>
                        <div class="row">
                            <div class="pending-leyend d-inline-block"></div>
                            <div class="d-inline">Pending games: <span class="total-pending">10</span></div>
                        </div>
                    </div>

                    <div class="col-4">
                        Total entries:<span class="total-entry"></span>
                    </div>
                </div>


                <div class="row">

                    <div class="col">
                        <div class="row mt-3">
                            <div class="col playing-game"><span
                                    class="col">Last 3 updates</span>
                                <button class="float-right">Show More</button>
                            </div>
                        </div>

                        <div class="row game-status-section rounded-bottom ">

                            <div class="col"><img
                                    src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a"
                                    class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                           aria-hidden="true"></i></span><span
                                    class="col-12">Vikings</span></div>
                            <div class="col"><img
                                    src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg"
                                    alt="s" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Kingdom hearts</span></div>
                            <div class="col"><img
                                    src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg"
                                    alt="d" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Metal Gear solid</span></div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col">
                        <div class="row mt-3">
                            <div class="col completed-game" ><span
                                    class="col">Last 3 completed</span>
                                <button class="float-right">Show More</button>
                            </div>
                        </div>

                        <div class="row game-status-section rounded-bottom">

                            <div class="col"><img
                                    src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a"
                                    class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                           aria-hidden="true"></i></span><span
                                    class="col-12">Vikings</span></div>
                            <div class="col"><img
                                    src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg"
                                    alt="s" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Kingdom hearts</span></div>
                            <div class="col"><img
                                    src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg"
                                    alt="d" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Metal Gear solid</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col">
                        <div class="row mt-3">
                            <div class="col dropped-game"><span
                                    class="col">Last 3 dropped</span>
                                <button class="float-right">Show More</button>
                            </div>
                        </div>

                        <div class="row game-status-section rounded-bottom">

                            <div class="col"><img
                                    src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a"
                                    class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                           aria-hidden="true"></i></span><span
                                    class="col-12">Vikings</span>
                            </div>
                            <div class="col"><img
                                    src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg"
                                    alt="s" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Kingdom hearts</span></div>
                            <div class="col"><img
                                    src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg"
                                    alt="d" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Metal Gear solid</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <div class="col">
                        <div class="row mt-3">
                            <div class="col" style="background: lightpink;"><span
                                    class="col">TOP 3 favorites </span>
                                <button class="float-right">Show More</button>
                            </div>
                        </div>

                        <div class="row game-status-section rounded-bottom">

                            <div class="col"><img
                                    src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a"
                                    class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                           aria-hidden="true"></i></span><span
                                    class="col-12">Vikings</span>
                            </div>
                            <div class="col"><img
                                    src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg"
                                    alt="s" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Kingdom hearts</span>
                            </div>
                            <div class="col"><img
                                    src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg"
                                    alt="d" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Metal Gear solid</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="col">
                        <div class="row mt-3">
                            <div class="col pending-game"><span
                                    class="col">Last 3 pending</span>
                                <button class="float-right">Show More</button>
                            </div>
                        </div>

                        <div class="row game-status-section rounded-bottom">

                            <div class="col"><img
                                    src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a"
                                    class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                           aria-hidden="true"></i></span><span
                                    class="col-12">Vikings</span>
                            </div>
                            <div class="col"><img
                                    src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg"
                                    alt="s" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Kingdom hearts</span>
                            </div>
                            <div class="col"><img
                                    src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg"
                                    alt="d" class="col-8"><span class="col-4">5 <i class="fa fa-star"
                                                                                   aria-hidden="true"></i></span><span
                                    class="col-12">Metal Gear solid</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <div class="row">
            <div class="col">
                <span>
                    Comentarios:
                </span>
            </div>
        </div>

        <div class="row">

            <div class="col comments">
                <div class="row">

                    <div class="col-2">
                        <img class="img-fluid"
                             src="https://upload.wikimedia.org/wikipedia/en/b/b4/Jaime_Lannister-Nikolaj_Coster-Waldau.jpg"
                             alt="Jaimito">
                    </div>
                    <div class="col">
                        <div class="author col-2"> Escrito por USUARIO</div>
                        <div class="col-10">
                            INSERTAR TEXTO DE COMENTARIO
                            Ete juego e mu vueno me dibierto muxo jugandolo y sabes matando y eso parese el cod
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <!-- Modal para enviar mensajes privados -->
        <div class="modal fade" id="createPrivateMessage" tabindex="-1" role="dialog" aria-labelledby="createPrivateMessageLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Send message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="privateMessageForm" action="<c:url value="/controller/UsersControl" />" method="post">
                            Subject <input name="subject">
                            Message
                            <textarea name="content"></textarea>

                        </form>

                    </div>
                    <div class="modal-footer">
                        <button form="privateMessageForm" name="sendPrivateMessage" value="${requestScope.currentUser.user_id_pk}" class="btn btn-primary">Send</button>
                    </div>
                </div>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>