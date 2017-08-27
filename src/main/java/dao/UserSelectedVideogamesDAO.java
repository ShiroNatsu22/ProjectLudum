package dao;

import model.UserSelectedVideogames;

import java.util.List;

public interface UserSelectedVideogamesDAO {

    List<UserSelectedVideogames> getAllUserSelectedVideogamesByUser_id_fk(int user_id_fk);

    UserSelectedVideogames getUserSelectedVideogameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk);

    void createUserSelectedVideogame(UserSelectedVideogames userSelectedVideogames);

    void deleteUserSelectedVideogame(int userVideogamesList_id_pk);

}
