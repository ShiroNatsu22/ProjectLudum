package dao;

import model.DataBase;
import model.Videogame;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FavoriteGamesDAOImpl implements FavoriteGamesDAO {

    private DataBase db;

    public FavoriteGamesDAOImpl() {

        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");

    }

    @Override
    public List<Videogame> getAllFavoriteGamesByUser_id_fk(int user_id_fk) {

        String query = String.format("SELECT videogames.* FROM favoriteGames, videogames WHERE favoriteGames.videogame_id_fk = videogames.videogame_id_pk AND favoriteGames.user_id_fk = %d ORDER BY videogame_id_pk", user_id_fk);
        return getFavoriteVideogames(query);

    }

    @Override
    public int getFavoriteVideogamesCountByVideogame_id_fk(int videogame_id_fk) {

        String query = String.format("SELECT COUNT(*) AS count FROM favoriteGames WHERE videogame_id_fk = %d", videogame_id_fk);
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
    public Videogame getFavoriteVideogameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk) {

        String query = String.format("SELECT videogames.* FROM videogames, favoriteGames WHERE favoriteGames.videogame_id_fk = videogames.videogame_id_pk AND favoriteGames.user_id_fk = %d AND favoriteGames.videogame_id_fk = %d ORDER BY videogame_id_pk", user_id_fk, videogame_id_fk);
        List<Videogame> videogameList = getFavoriteVideogames(query);

        if (!(videogameList.isEmpty()))
            return videogameList.get(0);

        return new Videogame();

    }

    @Override
    public void createFavoriteVideogame(int user_id_fk, int videogame_id_fk) {

        String query = "INSERT INTO favoriteGames (user_id_fk, videogame_id_fk) VALUES(?,?)";

        try {


            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, user_id_fk);
            ps.setInt(2, videogame_id_fk);

            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deleteFavoriteVideogameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk) {

        String query = String.format("DELETE FROM favoriteGames WHERE user_id_fk = %d AND videogame_id_fk = %d", user_id_fk, videogame_id_fk);

        try {

            PreparedStatement ps = db.getConnection(query);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<Videogame> getFavoriteVideogames(String query) {

        List<Videogame> videogameList = new ArrayList<>();

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
