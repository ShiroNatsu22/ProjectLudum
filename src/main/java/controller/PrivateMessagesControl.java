package controller;

import dao.*;
import model.PrivateMessage;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/controller/PrivateMessagesControl")
public class PrivateMessagesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        User currentUser = (User) req.getSession(true).getAttribute("currentUser");

        List<PrivateMessage> receivedMessages = getUserReceivedMessages(currentUser.getUser_id_pk());
        List<PrivateMessage> sentMessages = getUserSentMessages(currentUser.getUser_id_pk());
        int privateMessagesUnreadedCount = 0;

        for (PrivateMessage privateMessage : receivedMessages) {

            if (!(privateMessage.isReaded()))
                privateMessagesUnreadedCount++;

        }

        // Se obtiene el número de mensajes no leidos
        req.setAttribute("readedMessagesCount", privateMessagesUnreadedCount);

        // Se obtienen todos los mensajes privados enviados por el usuario actual
        req.setAttribute("sentMessages", sentMessages);
        req.setAttribute("sentMessagesUser", getSentMessagesUser(sentMessages));

        // Se obtienen todos los mensajes privados recibidos por el usuario actual
        req.setAttribute("receivedMessages", receivedMessages);
        req.setAttribute("receivedMessagesUser", getReceivedMessagesUser(receivedMessages));


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        UserDAO userDAO = new UserDAOImpl();
        PrivateMessageDAO privateMessageDAO = new PrivateMessageDAOImpl();
        HttpSession session = req.getSession(true);

        User currentUser = (User) session.getAttribute("currentUser");
        String sendPrivateMessage = req.getParameter("sendPrivateMessage");
        String deletePrivateMessage = req.getParameter("deletePrivateMessage");
        String readedPrivateMessage = req.getParameter("readedPrivateMessage");

        // Enviar mensaje privado
        if (sendPrivateMessage != null) {

            User senderUser = userDAO.getUserByUserID(currentUser.getUser_id_pk());
            User receiverUser = userDAO.getUserByUserID(Integer.parseInt(sendPrivateMessage));

            String subject = req.getParameter("subject");
            String content = req.getParameter("content");

            privateMessageDAO.createPrivateMessage(new PrivateMessage(0, senderUser.getUser_id_pk(), senderUser.getUsername(), receiverUser.getUsername(), subject, content, new Date(), false));
            privateMessageDAO.createPrivateMessage(new PrivateMessage(0, receiverUser.getUser_id_pk(), senderUser.getUsername(), receiverUser.getUsername(), subject, content, new Date(), false));

        }
        // Borrar mensaje privado
        else if (deletePrivateMessage != null) {

            privateMessageDAO.deletePrivateMessage(Integer.parseInt(deletePrivateMessage));

        }
        // Cambiar estado del mensaje
        else if (readedPrivateMessage != null) {

            PrivateMessage privateMessage = privateMessageDAO.getPrivateMessageByID(Integer.parseInt(readedPrivateMessage));
            privateMessageDAO.updatePrivateMessageReaded(privateMessage.getPrivateMessage_id_pk(), privateMessage.isReaded());

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }

    private List<PrivateMessage> getUserSentMessages(int user_id_pk) {
        return getUserMessages(user_id_pk, true);
    }

    private List<PrivateMessage> getUserReceivedMessages(int user_id_pk) {
        return getUserMessages(user_id_pk, false);
    }

    private List<PrivateMessage> getUserMessages(int user_id_pk, boolean sender) {

        PrivateMessageDAO privateMessageDAO = new PrivateMessageDAOImpl();
        UserDAO userDAO = new UserDAOImpl();

        List<PrivateMessage> privateMessageList = privateMessageDAO.getAllPrivateMessagesByOwner_user_id_fk(user_id_pk);
        List<PrivateMessage> resultPrivateMessageList = new ArrayList<PrivateMessage>();
        User user = userDAO.getUserByUserID(user_id_pk);

        for (PrivateMessage privateMessage : privateMessageList) {

            if (sender) {
                if (user.getUsername().equals(privateMessage.getSenderUsername()))
                    resultPrivateMessageList.add(privateMessage);
            } else {
                if (user.getUsername().equals(privateMessage.getReceiverUsername()))
                    resultPrivateMessageList.add(privateMessage);
            }
        }

        return resultPrivateMessageList;

    }

    private List<User> getSentMessagesUser(List<PrivateMessage> privateMessageList) {
        return getMessageUser(privateMessageList, true);
    }

    private List<User> getReceivedMessagesUser(List<PrivateMessage> privateMessageList) {
        return getMessageUser(privateMessageList, false);
    }

    private List<User> getMessageUser(List<PrivateMessage> privateMessageList, boolean sender) {

        UserDAO userDAO = new UserDAOImpl();
        List<User> userList = new ArrayList<User>();

        for (PrivateMessage privateMessage : privateMessageList) {

            if (sender) {
                userList.add(userDAO.getUserByUsername(privateMessage.getReceiverUsername()));
            } else {
                userList.add(userDAO.getUserByUsername(privateMessage.getSenderUsername()));
            }

        }

        return userList;

    }
}
