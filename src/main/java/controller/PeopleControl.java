package controller;

import dao.PeopleDAO;
import dao.PeopleDAOImpl;
import model.People;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/controller/PeopleControl")
public class PeopleControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        PeopleDAO peopleDAO = new PeopleDAOImpl();
        String id = req.getParameter("id");

        // Se comprueba que haya una id de la persona en los parámetros
        if (id != null) {

            req.setAttribute("currentPeople", peopleDAO.getPeopleByID(Integer.parseInt(id)));

        } else {

            // Se obtiene la lista completa de gente
            req.setAttribute("peopleList", peopleDAO.getAllPeople());

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        PeopleDAO peopleDAO = new PeopleDAOImpl();

        String people_id_pk = req.getParameter("deletePeople");

        // Eliminar persona
        if (people_id_pk != null) {

            peopleDAO.deletePeople(Integer.parseInt(people_id_pk));

        }
        // Crear persona
        else {

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

            try {
                People people = new People(0, req.getParameter("name"), req.getParameter("surname"), !(req.getParameter("birthday").equals("")) ? format.parse(req.getParameter("birthday")) : null, req.getParameter("nationality"), req.getParameter("biography"));
                peopleDAO.createPeople(people);
            } catch (ParseException e) {
                e.printStackTrace();
            }

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
