package dao;

import model.DataBase;
import model.Videogame;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VideogameDAOImpl implements VideogameDAO {

    private DataBase db;

    public VideogameDAOImpl() {
        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");
    }

    @Override
    public List<Videogame> getAllVideogames() {

        List<Videogame> videogameList = new ArrayList<Videogame>();
        String query = "SELECT * FROM videogames";

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                videogameList.add(new Videogame(rs.getInt("videogame_id_pk"), rs.getString("name"), rs.getString("description")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return videogameList;

        /*ArrayList<User> userList = new ArrayList<User>();

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                userList.add(new User(rs.getInt("user_id_pk"), rs.getString("username"), rs.getString("password"), rs.getBoolean("admin")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;*/
    }

    @Override
    public void createVideogame(String name, String description) {

        try {

            String query = "INSERT INTO videogames (name, description) VALUES(?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setString(1, name);
            ps.setString(2, description);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deleteVideogame(int videogame_id_pk) {

        try {

            String query = "DELETE FROM videogames WHERE videogames.videogame_id_pk = ?";
            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, videogame_id_pk);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
