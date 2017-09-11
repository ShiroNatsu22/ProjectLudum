package controller;

import dao.FavoriteCharacterDAO;
import dao.FavoriteCharacterDAOImpl;
import model.Character;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet("/controller/FavoriteCharactersControl")
public class FavoriteCharactersControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        FavoriteCharacterDAO favoriteCharacterDAO = new FavoriteCharacterDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");

        int id = req.getParameter("id") != null ? Integer.parseInt(req.getParameter("id")) : 0;

        if (id != 0) {

            // Obtenemos el número de veces que un personaje ha sido agregado a favoritos
            int favoriteCount = favoriteCharacterDAO.getFavoriteCharacterCountByCharacter_id_fk(id);

            // Obtenemos los personajes favoritos del usuario obtenido de la url
            List<Character> characterList = favoriteCharacterDAO.getAllFavoriteCharactersByUser_id_fk(id);

            if (currentUser != null) {

                // Obtenemos la relación del usuario actual con el personaje
                Character currentFavoriteCharacter = favoriteCharacterDAO.getFavoriteCharacterByUser_id_fkAndCharacter_id_fk(currentUser.getUser_id_pk(), id);

                req.setAttribute("currentFavoriteCharacter", currentFavoriteCharacter);

            }

            req.setAttribute("currentFavoriteCharactersList", characterList);
            Collections.reverse(characterList);
            req.setAttribute("currentFavoriteCharactersListReversed", characterList);
            req.setAttribute("currentFavoriteCharacterCount", favoriteCount);

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        FavoriteCharacterDAO favoriteCharacterDAO = new FavoriteCharacterDAOImpl();

        User currentUser = (User) req.getSession(true).getAttribute("currentUser");
        String addFavoriteCharacter = req.getParameter("addFavoriteCharacter");
        String deleteFavoriteCharacter = req.getParameter("deleteFavoriteCharacter");

        if (addFavoriteCharacter != null || deleteFavoriteCharacter != null) {

            int character_id_fk = Integer.parseInt(addFavoriteCharacter != null ? addFavoriteCharacter : deleteFavoriteCharacter);

            // Agregamos al personaje como favorito
            if (addFavoriteCharacter != null) {
                favoriteCharacterDAO.createFavoriteCharacter(currentUser.getUser_id_pk(), character_id_fk);
            }
            // Eliminamos al personaje como favorito
            else {
                favoriteCharacterDAO.deleteFavoriteCharacterByUser_id_fkAndCharacter_id_fk(currentUser.getUser_id_pk(), character_id_fk);
            }

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
