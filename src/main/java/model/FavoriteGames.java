package model;

import dao.UserDAO;
import dao.UserDAOImpl;
import dao.VideogameDAO;
import dao.VideogameDAOImpl;

public class FavoriteGames {

    private int favoriteGame_id_pk;
    private User user_id_fk;
    private Videogame videogame_id_fk;

    public FavoriteGames() {

    }

    public FavoriteGames(int favoriteGame_id_pk, int user_id_fk, int videogame_id_fk) {

        UserDAO userDAO = new UserDAOImpl();
        VideogameDAO videogameDAO = new VideogameDAOImpl();

        this.favoriteGame_id_pk = favoriteGame_id_pk;
        this.user_id_fk = userDAO.getUserByUserID(user_id_fk);
        this.videogame_id_fk = videogameDAO.getVideogameByID(videogame_id_fk);

    }

    public int getFavoriteGame_id_pk() {
        return favoriteGame_id_pk;
    }

    public void setFavoriteGame_id_pk(int favoriteGame_id_pk) {
        this.favoriteGame_id_pk = favoriteGame_id_pk;
    }

    public User getUser_id_fk() {
        return user_id_fk;
    }

    public void setUser_id_fk(User user_id_fk) {
        this.user_id_fk = user_id_fk;
    }

    public Videogame getVideogame_id_fk() {
        return videogame_id_fk;
    }

    public void setVideogame_id_fk(Videogame videogame_id_fk) {
        this.videogame_id_fk = videogame_id_fk;
    }
}
