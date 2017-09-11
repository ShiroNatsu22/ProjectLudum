package controller;

import dao.UserSelectedVideogamesDAO;
import dao.UserSelectedVideogamesDAOImpl;
import model.User;
import model.UserSelectedVideogames;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/controller/UserSelectedVideogamesControl")
public class UserSelectedVideogamesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        UserSelectedVideogamesDAO userSelectedVideogamesDAO = new UserSelectedVideogamesDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");
        String id = req.getParameter("id");

        if (id != null) {

            UserSelectedVideogames userSelectedVideogames = new UserSelectedVideogames();
            List<UserSelectedVideogames> userSelectedVideogamesList;
            List<Integer> videogamesCount = new ArrayList<>();
            List<Integer> videogamesCountPercent = new ArrayList<>();

            // En caso de haber una relación con el juego actual
            if (currentUser != null) {
                userSelectedVideogames = userSelectedVideogamesDAO.getUserSelectedVideogameByUser_id_fkAndVideogame_id_fk(currentUser.getUser_id_pk(), Integer.parseInt(id));

                if (userSelectedVideogames.getUserSelectedVideogame_id_pk() == 0)
                    userSelectedVideogames.setRating(-1);

            }

            // Obtenemos todos las relaciones del usuario actual
            userSelectedVideogamesList = userSelectedVideogamesDAO.getAllUserSelectedVideogamesByUser_id_fk(Integer.parseInt(id));

            // Obtenemos cuantos juegos por status tiene agregados
            videogamesCount.add((int) userSelectedVideogamesList.stream().filter(svl -> svl.getStatus().equals("completed")).count());
            videogamesCount.add((int) userSelectedVideogamesList.stream().filter(svl -> svl.getStatus().equals("playing")).count());
            videogamesCount.add((int) userSelectedVideogamesList.stream().filter(svl -> svl.getStatus().equals("dropped")).count());
            videogamesCount.add((int) userSelectedVideogamesList.stream().filter(svl -> svl.getStatus().equals("planToPlay")).count());


            // Obtenemos el porcentage de estas cuentas
            for (Integer count : videogamesCount)
                videogamesCountPercent.add(count != 0 ? (((count * 100) - 1) / userSelectedVideogamesList.size() + 1) : 0);

            req.setAttribute("currentUserSelectedVideogame", userSelectedVideogames);
            req.setAttribute("currentUserSelectedVideogamesList", userSelectedVideogamesList);
            Collections.reverse(userSelectedVideogamesList);
            req.setAttribute("currentUserSelectedVideogamesListReversed", userSelectedVideogamesList);
            req.setAttribute("currentUserSelectedVideogamesCount", videogamesCount);
            req.setAttribute("currentUserSelectedVideogamesCountPercent", videogamesCountPercent);

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        UserSelectedVideogamesDAO userSelectedVideogamesDAO = new UserSelectedVideogamesDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");
        String addToUserList = req.getParameter("addToUserList");
        String deleteFromUserList = req.getParameter("deleteFromUserList");
        String updateUserList = req.getParameter("updateUserList");

        // Creamos o eliminamos el juego de la lista del usuario actual
        if (addToUserList != null || updateUserList != null || deleteFromUserList != null) {

            int videogame_id_fk = Integer.parseInt(addToUserList != null ? addToUserList : (updateUserList != null ? updateUserList : deleteFromUserList));

            // Se borra la relación actual
            if (updateUserList != null || deleteFromUserList != null) {
                UserSelectedVideogames currentUserSelectedVideogame = userSelectedVideogamesDAO.getUserSelectedVideogameByUser_id_fkAndVideogame_id_fk(currentUser.getUser_id_pk(), videogame_id_fk);
                userSelectedVideogamesDAO.deleteUserSelectedVideogame(currentUserSelectedVideogame.getUserSelectedVideogame_id_pk());
            }

            // Se crea una nueva relación
            if (addToUserList != null || updateUserList != null) {

                String status = req.getParameter("status");
                status = status.equals("none") ? "playing" : status;

                userSelectedVideogamesDAO.createUserSelectedVideogame(new UserSelectedVideogames(0, currentUser.getUser_id_pk(), videogame_id_fk, status, Integer.parseInt(req.getParameter("rating"))));

            }

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
