package controller;

import dao.VideogameDAO;
import dao.VideogameDAOImpl;
import model.Videogame;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/controller/VideogamesControl")
public class VideogamesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VideogameDAO videogameDAO = new VideogameDAOImpl();
        List<Videogame> videogameList = videogameDAO.getAllVideogames();
        req.setAttribute("videogameList", videogameList);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VideogameDAO videogameDAO = new VideogameDAOImpl();
        String videogame_id_pk = req.getParameter("deleteVideogame");

        if (videogame_id_pk != null) {

            videogameDAO.deleteVideogame(Integer.parseInt(videogame_id_pk));

        } else {

            String name = req.getParameter("name");
            String description = req.getParameter("description");

            videogameDAO.createVideogame(name, description);

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
