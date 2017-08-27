<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="navbar" tagdir="/WEB-INF/tags/navbar" %>
<%@ tag description="Cards template" pageEncoding="UTF-8" %>
<%@ attribute name="head" fragment="true" %>
<%@ attribute name="subtitle" fragment="true" %>
<%@ attribute name="leftBlock" fragment="true" %>
<%@ attribute name="rightBlock" fragment="true" %>
<%@ attribute name="modalBlock" fragment="true" %>

<!Doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <jsp:invoke fragment="head"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap4.min.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/responsive/2.1.1/css/responsive.bootstrap4.min.css" rel="stylesheet"/>
    <link type="text/css" rel="stylesheet" href="../../lib/css/login.min.css"/>
    <link rel="stylesheet" href="../lib/css/all.min.css">

</head>

<body>

<c:if test="${sessionScope.currentUser.isAdmin()}">
    <navbar:navbarAdmin/>
</c:if>

<navbar:navbar/>

<div class="container pb-2 mt-2" style="border: solid 1px lightgrey">
    <div class="row">
        <div class="col mb-3" style="border-bottom: 1px solid lightgrey; background: #f6f6f6">
            <h3 class="mb-0 py-2">
                <jsp:invoke fragment="subtitle"/>
            </h3>
        </div>
    </div>

    <div class="row">

        <!-- Bloque izquierdo -->
        <div class="col-12 col-lg-4">
            <jsp:invoke fragment="leftBlock"/>
        </div>

        <!-- Bloque derecho -->
        <div class="col-12 col-lg-8 right-block separator-left">
            <div class="col-12">
                <jsp:invoke fragment="rightBlock"/>
            </div>

        </div>

        <div class="row py-3 px-3">
            <div class="col">
                <div class="separator-bottom"></div>
            </div>
        </div>

        <!-- Bloque comentarios -->
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
    </div>
</div>


<jsp:invoke fragment="modalBlock"/>


<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Bootstrap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>


<!-- Datatables -->
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.1.1/js/dataTables.responsive.min.js"></script>


<!-- FontAwesome -->
<script src="https://use.fontawesome.com/7ec73d1c1e.js"></script>
<!-- Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>

<!-- Libraries -->

<script src="../../lib/js/libraries.min.js"></script>

<script src="../../lib/js/toggle-classes.min.js"></script>


</body>

</html>