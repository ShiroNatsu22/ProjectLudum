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

        int resultVideogame_id_pk = 0;

        try {

            ResultSet rs;
            String query = "INSERT INTO videogames (name, description) VALUES(?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setString(1, videogame.getName());
            ps.setString(2, videogame.getDescription());
            ps.execute();

            rs = ps.getGeneratedKeys();

            if (rs.next())
                resultVideogame_id_pk = rs.getInt(1);

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultVideogame_id_pk;

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

    private List<Videogame> getVideogames(String query) {

        List<Videogame> videogameList = new ArrayList<Videogame>();

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
    }
}