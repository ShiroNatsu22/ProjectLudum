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
                <h3>${requestScope.currentVideogame.name}</h3>
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
                        Name: ${requestScope.currentVideogame.name}
                    </div>
                </div>
                <div class="row">
                    <div class="col card-attribute mt-2">
                        Developer:
                        <c:forEach var="developer" items="${requestScope.currentVideogameDeveloperList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/CompanyCard.jsp?id=${developer.company_id_pk}" />">${developer.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="row">
                    <div class="col card-attribute mt-2">
                        Publisher:
                        <c:forEach var="publisher" items="${requestScope.currentVideogamePublisherList}">
                            <a class="ml-1"
                               href="<c:url value="/BackOffice/CompanyCard.jsp?id=${publisher.company_id_pk}" />">${publisher.name}</a>
                        </c:forEach>
                    </div>
                </div>
                <div class="row">
                    <div class="col card-attribute mt-2">
                        Genre:
                    </div>
                </div>
                <div class="row">
                    <div class="col card-attribute mt-2">
                        Platform:
                    </div>
                </div>
                <div class="row">
                    <div class="col hidden-xs card-attribute mt-2">
                        Number of players:
                    </div>
                </div>
                <div class="row">
                    <div class="col card-attribute mt-2">
                        PEGI:
                    </div>
                </div>


            </div>
        </div>

        <div class="col col-12 col-lg-12 col-xl-8">
            <div class="row">
                <div class="col ">

                    <div class="row">
                        <div class="col col-sm-12 mt-2 other-info">
                            <p>${requestScope.currentVideogame.description}</p>
                        </div>
                    </div>

                    <div id="status-selection">
                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col">
                                        Mean score:
                                    </div>
                                    <div class="col">
                                        <select class="custom-select ml-5">
                                            <option selected>Select one state</option>
                                            <option value="completed">Completed</option>
                                            <option value="playing">Playing</option>
                                            <option value="dropped">Dropped</option>
                                            <option value="planToPlay">Plan to play</option>
                                        </select>
                                    </div>

                                    <div class="col">
                                        <select class="custom-select ml-5">
                                            <option selected>Score</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                        </select>
                                    </div>
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
                                <span>Characters:</span>
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
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <span>People:</span>
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