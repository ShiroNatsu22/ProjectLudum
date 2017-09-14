<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/PeopleControl"/>
<link type="text/css" rel="stylesheet" href="<c:url value="../lib/css/login.min.css" />"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>Provisional</title>
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
                    <c:forEach items="${requestScope.peopleList}" var="item">
                        <tr>
                            <td>

                            </td>
                            <td>
                                <a href="<c:url value="/BackOffice/PeopleCard.jsp?id=${item.people_id_pk}" />">${item.name} ${item.surname}</a>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>

