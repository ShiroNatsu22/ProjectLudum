<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Games list</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col">
                <table class="table table-hover table-stripped table-bordered table-list"  width="100%">
                    <thead>
                    <tr class="bg-primary text-white">
                        <th>Image</th>
                        <th>Name</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${requestScope.videogameList}" var="item">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${item.image != null}">
                                        <img class="img-fluid imag-responsive" src="/files/${item.image}" height="50" width="50" alt="gameImg">
                                    </c:when>
                                    <c:otherwise>
                                        <img class="img-fluid imag-responsive" width="50" height="50"
                                             src="http://www.freeiconspng.com/uploads/video-game-controller-icon-33.png"
                                             alt="gameImg">
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="<c:url value="/BackOffice/VideogameCard.jsp?id=${item.videogame_id_pk}" />">${item.name}</a>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>

