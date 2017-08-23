<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" href="../lib/css/cardCss.min.css">
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
                </div>
            </div>
            <div class="col col-12 col-lg-12 col-xl-8">
                <div class="row">
                    <div class="col game-attribute mt-2">
                        Name:
                    </div>
                </div>
                <div class="row">
                    <div class="col game-attribute mt-2">

                    </div>
                </div>
                <div class="row">
                    <div class="col game-attribute mt-2">
                        Publisher:
                        <c:forEach var="publisher" items="${requestScope.currentVideogamePublisherList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/CompanyCard.jsp?id=${publisher.company_id_pk}" />">${publisher.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="row">
                    <div class="col game-attribute mt-2">
                        Genre:
                    </div>
                </div>
                <div class="row">
                    <div class="col game-attribute mt-2">
                        Platform:
                    </div>
                </div>
                <div class="row">
                    <div class="col hidden-xs game-attribute mt-2">
                        Number of players:
                    </div>
                </div>
                <div class="row">
                    <div class="col game-attribute mt-2">
                        PEGI:
                    </div>
                </div>
                <div class="row">
                    <div class="col-6 game-element  border-right-0 border-left-0">
                        <span>People</span>
                        <div class="row mb-2">
                            <div class="col hidden-xs-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col hidden-lg-up">
                                <p>Hideo GODjima</p>
                            </div>

                            <div class="col hidden-xs-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col hidden-lg-up">
                                <p>Hideo GODjima</p>
                            </div>

                            <div class="col hidden-xs-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col hidden-lg-up">
                                <p>Hideo GODjima</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <button>Show me more</button>
                            </div>
                        </div>

                    </div>


                    <div class="col-6 game-element border-right-0">
                        <span>Characters</span>
                        <div class="row mb-2">
                            <div class="col hidden-xs-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col hidden-lg-up">
                                <p>Hideo GODjima</p>
                            </div>

                            <div class="col hidden-xs-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col hidden-lg-up">
                                <p>Hideo GODjima</p>
                            </div>

                            <div class="col hidden-xs-down">
                                <img class="img-fluid imag-responsive"
                                     src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                     alt="gameImg">
                            </div>
                            <div class="col hidden-lg-up">
                                <p>Hideo GODjima</p>
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


        <div class="row">
            <div class="col col-sm-12 mt-2 other-info">
                <p>${requestScope.currentVideogame.description}</p>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>