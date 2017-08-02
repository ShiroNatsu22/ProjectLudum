package model;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import pojo.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements DAO {

    private DataBase db;

    public UserDAO() {
        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");
    }

    public void create(Object obj) {
    }

    public List<User> read() {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<User> userList = new ArrayList<User>();
        String query = "SELECT * FROM users";

        try {

            ps = db.getConnection(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                userList.add(new User(rs.getInt("user_id_pk"), rs.getString("username"), rs.getString("password")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
}
