package controller;

import dao.RelationshipDAO;
import dao.RelationshipDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import model.Relationship;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/controller/RelationshipsControl")
public class RelationshipsControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RelationshipDAO relationshipDAO = new RelationshipDAOImpl();
        Relationship currentRelationship = new Relationship();
        User currentUser = (User) req.getSession(true).getAttribute("currentUser");
        String id = req.getParameter("id");

        if (id != null) {

            int user_id_pk = Integer.parseInt(id);

            // Se obtiene la relación del usuario de sesión con el usuario
            if (currentUser != null)
                currentRelationship = relationshipDAO.getRelationshipByUserIDandUserID(currentUser.getUser_id_pk(), user_id_pk);

            req.setAttribute("currentRelationship", currentRelationship);

            // Se obtienen todas los amigos del usuario de la id
            req.setAttribute("friendsCurrentUser", getUserFriends(user_id_pk));

            // Se obtienen todas las peticiones de amistad del usuario
            req.setAttribute("friendRequestsCurrentUser", getUserFriendRequests(user_id_pk));

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        RelationshipDAO relationshipDAO = new RelationshipDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");
        String relationshipRequest = req.getParameter("newRelationshipRequest");
        String acceptRelationship = req.getParameter("acceptRelationship");
        String rejectRelationship = req.getParameter("rejectRelationship");

        // Enviar petición de amistad
        if (relationshipRequest != null) {

            relationshipDAO.createRelationship(new Relationship(0, currentUser.getUser_id_pk(), Integer.parseInt(relationshipRequest), "pending"));

        }
        // Aceptar o rechazar la petición de amistad
        else if (acceptRelationship != null || rejectRelationship != null) {

            Relationship previousRelationship = relationshipDAO.getRelationshipByUserIDandUserID(Integer.parseInt(acceptRelationship != null ? acceptRelationship : rejectRelationship), currentUser.getUser_id_pk());

            // Borramos la relación anterior
            relationshipDAO.deleteRelationshipByID(previousRelationship.getRelationship_id_pk());

            // En caso de aceptar la relación
            if (acceptRelationship != null)
                relationshipDAO.createRelationship(new Relationship(0, previousRelationship.getSender_user_id_fk(), previousRelationship.getReceiver_user_id_fk(), "accepted"));

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }

    private List<User> getUserFriends(int user_id_fk) {

        return getUserRelationshipUsers(user_id_fk, "accepted");

    }

    private List<User> getUserFriendRequests(int user_id_fk) {

        return getUserRelationshipUsers(user_id_fk, "pending");

    }

    private List<User> getUserRelationshipUsers(int user_id_fk, String status) {

        UserDAO userDAO = new UserDAOImpl();
        RelationshipDAO relationshipDAO = new RelationshipDAOImpl();
        List<Relationship> relationshipList = relationshipDAO.getRelationshipsByIDAndStatus(user_id_fk, status);
        List<User> userList = new ArrayList<User>();

        for (Relationship relationship : relationshipList) {

            if (relationship.getSender_user_id_fk() != user_id_fk)
                userList.add(userDAO.getUserByUserID(relationship.getSender_user_id_fk()));
            else
                userList.add(userDAO.getUserByUserID(relationship.getReceiver_user_id_fk()));

        }

        return userList;

    }
}
