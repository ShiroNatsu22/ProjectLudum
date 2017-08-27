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

        req.setCharacterEncoding("UTF-8");
        UserDAO userDAOImpl = new UserDAOImpl();
        String id = req.getParameter("id");

        // Se comprueba que haya una id del usuario en los parámetros
        if (id != null) {

            int user_id_pk = Integer.parseInt(id);
            User user = userDAOImpl.getUserByUserID(user_id_pk);

            // Se devuelve un usuario a partir de la ID obtenida
            req.setAttribute("currentUser", user);

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

        String user_id_pk = req.getParameter("deleteUser");

        // Eliminar usuario
        if (user_id_pk != null) {

            userDAO.deleteUser(Integer.parseInt(user_id_pk));

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
