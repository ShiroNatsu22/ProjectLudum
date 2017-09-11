package dao;

import model.Character;
import model.DataBase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavoriteCharacterDAOImpl implements FavoriteCharacterDAO {

    private DataBase db;

    public FavoriteCharacterDAOImpl() {

        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");

    }

    @Override
    public List<Character> getAllFavoriteCharactersByUser_id_fk(int user_id_fk) {

        String query = String.format("SELECT characters.* FROM favoriteCharacters, characters WHERE favoriteCharacters.character_id_fk = characters.character_id_pk AND favoriteCharacters.user_id_fk = %d ORDER BY favoriteCharacter_id_pk", user_id_fk);
        return getFavoriteCharacters(query);

    }

    @Override
    public int getFavoriteCharacterCountByCharacter_id_fk(int character_id_fk) {

        String query = String.format("SELECT COUNT(*) AS count FROM favoriteCharacters WHERE character_id_fk = %d", character_id_fk);
        int count = 0;

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            if (rs.next())
                count = rs.getInt("count");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;

    }

    @Override
    public Character getFavoriteCharacterByUser_id_fkAndCharacter_id_fk(int user_id_fk, int character_id_fk) {

        String query = String.format("SELECT characters.* FROM characters, favoriteCharacters WHERE favoriteCharacters.character_id_fk = characters.character_id_pk AND favoriteCharacters.user_id_fk = %d AND favoriteCharacters.character_id_fk = %d ORDER BY favoriteCharacter_id_pk", user_id_fk, character_id_fk);
        List<Character> characterList = getFavoriteCharacters(query);

        if (!(characterList.isEmpty()))
            return characterList.get(0);

        return new Character();

    }

    @Override
    public void createFavoriteCharacter(int user_id_fk, int character_id_fk) {

        String query = "INSERT INTO favoriteCharacters (user_id_fk, character_id_fk) VALUES(?,?)";

        try {


            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, user_id_fk);
            ps.setInt(2, character_id_fk);

            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deleteFavoriteCharacterByUser_id_fkAndCharacter_id_fk(int user_id_fk, int character_id_fk) {

        String query = String.format("DELETE FROM favoriteCharacters WHERE user_id_fk = %d AND character_id_fk = %d", user_id_fk, character_id_fk);

        try {

            PreparedStatement ps = db.getConnection(query);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<Character> getFavoriteCharacters(String query) {

        List<Character> characterList = new ArrayList<>();

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                characterList.add(new Character(rs.getInt("character_id_pk"), rs.getString("name"), rs.getString("biography")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return characterList;

    }
}
