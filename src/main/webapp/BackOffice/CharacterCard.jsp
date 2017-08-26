<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col game-title">
                <h3>CHARACTER NAME</h3>
            </div>
        </div>

        <div class="row">

            <div class="col col-12 col-xl-4 col-md-12 ">
                <div id="card-effect">
                    <div class="row">
                        <div class="col image">
                            <img class="img-fluid imag-responsive"
                                 src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                 alt="gameImg">
                        </div>
                    </div>

                    <div class="col">
                        <div class="row card-attribute">
                            <div class="col  mt-2">
                                Name: Ragnar Lodbrock
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col  mt-2">
                                Name: Macho peluo
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col  mt-2">
                                Name: 30
                            </div>
                        </div>

                        <div class="row card-attribute">
                            <div class="col  mt-2">
                                Location: Kattegat
                            </div>
                        </div>

                    </div>

                </div>
            </div>

            <div class="col col-12 col-lg-12 col-xl-8">
                <div class="row">
                    <div class="col ">

                        <div class="row">
                            <div class="col col-sm-12 mt-2 other-info">
                                <p>asfdasdfasdf sadf sadf sad fsa f sa f sadf sa fs</p>
                            </div>
                        </div>


                    </div>
                </div>

                <!--ANOTACION PARA PABLO: EL PRIMER ELEMENTO DEBE TENER UN ML-3 Y EL ULTIMO UN MR-3 SINOS QUEDA, SI TE FIJAS
                HAY UN hidden-lg-up, ESO SIRVE PARA QUE LAS PANTALLAS DE LG PARA ARRIBA SE OCULTARAN, Y ESA PARTE SOLO SE MOSTRARA EN MOBIL
                -->
                <div class="row mt-5">
                    <div class="col">
                        <div class="row">
                            <div class="col">

                                <div class="rounded info-card">
                                    <div class="row mt-4">
                                        <div class="col col-12 mb-2">
                                            <span class="separator-title ml-4 mb-2">GAMES APPEARED: <button type="button" class="btn show-button">Show me more</button> </span>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col hidden-md-down ml-3 separator">
                                            <img class="img-fluid imag-responsive"
                                                 src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                                 alt="gameImg">

                                            <span>Hideo GODjima</span>
                                        </div>
                                        <div class="col ml-4 col-5 hidden-lg-up">
                                            <span>Hideo GODjima</span>

                                        </div>


                                        <div class="col hidden-md-down separator">
                                            <img class="img-fluid imag-responsive"
                                                 src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                                 alt="gameImg">

                                            <span>Hideo GODjima</span>

                                        </div>
                                        <div class="col col-5 hidden-lg-up">
                                            <span>Hideo GODjima</span>

                                        </div>


                                        <div class="col hidden-md-down separator">
                                            <img class="img-fluid imag-responsive"
                                                 src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                                 alt="gameImg">
                                            <span>Hideo GODjima</span>
                                        </div>
                                        <div class="col ml-4 col-5 hidden-lg-up">
                                            <span>Hideo GODjima</span>

                                        </div>

                                        <div class="col hidden-md-down mr-3">
                                            <img class="img-fluid imag-responsive"
                                                 src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                                 alt="gameImg">

                                            <span>Hideo GODjima</span>
                                        </div>
                                        <div class="col col-5  hidden-lg-up">
                                            <span>Hideo GODjima</span>

                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>