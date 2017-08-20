package controller;

import dao.*;
import model.Relationship;
import model.User;

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
import java.util.Date;
import java.util.List;

@WebServlet("/controller/UsersControl")
public class UsersControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String id = req.getParameter("id");
        UserDAO userDAOImpl = new UserDAOImpl();

        if (id != null) {

            User user = userDAOImpl.getUserByUserID(Integer.parseInt(id));
            req.setAttribute("currentUser", user);

        } else {

            req.setAttribute("userList", userDAOImpl.getAllUsers());

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserDAO userDAO = new UserDAOImpl();
        String user_id_pk = req.getParameter("deleteUser");
        String relationshipRequest = req.getParameter("newRelationshipRequest");

        // Eliminar usuario
        if (user_id_pk != null) {

            userDAO.deleteUser(Integer.parseInt(user_id_pk));

        }
        // Enviar petición de amistad
        else if (relationshipRequest != null) {

            HttpSession session = req.getSession(true);
            User currentUser = (User) session.getAttribute("currentUser");
            RelationshipDAO relationshipDAO = new RelationshipDAOImpl();
            relationshipDAO.createRelationship(new Relationship(0, currentUser.getUser_id_pk(), Integer.parseInt(relationshipRequest), "pending"));

        }
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
}
