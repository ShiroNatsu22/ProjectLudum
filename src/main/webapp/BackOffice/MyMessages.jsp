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
                                    <td>${message.readed}</td>
                                    <td>${requestScope.receivedMessagesUser.get(count.index).username}</td>
                                    <td>${message.subject}</td>
                                    <td>${message.content}</td>
                                    <td>${message.sended}</td>
                                    <td>Delete</td>
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
                                <th>Read/Unread</th>
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
                                    <td>${message.readed}</td>
                                    <td>${requestScope.sentMessagesUser.get(count.index).username}</td>
                                    <td>${message.subject}</td>
                                    <td>${message.content}</td>
                                    <td>${message.sended}</td>
                                    <td>Delete</td>
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