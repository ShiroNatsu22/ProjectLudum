package controller;

import dao.CharacterDAO;
import dao.CharacterDAOImpl;
import model.Character;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller/CharactersControl")
public class CharactersControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        CharacterDAO characterDAO = new CharacterDAOImpl();
        String id = req.getParameter("id");

        // Se comprueba que haya una id del personaje en los parámetros
        if (id != null) {

            req.setAttribute("currentCharacter", characterDAO.getCharacterByID(Integer.parseInt(id)));

        } else {

            // Se obtiene la lista completa de personajes
            req.setAttribute("characterList", characterDAO.getAllCharacters());

        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        CharacterDAO characterDAO = new CharacterDAOImpl();

        String character_id_pk = req.getParameter("deleteCharacter");

        // Eliminar personaje
        if (character_id_pk != null) {

            characterDAO.deleteCharacter(Integer.parseInt(character_id_pk));

        }
        // Crear personaje
        else {

            Character character = new Character(0, req.getParameter("name"), req.getParameter("biography"));
            characterDAO.createCharacter(character);

        }

        resp.sendRedirect(req.getHeader("Referer"));

    }
}
