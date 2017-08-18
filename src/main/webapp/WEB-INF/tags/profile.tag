<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag description="Login form" pageEncoding="UTF-8" %>
<link type="text/css" rel="stylesheet" href="<c:url value="../../lib/css/login.min.css" />" />


<c:choose>
    <c:when test="${currentUser != null}">
        User: ${currentUser.getUsername()}
        <form action="${pageContext.request.contextPath}/controller/LogOut">
            <button>LogOut</button>
        </form>
    </c:when>

    <c:otherwise>
        <div class="row">
            <div class="col user-name">
                <h3>Perfil de INSERTAR USUARIO</h3>
            </div>
        </div>

        <div class="row">
            <div class="content-info col-sm-12">
                <div class="col-4 image float-left">
                    <img class="img-fluid imag-responsive" src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg" alt="gameImg">
                </div>

                <div class="col-sm-8 user-info float-right">
                    <ul class="list-group col-sm-12">
                        <li class="list-group-item" > <div class="user-name">Nombre: Hipito</div></li>
                        <li class="list-group-item">  <div class="user-age">Edad: 22 años</div></li>
                        <li class="list-group-item"> <div class="user-gender">Sexo: Macho de pelo en pecho</div></li>
                        <li class="list-group-item"><div class="user-country">País: Magnolia</div></li>
                        <li class="list-group-item"><div class="user-email">Correo: correo@gmail.com</div></li>
                        <li class="list-group-item" ><div class="user-birthday">Fecha de nacimiento: 3000 A.C</div></li>
                    </ul>
                </div>
                <div class="col-sm-4 float-left ">
                    <span class="col-sm-12 float-right mb-2">Amigos <a href="">(x amigos, ver todos)</a></span>
                    <img  class="float-left col-sm-4 mb-3" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                    <img  class="float-left col-sm-4" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                    <img  class="float-left col-sm-4" src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">

                </div>
            </div>

            <div class="status col-sm-12">
                <div class="col-sm-3 float-left">
                    <ul class="list-group">
                        <li class="list-group-item" style="background:lightblue">Ultimas 3 actualizaciones: <button>Ver mas</button></li>
                        <li class="list-group-item"><img src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Vikings</span></li>
                        <li class="list-group-item"><img src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg" alt="s" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Kingdom hearts</span></li>
                        <li class="list-group-item"><img src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg" alt="d" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Metal Gear solid</span></li>
                    </ul>
                </div>
                <div class="col-sm-3 float-left" >
                    <ul class="list-group">
                        <li class="list-group-item" style="background:lightgreen">Ultimos 3 completados:  <button>Ver mas</button> </li>
                        <li class="list-group-item"><img src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Vikings</span></li>
                        <li class="list-group-item"><img src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg" alt="s" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Kingdom hearts</span></li>
                        <li class="list-group-item"><img src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg" alt="d" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Metal Gear solid</span></li>
                    </ul>
                </div>

                <div class="col-sm-3 float-left" >
                    <ul class="list-group">
                        <li class="list-group-item" style="background:lightcoral">Ultimos 3 dropeados:  <button>Ver mas</button></li>
                        <li class="list-group-item"><img src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Vikings</span></li>
                        <li class="list-group-item"><img src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg" alt="s" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Kingdom hearts</span></li>
                        <li class="list-group-item"><img src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg" alt="d" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Metal Gear solid</span></li>
                    </ul>
                </div>

                <div class="col-sm-3 float-left">
                    <ul class="list-group">
                        <li class="list-group-item" style="background:lightgoldenrodyellow">TOP 3 juegos favoritos:  <button>Ver mas</button></li>
                        <li class="list-group-item"><img src="https://image.tmdb.org/t/p/original/A30ZqEoDbchvE7mCZcSp6TEwB1Q.jpg" alt="a" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Vikings</span></li>
                        <li class="list-group-item"><img src="http://fdzeta.com/data/MetaMirrorCache/___cb20130808121919_finalfantasy_images_1_19_Kingdom_Hearts_Characters.jpg" alt="s" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Kingdom hearts</span></li>
                        <li class="list-group-item"><img src="http://www.hobbyconsolas.com/sites/hobbyconsolas.com/public/media/image/2015/09/518036-que-no-esta-tema-principal-metal-gear-solid-phantom-pain.jpg" alt="d" class="col-sm-8"><span class="col-4">5 <i class="fa fa-star" aria-hidden="true"></i></span><span class="col-sm-12">Metal Gear solid</span></li>
                    </ul>
                </div>

            </div>

            <div class="col col-sm-12 mt-4">
                <span>
                    Comentarios:

                    <div class="comments">
                        <img class="col-sm-1 float-left" src="https://upload.wikimedia.org/wikipedia/en/b/b4/Jaime_Lannister-Nikolaj_Coster-Waldau.jpg" alt="Jaimito">
                        <div class="col-sm-11 float-left">
                            <div class="author col-sm-12"> Escrito por USUARIO</div>
                             <div class="col-sm-12">
                            INSERTAR TEXTO DE COMENTARIO
                            Ete juego e mu vueno me dibierto muxo jugandolo y sabes matando y eso parese el cod
                            </div>
                        </div>

                    </div>

                </span>
            </div>

        </div>


    </c:otherwise>
</c:choose>