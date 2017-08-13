package controller;

import dao.CompanyDAO;
import dao.CompanyDAOImpl;
import model.Company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/controller/CompaniesControl")
public class CompaniesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CompanyDAO companyDAO = new CompanyDAOImpl();
        req.setAttribute("companyList", companyDAO.getAllCompanies());

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        CompanyDAO companyDAO = new CompanyDAOImpl();
        String company_id_pk = req.getParameter("deleteCompany");

        if (company_id_pk != null) {

            companyDAO.deleteCompany(Integer.parseInt(company_id_pk));

        } else {

            DateFormat format = new SimpleDateFormat("YYYY-MM-DD");
            Company company = new Company();

            try {
                company = new Company(0, req.getParameter("name"), format.parse(req.getParameter("founded")));
            } catch (ParseException e) {
                e.printStackTrace();
            }

            companyDAO.createCompany(company);

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
