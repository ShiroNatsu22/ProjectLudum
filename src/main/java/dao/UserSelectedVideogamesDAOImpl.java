package dao;

import model.DataBase;
import model.UserSelectedVideogames;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserSelectedVideogamesDAOImpl implements UserSelectedVideogamesDAO {

    private DataBase db;

    public UserSelectedVideogamesDAOImpl() {

        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");

    }

    @Override
    public List<UserSelectedVideogames> getAllUserSelectedVideogamesByUser_id_fk(int user_id_fk) {

        String query = String.format("SELECT * FROM userSelectedVideogames WHERE user_id_fk = %d", user_id_fk);
        return getUserSelectedVideogames(query);

    }

    @Override
    public UserSelectedVideogames getUserSelectedVideogameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk) {

        String query = String.format("SELECT * FROM userSelectedVideogames WHERE user_id_fk = %d AND videogame_id_fk = %d", user_id_fk, videogame_id_fk);
        List<UserSelectedVideogames> userSelectedVideogamesList = getUserSelectedVideogames(query);

        if (!(userSelectedVideogamesList.isEmpty()))
            return userSelectedVideogamesList.get(0);

        return new UserSelectedVideogames();

    }

    @Override
    public void createUserSelectedVideogame(UserSelectedVideogames userSelectedVideogames) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = "INSERT INTO userSelectedVideogames (user_id_fk, videogame_id_fk, status, rating) VALUES(?,?,?,?)";

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setInt(1, userSelectedVideogames.getUser_id_fk().getUser_id_pk());
            ps.setInt(2, userSelectedVideogames.getVideogame_id_fk().getVideogame_id_pk());
            ps.setString(3, userSelectedVideogames.getStatus());
            ps.setInt(4, userSelectedVideogames.getRating());
            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }

    @Override
    public void deleteUserSelectedVideogame(int userSelectedVideogame_id_pk) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = String.format("DELETE FROM userSelectedVideogames WHERE userSelectedVideogame_id_pk = %d", userSelectedVideogame_id_pk);

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

    private List<UserSelectedVideogames> getUserSelectedVideogames(String query) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<UserSelectedVideogames> userSelectedVideogamesList = new ArrayList<UserSelectedVideogames>();

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                userSelectedVideogamesList.add(new UserSelectedVideogames(rs.getInt("userSelectedVideogame_id_pk"), rs.getInt("user_id_fk"), rs.getInt("videogame_id_fk"), rs.getString("status"), rs.getInt("rating")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

        return userSelectedVideogamesList;

    }

}
