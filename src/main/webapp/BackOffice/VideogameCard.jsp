<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>

<tag:cardTemplate>

    <jsp:attribute name="head">
        <title>${requestScope.currentVideogame.name}</title>
    </jsp:attribute>

    <jsp:attribute name="subtitle">
        ${requestScope.currentVideogame.name}
    </jsp:attribute>

    <jsp:attribute name="leftBlock">

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
                    <div class="col mt-2">
                        Name: ${requestScope.currentVideogame.name}
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Developer:
                        <c:forEach var="developer" items="${requestScope.currentVideogameDeveloperList}">
                                    <a class="ml-1"
                                       href="<c:url value="/BackOffice/CompanyCard.jsp?id=${developer.company_id_pk}" />">${developer.name}</a>
                                </c:forEach>
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Publisher:
                        <c:forEach var="publisher" items="${requestScope.currentVideogamePublisherList}">
                                    <a class="ml-1"
                                       href="<c:url value="/BackOffice/CompanyCard.jsp?id=${publisher.company_id_pk}" />">${publisher.name}</a>
                                </c:forEach>
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Genre:
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        Platform:
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col hidden-xs  mt-2">
                        Number of players:
                    </div>
                </div>
                <div class="row card-attribute">
                    <div class="col  mt-2">
                        PEGI:
                    </div>
                </div>
            </div>

        </div>

    </jsp:attribute>

    <jsp:attribute name="rightBlock">

        <div class="row">
            <div class="col">
                    ${requestScope.currentVideogame.description}
            </div>
        </div>

        <div class="row">
            <div class="col py-2" style="border: 1px solid lightgrey; background: #f7f7f9">
                <form>

                        <div class="row">
                            <div class="col">
                                Mean score: 5 <i class="fa fa-star"></i>
                            </div>
                            <div class="col" style="border-color: lightgrey; border-width: 1px; border-style: none solid">
                                <select class="form-control">
                                    <option selected>Select one state</option>
                                    <option value="completed">Completed</option>
                                    <option value="playing">Playing</option>
                                    <option value="dropped">Dropped</option>
                                    <option value="planToPlay">Plan to play</option>
                                </select>
                            </div>
                            <div class="col">
                                <select class="form-control">
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

                </form>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col">
                <div class="row">
                    <div class="col">

                        <div class="rounded info-card">
                            <!-- DESKTOP -->
                            <div class="row mt-4">
                                <div class="col col-12 mb-2">
                                    <span class="separator-title ml-4 mb-2">Characters: <button type="button" class="btn show-butto hidden-sm-down">Show me more</button> </span>
                                </div>
                            </div>
                            <!-- END DESKTOP -->
                            <div class="row mb-4">
                                <div class="col hidden-sm-down ml-3 separator">
                                    <img class="img-fluid imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>
                                </div>
                                <div class="col ml-4 col-5 hidden-md-up section-content">
                                    <span>Hideo GODjima</span>

                                </div>


                                <div class="col hidden-sm-down separator">
                                    <img class="img-fluid imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>

                                </div>
                                <div class="col col-5 hidden-md-up section-content">
                                    <span>Hideo GODjima</span>

                                </div>


                                <div class="col hidden-sm-down separator">
                                    <img class="img-fluid imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                    <span>Hideo GODjima</span>
                                </div>
                                <div class="col ml-4 col-5 hidden-md-up section-content">
                                    <span>Hideo GODjima</span>

                                </div>

                                <div class="col hidden-sm-down mr-3">
                                    <img class="img-fluid imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>
                                </div>
                                <div class="col col-5  hidden-md-up section-content">
                                    <span>Hideo GODjima</span>

                                </div>
                            </div>

                            <!-- MOBILE -->
                            <div class="row  mb-2 mr-1 hidden-md-up">
                                <div class="col ">
                                    <button type="button" class="btn show-button float-right">Show me more</button>
                                    </span>
                                </div>
                            </div>
                            <!--END MOBILE -->

                        </div>
                    </div>

                </div>

                <div class="row mt-4">
                    <div class="col">
                        <div class="rounded info-card">
                            <div class="row mt-4">
                                <div class="col mb-2">
                                    <span class="separator-title ml-4 mb-2">People: <button type="button" class="btn hidden-sm-down show-button">Show me more</button></span>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col ml-3 separator">
                                    <img class="img-fluid hidden-sm-down  imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>
                                </div>


                                <div class="col  separator">
                                    <img class="img-fluid hidden-sm-down  imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>

                                </div>


                                <div class="col separator">
                                    <img class="img-fluid hidden-sm-down  imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">
                                    <span>Hideo GODjima</span>
                                </div>

                                <div class="col  mr-3">
                                    <img class="img-fluid hidden-sm-down  imag-responsive"
                                         src="https://s-media-cache-ak0.pinimg.com/originals/a1/4c/58/a14c58f6a7232d6b907877d5e8b57df0.jpg"
                                         alt="gameImg">

                                    <span>Hideo GODjima</span>
                                </div>

                            </div>

                            <!-- MOBILE -->
                            <div class="row  mb-2 mr-1 hidden-md-up">
                                <div class="col ">
                                    <button type="button" class="btn show-button float-right">Show me more</button>
                                    </span>
                                </div>
                            </div>
                            <!--END MOBILE -->
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </jsp:attribute>

</tag:cardTemplate>