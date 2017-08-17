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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/controller/CompaniesControl")
public class CompaniesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CompanyDAO companyDAO = new CompanyDAOImpl();
        String id = req.getParameter("id");

        // Si la petición es desde la ficha de companies
        if (id != null) {

            DeveloperDAO developerDAO = new DeveloperDAOImpl();
            VideogameDAO videogameDAO = new VideogameDAOImpl();
            List<Videogame> videogameList = new ArrayList<Videogame>();

            // Obtenemos la empresa y la lista de la relación con developers
            Company company = companyDAO.getCompanyByID(Integer.parseInt(id));
            List<Developer> developerList = developerDAO.getDevelopersByCompany_id_fk(company.getCompany_id_pk());

            // Obtenemos los datos de los videojuegos que hayan sido desarrollados por esta empresa
            for (Developer developer : developerList)
                videogameList.add(videogameDAO.getVideogameByID(developer.getVideogame_id_fk()));

            // Enviamos la empresa actual y sus videojuegos
            req.setAttribute("currentCompany", company);
            req.setAttribute("currentCompanyDeveloperList", videogameList);

        } else {

            req.setAttribute("companyList", companyDAO.getAllCompanies());

        }

        req.setAttribute("companyList", companyDAO.getAllCompanies());

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CompanyDAO companyDAO = new CompanyDAOImpl();
        String company_id_pk = req.getParameter("deleteCompany");

        if (company_id_pk != null) {

            companyDAO.deleteCompany(Integer.parseInt(company_id_pk));

        } else {

            DeveloperDAO developerDAO = new DeveloperDAOImpl();
            DateFormat format = new SimpleDateFormat("YYYY-MM-DD");
            Company company = new Company();
            String[] developedVideogameList = req.getParameterValues("videogame_id_fk");

            try {
                company = new Company(0, req.getParameter("name"), format.parse(req.getParameter("founded")));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            int company_id_fk = companyDAO.createCompany(company);

            // Creamos la relación con el developer y el juego
            for (String developedVideogame : developedVideogameList)
                developerDAO.createDeveloper(company_id_fk, Integer.parseInt(developedVideogame));


        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
