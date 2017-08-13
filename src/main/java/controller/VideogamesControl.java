package controller;

import dao.DeveloperDAO;
import dao.DeveloperDAOImpl;
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
        String id = req.getParameter("id");

        // Si la peticion es desde la ficha de videojuegos
        if (id != null) {

            req.setAttribute("currentVideogame", videogameDAO.getVideogameByID(Integer.parseInt(id)));

        } else {

            req.setAttribute("videogameList", videogameDAO.getAllVideogames());

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VideogameDAO videogameDAO = new VideogameDAOImpl();
        String videogame_id_pk = req.getParameter("deleteVideogame");

        if (videogame_id_pk != null) {

            videogameDAO.deleteVideogame(Integer.parseInt(videogame_id_pk));

        } else {

            DeveloperDAO developerDAO = new DeveloperDAOImpl();
            Videogame videogame = new Videogame(0, req.getParameter("name"), req.getParameter("description"));
            int videogame_id_fk = videogameDAO.createVideogame(videogame);

            developerDAO.createDeveloper(Integer.parseInt(req.getParameter("company_id_fk")), videogame_id_fk);

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
