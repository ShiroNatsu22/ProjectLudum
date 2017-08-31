package dao;

import model.DataBase;
import model.Character;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CharacterDAOImpl implements CharacterDAO {

    private DataBase db;

    public CharacterDAOImpl() {
        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");
    }

    @Override
    public List<Character> getAllCharacters() {

        String query = "SELECT * FROM characters";
        return getCharacters(query);

    }

    @Override
    public Character getCharacterByID(int character_id_pk) {
        String query = "SELECT * FROM characters WHERE characters.characters = " + String.valueOf(character_id_pk);
        List<Character> videogameList = getCharacters(query);

        if (!(videogameList.isEmpty()))
            return videogameList.get(0);

        return new Character();
    }

    @Override
    public int createCharacter(Character character) {

        int resultCharacter_id_pk = -1;

        try {

            ResultSet rs;
            String query = "INSERT INTO characters (name, biography) VALUES(?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setString(1, character.getName());
            ps.setString(2, character.getBiography());
            ps.execute();

            rs = ps.getGeneratedKeys();

            if (rs.next())
                resultCharacter_id_pk = rs.getInt(1);

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultCharacter_id_pk;

    }

    @Override
    public void deleteCharacter(int character_id_pk) {

        try {

            String query = String.format("DELETE FROM characters WHERE characters.character_id_pk = %d", character_id_pk);

            PreparedStatement ps = db.getConnection(query);

            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<Character> getCharacters(String query) {

        List<Character> characterList = new ArrayList<Character>();

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next())
                characterList.add(new Character(rs.getInt("character_id_pk"), rs.getString("name"), rs.getString("biography")));


            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return characterList;
    }
}
