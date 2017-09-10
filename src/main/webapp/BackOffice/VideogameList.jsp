<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/VideogamesControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col">
                <table class="table table-hover table-stripped table-bordered table-list">
                    <thead>
                    <tr class="bg-primary text-white">
                        <th>Image</th>
                        <th>Username</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${requestScope.videogameList}" var="item">
                        <tr>
                            <td><img class="img-fluid col-2"
                                     src="https://vignette2.wikia.nocookie.net/fairytail/images/1/1a/X791_Natsu_profile.png/revision/latest?cb=20130331212040">
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

