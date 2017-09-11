package dao;

import model.Character;

import java.util.List;

public interface FavoriteCharacterDAO {

    List<Character> getAllFavoriteCharactersByUser_id_fk(int user_id_fk);

    int getFavoriteCharacterCountByCharacter_id_fk(int character_id_fk);

    Character getFavoriteCharacterByUser_id_fkAndCharacter_id_fk(int user_id_fk, int character_id_fk);

    void createFavoriteCharacter(int user_id_fk, int character_id_fk);

    void deleteFavoriteCharacterByUser_id_fkAndCharacter_id_fk(int user_id_fk, int character_id_fk);

}