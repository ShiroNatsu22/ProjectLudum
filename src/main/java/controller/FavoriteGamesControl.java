package controller;

import dao.FavoriteGamesDAO;
import dao.FavoriteGamesDAOImpl;
import model.FavoriteGames;
import model.User;
import model.Videogame;

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

            // Obtenemos el número de veces en la que un juego ha sido favoriteado
            int favoriteGamesCount = (favoriteGamesDAO.getFavoriteVideogamesCountByVideogame_id_fk(videogame_id_fk));

            // Obtenemos los juegos favoritos del usuario obtenido a partir de la url
            List<Videogame> favoriteGamesList = favoriteGamesDAO.getAllFavoriteGamesByUser_id_fk(user_id_fk);

            if (currentUser != null) {

                // Obtenemos la relación del usuario actual con el videojuego
                Videogame currentFavoriteGame = favoriteGamesDAO.getFavoriteVideogameByUser_id_fkAndVideogame_id_fk(currentUser.getUser_id_pk(), videogame_id_fk);

                req.setAttribute("currentFavoriteGame", currentFavoriteGame);

            }

            req.setAttribute("currentFavoriteGamesList", favoriteGamesList);
            Collections.reverse(favoriteGamesList);
            req.setAttribute("currentFavoriteGamesListReversed", favoriteGamesList);
            req.setAttribute("currentFavoriteGamesCount", favoriteGamesCount);

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
                favoriteGamesDAO.createFavoriteVideogame(currentUser.getUser_id_pk(), videogame_id_fk);
            }
            // Eliminamos al juego como favorito
            else {
                favoriteGamesDAO.deleteFavoriteVideogameByUser_id_fkAndVideogame_id_fk(currentUser.getUser_id_pk(), videogame_id_fk);
            }

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
