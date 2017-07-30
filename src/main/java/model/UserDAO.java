package model;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.DataBase;
import pojo.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements DAO {

    private static ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
    DataBase db = (DataBase) beans.getBean("dbc");

    public void create(Object obj) {
        User user = (User) obj;
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "INSERT INTO users values(?, ?, ?)";

        try {
            Class.forName(db.getDriver());

            conn = DriverManager.getConnection(
                    db.getUrl(),
                    db.getUser(),
                    db.getPassword()
            );

            ps = conn.prepareStatement(query);
            ps.setInt(1, user.getId());
            ps.setString(2, user.getUsername());
            ps.setString(3, user.getPassword());
            ps.executeUpdate();

            conn.close();


        } catch (Exception e) {

        }

    }

    public List<User> read() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> userList = new ArrayList<User>();
        String query = "SELECT * FROM users";

        try {
            Class.forName(db.getDriver());

            conn = DriverManager.getConnection(
                    db.getUrl(),
                    db.getUser(),
                    db.getPassword()
            );

            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                userList.add(new User(rs.getString("username")));
            }

            conn.close();


        } catch (Exception e) {
        }

        return userList;
    }
}
