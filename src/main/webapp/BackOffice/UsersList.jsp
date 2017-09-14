<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UsersControl"/>

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
                        <th>Username</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${requestScope.userList}" var="item">
                        <tr>
                            <td>
                                <div class="col image">
                                    <c:choose>
                                        <c:when test="${requestScope.currentUser.profileImage != null}">
                                            <img class="img-fluid  col-md-2 table-img imag-responsive" src="${initParam.UserProfileImageFolder}${requestScope.currentUser.profileImage}" alt="userImage">
                                        </c:when>
                                        <c:otherwise>
                                            <img class="img-fluid  col-md-2 table-img imag-responsive" src="http://www.zwiftnation.com/Content/AdminLTE/img/anonymous.png" alt="userImage">
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </td>
                            <td>
                                <a href="<c:url value="/BackOffice/Profile.jsp?id=${item.user_id_pk}" />">${item.username}</a>
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>

