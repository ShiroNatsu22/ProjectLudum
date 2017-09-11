package dao;

import model.Character;

import java.util.List;

public interface CharacterDAO {

    List<Character> getAllCharacters();

    Character getCharacterByID(int character_id_pk);

    void createCharacter(Character character);

    void deleteCharacter(int character_id_pk);

}
