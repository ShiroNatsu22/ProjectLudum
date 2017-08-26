package controller;

import dao.*;
import model.PrivateMessage;
import model.Relationship;
import model.User;
import sun.plugin2.message.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("/controller/UsersControl")
public class UsersControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        UserDAO userDAOImpl = new UserDAOImpl();

        // Se comprueba que haya una id del usuario en los parámetros
        if (id != null) {

//            RelationshipDAO relationshipDAO = new RelationshipDAOImpl();
            int user_id_pk = Integer.parseInt(id);
//            User sessionUser = (User) req.getSession(true).getAttribute("currentUser");
            User user = userDAOImpl.getUserByUserID(user_id_pk);
//            Relationship currentRelationship = new Relationship();

            // Se devuelve un usuario a partir de la ID obtenida
            req.setAttribute("currentUser", user);

//            // Se obtiene la relación del usuario de sesión con el usuario
//            if (sessionUser != null)
//                currentRelationship = relationshipDAO.getRelationshipByUserIDandUserID(sessionUser.getUser_id_pk(), user_id_pk);
//
//            req.setAttribute("currentRelationship", currentRelationship);
//
//            // Se obtienen todas los amigos del usuario de la id
//            req.setAttribute("friendsCurrentUser", getUserFriends(user_id_pk));
//
//            // Se obtienen todas las peticiones de amistad del usuario
//            req.setAttribute("friendRequestsCurrentUser", getUserFriendRequests(user_id_pk));

        }
        else {

            // Se obtiene la lista completa de usuarios
            req.setAttribute("userList", userDAOImpl.getAllUsers());

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        UserDAO userDAO = new UserDAOImpl();
        RelationshipDAO relationshipDAO = new RelationshipDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");
        String user_id_pk = req.getParameter("deleteUser");
//        String relationshipRequest = req.getParameter("newRelationshipRequest");
//        String acceptRelationship = req.getParameter("acceptRelationship");
//        String rejectRelationship = req.getParameter("rejectRelationship");

        // Eliminar usuario
        if (user_id_pk != null) {

            userDAO.deleteUser(Integer.parseInt(user_id_pk));

        }
//        // Enviar petición de amistad
//        else if (relationshipRequest != null) {
//
//            relationshipDAO.createRelationship(new Relationship(0, currentUser.getUser_id_pk(), Integer.parseInt(relationshipRequest), "pending"));
//
//        }
//        // Aceptar o rechazar la petición de amistad
//        else if (acceptRelationship != null || rejectRelationship != null) {
//
//            Relationship previousRelationship = relationshipDAO.getRelationshipByUserIDandUserID(Integer.parseInt(acceptRelationship != null ? acceptRelationship : rejectRelationship), currentUser.getUser_id_pk());
//
//            // Borramos la relación anterior
//            relationshipDAO.deleteRelationshipByID(previousRelationship.getRelationship_id_pk());
//
//            // En caso de aceptar la relación
//            if (acceptRelationship != null)
//                relationshipDAO.createRelationship(new Relationship(0, previousRelationship.getSender_user_id_fk(), previousRelationship.getReceiver_user_id_fk(), "accepted"));
//
//        }
        // Crear usuario
        else {

            DateFormat format = new SimpleDateFormat("YYYY-MM-DD");
            User user = null;

            try {
                user = new User(0, req.getParameter("username"), req.getParameter("password"), Boolean.parseBoolean(req.getParameter("admin")), req.getParameter("name"), req.getParameter("surname"), req.getParameter("gender"), req.getParameter("country"), req.getParameter("email"), !(req.getParameter("birthday").equals("")) ? format.parse(req.getParameter("birthday")) : null, req.getParameter("biography"), new Date());
            } catch (ParseException e) {
                e.printStackTrace();
            }

            userDAO.createUser(user);

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }

//    private List<User> getUserFriends(int user_id_fk) {
//
//        return getUserRelationshipUsers(user_id_fk, "accepted");
//
//    }
//
//    private List<User> getUserFriendRequests(int user_id_fk) {
//
//        return getUserRelationshipUsers(user_id_fk, "pending");
//
//    }
//
//    private List<User> getUserRelationshipUsers(int user_id_fk, String status) {
//
//        UserDAO userDAO = new UserDAOImpl();
//        RelationshipDAO relationshipDAO = new RelationshipDAOImpl();
//        List<Relationship> relationshipList = relationshipDAO.getRelationshipsByIDAndStatus(user_id_fk, status);
//        List<User> userList = new ArrayList<User>();
//
//        for (Relationship relationship : relationshipList) {
//
//            if (relationship.getSender_user_id_fk() != user_id_fk)
//                userList.add(userDAO.getUserByUserID(relationship.getSender_user_id_fk()));
//            else
//                userList.add(userDAO.getUserByUserID(relationship.getReceiver_user_id_fk()));
//
//        }
//
//        return userList;
//
//    }

}
