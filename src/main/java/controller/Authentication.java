package controller;

import dao.UserDAO;
import dao.UserDAOImpl;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Authentication extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.getUserByUsername(username);

        boolean authentication = false;

        if (password != null && user.getPassword() != null)
            authentication = password.equals(user.getPassword());

        if (authentication) {

        } else {

        }


    }
}
