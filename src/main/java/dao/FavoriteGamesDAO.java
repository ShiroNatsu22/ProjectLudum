package dao;

import model.FavoriteGames;

import java.util.List;

public interface FavoriteGamesDAO {

    List<FavoriteGames> getAllFavoriteGamesByUser_id_fk(int user_id_fk);

    List<FavoriteGames> getAllFavoriteGamesByVideogame_id_fk(int videogame_id_fk);

    FavoriteGames getFavoriteGameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk);

    void createFavoriteGame(FavoriteGames favoriteGames);

    void deleteFavoriteGameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk);

}
