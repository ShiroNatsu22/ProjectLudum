package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/controller/CompaniesControl")
public class CompaniesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        CompanyDAO companyDAO = new CompanyDAOImpl();
        String id = req.getParameter("id");

        // Si la petición es desde la ficha de companies
        if (id != null) {

            DeveloperDAO developerDAO = new DeveloperDAOImpl();
            PublisherDAO publisherDAO = new PublisherDAOImpl();

            // Obtenemos la empresa y la lista de la relación con developers y publishers
            Company company = companyDAO.getCompanyByID(Integer.parseInt(id));
            List<Developer> developerList = developerDAO.getDevelopersByCompany_id_fk(company.getCompany_id_pk());
            List<Publisher> publisherList = publisherDAO.getPublishersByCompany_id_fk(company.getCompany_id_pk());

            // Enviamos la empresa actual y sus videojuegos
            req.setAttribute("currentCompany", company);
            req.setAttribute("currentCompanyDeveloperList", developerList);
            req.setAttribute("currentCompanyPublisherList", publisherList);





        } else {

            req.setAttribute("companyList", companyDAO.getAllCompanies());

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        CompanyDAO companyDAO = new CompanyDAOImpl();
        String company_id_pk = req.getParameter("deleteCompany");

        if (company_id_pk != null) {

            companyDAO.deleteCompany(Integer.parseInt(company_id_pk));

        } else {

            DeveloperDAO developerDAO = new DeveloperDAOImpl();
            PublisherDAO publisherDAO = new PublisherDAOImpl();
            DateFormat format = new SimpleDateFormat("YYYY-MM-DD");
            Company company = new Company();
            String[] developedVideogameList = req.getParameterValues("developer_videogame_id_fk");
            String[] publishedVideogameList = req.getParameterValues("publisher_videogame_id_fk");

            try {
                company = new Company(0, req.getParameter("name"), format.parse(req.getParameter("founded")));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            // Creamos la empresa
            int company_id_fk = companyDAO.createCompany(company);

            // Creamos la relación con el developer y el juego
            if (developedVideogameList != null)
                for (String developedVideogame : developedVideogameList)
                    developerDAO.createDeveloper(company_id_fk, Integer.parseInt(developedVideogame));


            // Creamos la relación con el publisher y el juego
            if (publishedVideogameList != null)
                for (String publishedVideogame : publishedVideogameList)
                    publisherDAO.createPublisher(company_id_fk, Integer.parseInt(publishedVideogame));

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
