package dao;

import model.DataBase;
import model.FavoriteGames;
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
    public List<FavoriteGames> getAllFavoriteGamesByUser_id_fk(int user_id_fk) {

        String query = String.format("SELECT * FROM favoriteGames WHERE user_id_fk = %d", user_id_fk);
        return getFavoriteGames(query);

    }

    @Override
    public List<FavoriteGames> getAllFavoriteGamesByVideogame_id_fk(int videogame_id_fk) {

        String query = String.format("SELECT * FROM favoriteGames WHERE videogame_id_fk = %d", videogame_id_fk);
        return getFavoriteGames(query);

    }

    @Override
    public FavoriteGames getFavoriteGameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk) {

        String query = String.format("SELECT * FROM favoriteGames WHERE user_id_fk = %d AND videogame_id_fk = %d", user_id_fk, videogame_id_fk);
        List<FavoriteGames> favoriteGamesList = getFavoriteGames(query);

        if (!(favoriteGamesList.isEmpty()))
            return favoriteGamesList.get(0);

        return new FavoriteGames();

    }

    @Override
    public void createFavoriteGame(FavoriteGames favoriteGames) {

        try {

            String query = "INSERT INTO favoriteGames (user_id_fk, videogame_id_fk) VALUES(?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, favoriteGames.getUser_id_fk().getUser_id_pk());
            ps.setInt(2, favoriteGames.getVideogame_id_fk().getVideogame_id_pk());

            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deleteFavoriteGameByUser_id_fkAndVideogame_id_fk(int user_id_fk, int videogame_id_fk) {

        try {

            String query = String.format("DELETE FROM favoriteGames WHERE user_id_fk = %d AND videogame_id_fk = %d", user_id_fk, videogame_id_fk);
            PreparedStatement ps = db.getConnection(query);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<FavoriteGames> getFavoriteGames(String query) {

        List<FavoriteGames> favoriteGamesList = new ArrayList<>();

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                favoriteGamesList.add(new FavoriteGames(rs.getInt("favoriteGame_id_pk"), rs.getInt("user_id_fk"), rs.getInt("videogame_id_fk")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return favoriteGamesList;

    }
}
