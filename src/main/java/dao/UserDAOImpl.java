package dao;

import model.Company;
import model.DataBase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    private DataBase db;

    public UserDAOImpl() {
        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");
    }

    @Override
    public List<User> getAllUsers() {

        String query = "SELECT * FROM users";
        return getUsers(query);
    }

    @Override
    public User getUserByUserID(int user_id_pk) {

        String query = String.format("SELECT * FROM users WHERE users.user_id_pk = %d", user_id_pk);
        List<User> userList = getUsers(query);

        if (!(userList.isEmpty()))
            return userList.get(0);

        return new User();
    }

    @Override
    public User getUserByUsername(String username) {

        String query = String.format("SELECT * FROM users WHERE users.username = '%s'", username);
        List<User> userList = getUsers(query);

        if (!(userList.isEmpty()))
            return userList.get(0);

        return new User();

    }

    @Override
    public void createUser(User user) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = "INSERT INTO users (username, password, admin, name, surname, gender, country, email, birthday, biography, registration) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setBoolean(3, user.isAdmin());
            ps.setString(4, user.getName());
            ps.setString(5, user.getSurname());
            ps.setString(6, user.getGender());
            ps.setString(7, user.getCountry());
            ps.setString(8, user.getEmail());
            if (user.getBirthday() != null) ps.setDate(9, new Date(user.getBirthday().getTime()));
            else ps.setNull(9, Types.DATE);
            ps.setString(10, user.getBiography());
            ps.setDate(11, new Date(user.getRegistration().getTime()));

            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }
    }

    @Override
    public void deleteUser(int user_id_pk) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = String.format("DELETE FROM users WHERE users.user_id_pk = %d", user_id_pk);

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

    private List<User> getUsers(String query) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<User> userList = new ArrayList<>();

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                userList.add(new User(rs.getInt("user_id_pk"), rs.getString("username"), rs.getString("password"), rs.getBoolean("admin"), rs.getString("name"), rs.getString("surname"), rs.getString("gender"), rs.getString("country"), rs.getString("email"), rs.getDate("birthday"), rs.getString("biography"), rs.getDate("registration")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

        return userList;
    }

}
