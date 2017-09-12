package dao;

import model.Videogame;
import java.util.List;

public interface FavoriteGamesDAO {

    List<Videogame> getAllFavoriteGamesByUser_id_fk(int user_id_fk);

    int getFavoriteVideogamesCountByVideogame_id_fk(int videogame_id_fk);

    Videogame getFavoriteVideogameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk);

    void createFavoriteVideogame(int user_id_fk, int videogame_id_fk);

    void deleteFavoriteVideogameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk);
}
