package model;

import dao.UserDAO;
import dao.UserDAOImpl;
import dao.VideogameDAO;
import dao.VideogameDAOImpl;

public class UserSelectedVideogames {

    private int userSelectedVideogame_id_pk;
    private User user_id_fk;
    private Videogame videogame_id_fk;
    private String status;
    private int rating;

    public UserSelectedVideogames() {

    }

    public UserSelectedVideogames(int userSelectedVideogame_id_pk, int user_id_fk, int videogame_id_fk, String status, int rating) {

        UserDAO userDAO = new UserDAOImpl();
        VideogameDAO videogameDAO = new VideogameDAOImpl();

        this.userSelectedVideogame_id_pk = userSelectedVideogame_id_pk;
        this.user_id_fk = userDAO.getUserByUserID(user_id_fk);
        this.videogame_id_fk = videogameDAO.getVideogameByID(videogame_id_fk);
        this.status = status;
        this.rating = rating;
    }

    public int getUserSelectedVideogame_id_pk() {
        return userSelectedVideogame_id_pk;
    }

    public void setUserSelectedVideogame_id_pk(int userSelectedVideogame_id_pk) {
        this.userSelectedVideogame_id_pk = userSelectedVideogame_id_pk;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
