package controller;

import dao.FavoriteGamesDAO;
import dao.FavoriteGamesDAOImpl;
import model.FavoriteGames;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/controller/FavoriteGamesControl")
public class FavoriteGamesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        FavoriteGamesDAO favoriteGamesDAO = new FavoriteGamesDAOImpl();
        User currentUser = (User) req.getSession(true).getAttribute("currentUser");

        String id = req.getParameter("id");

        if (id != null) {

            int videogame_id_fk = Integer.parseInt(id);
            int user_id_fk = Integer.parseInt(id);


            if (currentUser != null) {

                // Obtenemos la relación del usuario actual con el videojuego
                FavoriteGames currentFavoriteGame = favoriteGamesDAO.getFavoriteGameByUser_id_fkAndVideogame_id_fk(currentUser.getUser_id_pk(), videogame_id_fk);

                // Obtenemos los juegos favoritos del usuario obtenido
                List<FavoriteGames> favoriteGamesList = favoriteGamesDAO.getAllFavoriteGamesByUser_id_fk(user_id_fk);

                int favoriteGamesCount = (favoriteGamesDAO.getAllFavoriteGamesByVideogame_id_fk(videogame_id_fk)).size();

                req.setAttribute("currentFavoriteGame", currentFavoriteGame);
                req.setAttribute("currentFavoriteGamesList", favoriteGamesList);
                Collections.reverse(favoriteGamesList);
                req.setAttribute("currentFavoriteGamesListReversed", favoriteGamesList);
                req.setAttribute("currentFavoriteGamesCount", favoriteGamesCount);

            }

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        FavoriteGamesDAO favoriteGamesDAO = new FavoriteGamesDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");
        String addFavoriteGame = req.getParameter("addFavoriteGame");
        String deleteFavoriteGame = req.getParameter("deleteFavoriteGame");


        if (addFavoriteGame != null || deleteFavoriteGame != null) {

            int videogame_id_fk = Integer.parseInt(addFavoriteGame != null ? addFavoriteGame : deleteFavoriteGame);

            // Agregamos al juego como favorito
            if (addFavoriteGame != null) {
                favoriteGamesDAO.createFavoriteGame(new FavoriteGames(0, currentUser.getUser_id_pk(), videogame_id_fk));
            }

            // Eliminamos al juego como favorito
            if (deleteFavoriteGame != null) {
                favoriteGamesDAO.deleteFavoriteGameByUser_id_fkAndVideogame_id_fk(currentUser.getUser_id_pk(), videogame_id_fk);
            }

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
