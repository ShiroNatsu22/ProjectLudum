package controller;

import dao.FavoritePeopleDAO;
import dao.FavoritePeopleDAOImpl;
import model.People;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/controller/FavoritePeopleControl")
public class FavoritePeopleControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        FavoritePeopleDAO favoritePeopleDAO = new FavoritePeopleDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");

        int id = req.getParameter("id") != null ? Integer.parseInt(req.getParameter("id")) : 0;

        if (id != 0) {

            // Obtenemos el número de veces que una persona ha sido agregada a favoritos
            int favoriteCount = favoritePeopleDAO.getFavoritePeopleCountByPeople_id_fk(id);

            // Obtenemos las personas favoritas del usuario obtenido de la url
            List<People> peopleList = favoritePeopleDAO.getAllFavoritePeopleByUser_id_fk(id);

            if (currentUser != null) {

                // Obtenemos la relación del usuario actual con la persona
                People currentFavoritePeople = favoritePeopleDAO.getFavoritePeopleByUser_id_fkAndPeople_id_fk(currentUser.getUser_id_pk(), id);

                req.setAttribute("currentFavoritePeople", currentFavoritePeople);

            }

            req.setAttribute("currentFavoritePeopleList", peopleList);
            Collections.reverse(peopleList);
            req.setAttribute("currentFavoritePeopleListReversed", peopleList);
            req.setAttribute("currentFavoritePeopleCount", favoriteCount);

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        FavoritePeopleDAO favoritePeopleDAO = new FavoritePeopleDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");
        String addFavoritePeople = req.getParameter("addFavoritePeople");
        String deleteFavoritePeople = req.getParameter("deleteFavoritePeople");

        if (addFavoritePeople != null || deleteFavoritePeople != null) {

            int people_id_fk = Integer.parseInt(addFavoritePeople != null ? addFavoritePeople : deleteFavoritePeople);

            // Agregamos a la persona como favorita
            if (addFavoritePeople != null) {
                favoritePeopleDAO.createFavoritePeople(currentUser.getUser_id_pk(), people_id_fk);
            }
            // Eliminamos a la persona como favorita
            else {
                favoritePeopleDAO.deleteFavoritePeopleByUser_id_fkAndPeople_id_fk(currentUser.getUser_id_pk(), people_id_fk);
            }

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }

}
