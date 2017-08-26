package controller;

import dao.*;
import model.Company;
import model.Developer;
import model.Publisher;
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
            PublisherDAO publisherDAO = new PublisherDAOImpl();
            CompanyDAO companyDAO = new CompanyDAOImpl();
            List<Company> developerCompanyList = new ArrayList<Company>();
            List<Company> publisherCompanyList = new ArrayList<Company>();

            // Obtenemos el videojuego y las companies relacionadas
            Videogame videogame = videogameDAO.getVideogameByID(Integer.parseInt(id));
            List<Developer> developerList = developerDAO.getDevelopersByVideogame_id_fk(videogame.getVideogame_id_pk());
            List<Publisher> publisherList = publisherDAO.getPublishersByVideogame_id_fk(videogame.getVideogame_id_pk());


            // Obtenemos los datos de las companies que sean los developers del juego
            for (Developer developer : developerList) {
                developerCompanyList.add(companyDAO.getCompanyByID(developer.getCompany_id_fk()));
            }

            // Obtenemos los datos de las companies que sean los publishers del juego
            for (Publisher publisher : publisherList) {
                publisherCompanyList.add(companyDAO.getCompanyByID(publisher.getCompany_id_fk()));
            }

            // Enviamos el juego actual y la lista de desarrolladores
            req.setAttribute("currentVideogame", videogame);
            req.setAttribute("currentVideogameDeveloperList", developerCompanyList);
            req.setAttribute("currentVideogamePublisherList", publisherCompanyList);

        } else {

            req.setAttribute("videogameList", videogameDAO.getAllVideogames());

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        VideogameDAO videogameDAO = new VideogameDAOImpl();
        String videogame_id_pk = req.getParameter("deleteVideogame");

        // Comprobamos si hay que borrar el juego
        if (videogame_id_pk != null) {

            videogameDAO.deleteVideogame(Integer.parseInt(videogame_id_pk));

        } else {

            DeveloperDAO developerDAO = new DeveloperDAOImpl();
            PublisherDAO publisherDAO = new PublisherDAOImpl();
            Videogame videogame = new Videogame(0, req.getParameter("name"), req.getParameter("description"));
            String[] developerList = req.getParameterValues("developer_company_id_fk");
            String[] publisherList = req.getParameterValues("publisher_company_id_fk");

            // Se crea el videojuego
            int videogame_id_fk = videogameDAO.createVideogame(videogame);

            // Se crea la relación entre el videojuego y el developer
            if (developerList != null)
                for (String developer : developerList)
                    developerDAO.createDeveloper(Integer.parseInt(developer), videogame_id_fk);

            // Se crea la relación entre el videojuego y el publisher
            if (publisherList != null)
                for (String publisher : publisherList)
                    publisherDAO.createPublisher(Integer.parseInt(publisher), videogame_id_fk);

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
