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
                        <ul class="nav nav-tabs nav-fill col">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Amigos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Peticiones de amistad</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col">
                <table class="table table-hover table-stripped table-bordered" id="game-list-table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Imagen</th>
                        <th>Nombre</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td> <div class="col">
                            <img class="img-fluid"
                                 src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                        </div></td>
                        <td>Albatros</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                       <td> <div class="col">
                           <img class="img-fluid"
                                src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
                       </div></td>
                        <td>Hipito</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>