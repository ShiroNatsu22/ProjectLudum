<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/CharactersControl"/>
<link type="text/css" rel="stylesheet" href="<c:url value="../lib/css/login.min.css" />"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Characters List</title>
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
                    <c:forEach items="${requestScope.characterList}" var="item">
                        <tr>
                            <td>

                            </td>
                            <td>
                                <a href="<c:url value="/BackOffice/CharacterCard.jsp?id=${item.character_id_pk}" />">${item.name}</a>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>

