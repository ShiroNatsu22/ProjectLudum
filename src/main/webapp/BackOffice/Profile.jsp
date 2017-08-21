<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UsersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Perfil de ${requestScope.currentUser.username} </title>
    </jsp:attribute>

    <jsp:body>

        <!-- Título -->
        <div class="row">
            <div class="col user-name">
                <h3>${requestScope.currentUser.username}</h3>
            </div>
        </div>

        <!-- Bloque información usuario -->
        <div class="row">

            <!-- Bloque izquierdo -->
            <div class="content-info col-4">

                <!-- Imagen usuario -->
                <div class="row">
                    <div class="col image">
                        <img class="img-fluid"
                             src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                             alt="gameImg">
                    </div>
                </div>

                <!-- Lista con información del usuario -->
                <div class="row">

                    <div class="col">

                        <ul class="list-group">
                            <li class="list-group-item">
                                Registered: ${requestScope.currentUser.registration}
                            </li>
                            <li class="list-group-item">
                                Name: ${requestScope.currentUser.name}, ${requestScope.currentUser.surname}
                            </li>
                            <li class="list-group-item">
                                Age: calculo de JS
                            </li>
                            <li class="list-group-item">
                                Gender: ${requestScope.currentUser.gender}
                            </li>
                            <li class="list-group-item">
                                Country: ${requestScope.currentUser.country}
                            </li>
                            <li class="list-group-item">
                                Email: ${requestScope.currentUser.email}
                            </li>
                            <li class="list-group-item">
                                BirthDay: ${requestScope.currentUser.birthday}
                            </li>
                            <li class="list-group-item">
                                Biography: ${requestScope.currentUser.biography}
                            </li>
                            <li class="list-group-item">
                                <form action="<c:url value="/controller/UsersControl" />" method="post">
                                    <button class="btn btn-primary" name="newRelationshipRequest"
                                            value="${requestScope.currentUser.user_id_pk}">Send friendship request
                                    </button>
                                </form>
                            </li>
                        </ul>

                    </div>

                </div>

                <!-- Sección de amigos -->
                <div class="row">

                    <div class="col">
                        <span class="">Amigos <a href="">(x amigos, ver todos)</a></span>
                    </div>

                </div>

                <div class="row">

                    <div class="col my-2">

                        <div class="row">
                            <div class="col">
                                <img class="img-fluid"
                                     src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                            </div>
                            <div class="col">
                                <img class="img-fluid"
                                     src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                            </div>
                            <div class="col">
                                <img class="img-fluid"
                                     src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <!-- Bloque derecho -->
            <div class="status col-8">


                <div class="row">
                    <div style="background:lightgreen" class="col">10</div>
                    <div style="background:lightblue" class="col ">10</div>
                </div>

                <div class="row">
                    <div style="background:lightcoral" class="col ">10</div>
                    <div style="background:lightgray" class="col ">10</div>
                </div>

                <div class="row">
                    <div class="col">Completados Jugando Dropeados Por jugar</div>
                </div>

                <div class="row">

                    <div class="col">
                        <div class="row">
                            <div class="col" style="background: lightblue;"><span
                                    class="col">Ultimas 3 actualizaciones</span>
                                <button>Ver mas</button>
                            </div>
                        </div>

                        <div class="row">

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
                        <div class="row">
                            <div class="col" style="background: lightgreen;"><span
                                    class="col">Ultimos 3 completados</span>
                                <button>Ver mas</button>
                            </div>
                        </div>

                        <div class="row">

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
                        <div class="row">
                            <div class="col" style="background: lightcoral;"><span
                                    class="col">Ultimos 3 dropeados</span>
                                <button>Ver mas</button>
                            </div>
                        </div>

                        <div class="row">

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
                        <div class="row">
                            <div class="col" style="background: lightpink;"><span
                                    class="col">TOP 3 juegos favoritos</span>
                                <button>Ver mas</button>
                            </div>
                        </div>

                        <div class="row">

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
                        <div class="row">
                            <div class="col" style="background: lightgrey;"><span
                                    class="col">Ultimos 3 pendientes</span>
                                <button>Ver mas</button>
                            </div>
                        </div>

                        <div class="row">

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


    </jsp:body>

</tag:pageMaster>