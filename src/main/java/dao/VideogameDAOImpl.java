package dao;

import model.DataBase;
import model.Videogame;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
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

        String query = "SELECT * FROM videogames";
        return getVideogames(query);

    }

    @Override
    public Videogame getVideogameByID(int videogame_id_pk) {
        String query = "SELECT * FROM videogames WHERE videogames.videogame_id_pk = " + String.valueOf(videogame_id_pk);
        List<Videogame> videogameList = getVideogames(query);

        if (!(videogameList.isEmpty()))
            return videogameList.get(0);

        return new Videogame();
    }

    @Override
    public int createVideogame(Videogame videogame) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "INSERT INTO videogames (name, description, image) VALUES(?,?,?)";
        int resultVideogame_id_pk = -1;

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setString(1, videogame.getName());
            ps.setString(2, videogame.getDescription());
            ps.setString(3, videogame.getImage());
            ps.execute();

            rs = ps.getGeneratedKeys();

            if (rs.next())
                resultVideogame_id_pk = rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, rs);
        }

        return resultVideogame_id_pk;

    }

    @Override
    public void deleteVideogame(int videogame_id_pk) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = String.format("DELETE FROM videogames WHERE videogames.videogame_id_pk = %d", videogame_id_pk);

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

    private List<Videogame> getVideogames(String query) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Videogame> videogameList = new ArrayList<Videogame>();

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next())
                videogameList.add(new Videogame(rs.getInt("videogame_id_pk"), rs.getString("name"), rs.getString("description"), rs.getString("image")));

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, rs);
        }

        return videogameList;
    }
}
