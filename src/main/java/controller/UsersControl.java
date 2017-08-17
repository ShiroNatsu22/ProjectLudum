package controller;

import dao.DeveloperDAO;
import dao.DeveloperDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/controller/UsersControl")
public class UsersControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserDAO userDAOImpl = new UserDAOImpl();
        req.setAttribute("userList", userDAOImpl.getAllUsers());

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserDAO userDAO = new UserDAOImpl();
        String user_id_pk = req.getParameter("deleteUser");

        if (user_id_pk != null) {

            userDAO.deleteUser(Integer.parseInt(user_id_pk));

        } else {

            User user = new User(0, req.getParameter("username"), req.getParameter("password"), Boolean.parseBoolean(req.getParameter("admin")));

            userDAO.createUser(user);

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
