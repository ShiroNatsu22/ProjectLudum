package controller;

import dao.*;
import model.Company;
import model.Developer;
import model.Videogame;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/controller/VideogamesControl")
public class VideogamesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VideogameDAO videogameDAO = new VideogameDAOImpl();
        String id = req.getParameter("id");

        // Si la peticion es desde la ficha de videojuegos
        if (id != null) {

            DeveloperDAO developerDAO = new DeveloperDAOImpl();
            CompanyDAO companyDAO = new CompanyDAOImpl();
            List<Company> companyList = new ArrayList<Company>();

            // Obtenemos el videojuego y la lista de developers de este
            Videogame videogame = videogameDAO.getVideogameByID(Integer.parseInt(id));
            List<Developer> developerList = developerDAO.getDevelopersByVideogame_id_fk(videogame.getVideogame_id_pk());


            // Obtenemos los datos de las companies que sean los developers del juego
            for (Developer developer : developerList) {
                companyList.add(companyDAO.getCompanyByID(developer.getCompany_id_fk()));
            }

            // Enviamos el juego actual y la lista de desarrolladores
            req.setAttribute("currentVideogame", videogame);
            req.setAttribute("currentVideogameDeveloperList", companyList);

        } else {

            req.setAttribute("videogameList", videogameDAO.getAllVideogames());

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        VideogameDAO videogameDAO = new VideogameDAOImpl();
        String videogame_id_pk = req.getParameter("deleteVideogame");

        // Comprobamos si hay que borrar el juego
        if (videogame_id_pk != null) {

            videogameDAO.deleteVideogame(Integer.parseInt(videogame_id_pk));

        } else {

            DeveloperDAO developerDAO = new DeveloperDAOImpl();
            Videogame videogame = new Videogame(0, req.getParameter("name"), req.getParameter("description"));
            int videogame_id_fk = videogameDAO.createVideogame(videogame);
            String[] developerList = req.getParameterValues("company_id_fk");

            // Se crea la relación entre el videojuego y el developer
            for (String developer : developerList)
                developerDAO.createDeveloper(Integer.parseInt(developer), videogame_id_fk);

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
