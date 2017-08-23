<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>
<link rel="stylesheet" href="../lib/css/cardCss.min.css">
<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col game-title">
                <h3>Character Name</h3>
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


                <div class="row">
                    <div class="col card-attribute mt-2">
                        Name:
                    </div>
                </div>


            </div>
        </div>

        <div class="col col-12 col-lg-12 col-xl-8">
            <div class="row">
                <div class="col ">

                    <div class="row">
                        <div class="col col-sm-12 mt-2 other-info">
                            <p>Hola</p>
                        </div>
                    </div>

                    <div id="status-selection">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col">
                                        Favorited times:
                                    </div>
                                    <button>Add to favorites</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mb-2">
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <span>Games appeared:</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col hidden-sm-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col">
                                <span>Hideo GODjima</span>

                            </div>


                            <div class="col hidden-sm-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col">
                                <span>Hideo GODjima</span>

                            </div>


                            <div class="col hidden-sm-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col">
                                <span>Hideo GODjima</span>

                            </div>

                            <div class="col hidden-sm-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col">
                                <span>Hideo GODjima</span>

                            </div>
                        </div>


                        <div class="row">
                            <div class="col">
                                <button>Show me more</button>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>


    </jsp:body>

</tag:pageMaster>