package dao;

import model.DataBase;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    public User getUserByUsername(String username) {

        String query = "SELECT * FROM users WHERE users.username = '" + username + "'";
        List<User> userList = getUsers(query);

        if (!(userList.isEmpty()))
            return userList.get(0);

        return new User();

    }

    @Override
    public void createUser(String username, String password, boolean admin) {
        PreparedStatement ps;
        String query = "INSERT INTO users (username, password, admin) VALUES(?,?,?)";

        try {

            ps = db.getConnection(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setBoolean(3, admin);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private List<User> getUsers(String query) {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<User> userList = new ArrayList<User>();

        try {

            ps = db.getConnection(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                userList.add(new User(rs.getInt("user_id_pk"), rs.getString("username"), rs.getString("password"), rs.getBoolean("admin")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }

}
