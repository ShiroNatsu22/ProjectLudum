package dao;

import model.DataBase;
import model.Character;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
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

        String query = String.format("SELECT * FROM characters WHERE characters.character_id_pk = %d", character_id_pk);
        List<Character> characterList = getCharacters(query);

        if (!(characterList.isEmpty()))
            return characterList.get(0);

        return new Character();

    }

    @Override
    public void createCharacter(Character character) {

        Connection connection = null;
        PreparedStatement ps = null;
        String query = "INSERT INTO characters (name, biography) VALUES(?,?)";

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, character.getName());
            ps.setString(2, character.getBiography());
            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }

    @Override
    public void deleteCharacter(int character_id_pk) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = String.format("DELETE FROM characters WHERE characters.character_id_pk = %d", character_id_pk);

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }

    private List<Character> getCharacters(String query) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Character> characterList = new ArrayList<Character>();

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next())
                characterList.add(new Character(rs.getInt("character_id_pk"), rs.getString("name"), rs.getString("biography")));


            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, rs);
        }

        return characterList;
    }
}
