<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/controller/UsersControl"/>

<tag:pageMaster>

    <jsp:attribute name="head">
        <title>My messages</title>
    </jsp:attribute>

    <jsp:body>

        <div class="row">
            <div class="col">
                <ul id="messenger-nav" class="nav nav-tabs" role="tablist">

                    <li class="nav-item">
                        <a class="nav-link active" href="#received" id="received-tab" role="tab"
                           data-toggle="tab" aria-controls="received">Received Messages</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#send" role="tab" id="send-tab" data-toggle="tab"
                           aria-controls="request">Sent messages</a>
                    </li>


                </ul>
            </div>
        </div>

        <div id="friend-nav-content" class="tab-content">

            <div role="tabpanel" class="tab-pane fade show active" id="received" aria-labelledby="received-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-list">
                            <thead>
                            <tr>
                                <th>Read/Unread</th>
                                <th>User</th>
                                <th>Subject</th>
                                <th>Content</th>
                                <th>Date</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="message" varStatus="count" items="${requestScope.receivedMessages}">
                                <tr>
                                    <td>
                                        <form action="<c:url value="/controller/UsersControl" />" method="post">
                                            <button class="btn" name="readedPrivateMessage" value="${message.privateMessage_id_pk}">${message.readed}</button>
                                        </form>

                                    </td>
                                    <td>
                                        <a href="<c:url value="/BackOffice/Profile.jsp?id=${requestScope.receivedMessagesUser.get(count.index).user_id_pk}" />">${message.senderUsername}</a>
                                    </td>
                                    <td>${message.subject}</td>
                                    <td>${message.content}</td>
                                    <td>${message.sended}</td>
                                    <td>
                                        <form action="<c:url value="/controller/UsersControl" />" method="post">
                                            <button class="btn btn-danger" name="deletePrivateMessage" value="${message.privateMessage_id_pk}">
                                                <i class="fa fa-trash"></i></button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="send" aria-labelledby="send-tab">
                <div class="row">
                    <div class="col">
                        <table class="table table-hover table-stripped table-bordered table-list">
                            <thead>
                            <tr>
                                <th>User</th>
                                <th>Subject</th>
                                <th>Content</th>
                                <th>Date</th>
                                <th>Delete</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="message" varStatus="count" items="${requestScope.sentMessages}">
                                <tr>
                                    <td>
                                        <a href="<c:url value="/BackOffice/Profile.jsp?id=${requestScope.sentMessagesUser.get(count.index).user_id_pk}" />">${message.receiverUsername}</a>
                                    </td>
                                    <td>${message.subject}</td>
                                    <td>${message.content}</td>
                                    <td>${message.sended}</td>
                                    <td>
                                        <form action="<c:url value="/controller/UsersControl" />" method="post">
                                            <button class="btn btn-danger" name="deletePrivateMessage" value="${message.privateMessage_id_pk}">
                                                <i class="fa fa-trash"></i></button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


    </jsp:body>

</tag:pageMaster>