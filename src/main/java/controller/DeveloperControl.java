package controller;

import dao.DeveloperDAO;
import dao.DeveloperDAOImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller/DeveloperControl")
public class DeveloperControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DeveloperDAO developerDAO = new DeveloperDAOImpl();
        // req.setAttribute("developerList", developerDAO.getDevelopersByVideogame_id_fk());

    }
}
