package dao;

import model.DataBase;
import model.People;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavoritePeopleDAOImpl implements FavoritePeopleDAO {

    private DataBase db;

    public FavoritePeopleDAOImpl() {

        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");

    }

    @Override
    public List<People> getAllFavoritePeopleByUser_id_fk(int user_id_fk) {

        String query = String.format("SELECT people.* FROM favoritePeople, people WHERE favoritePeople.people_id_fk = people.people_id_pk AND favoritePeople.user_id_fk = %d ORDER BY people_id_pk", user_id_fk);
        return getFavoritePeople(query);

    }

    @Override
    public int getFavoritePeopleCountByPeople_id_fk(int people_id_fk) {

        String query = String.format("SELECT COUNT(*) AS count FROM favoritePeople WHERE people_id_fk = %d", people_id_fk);
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
    public People getFavoritePeopleByUser_id_fkAndPeople_id_fk(int user_id_fk, int people_id_fk) {

        String query = String.format("SELECT people.* FROM people, favoritePeople WHERE favoritePeople.people_id_fk = people.people_id_pk AND favoritePeople.user_id_fk = %d AND favoritePeople.people_id_fk = %d ORDER BY people_id_pk", user_id_fk, people_id_fk);
        List<People> characterList = getFavoritePeople(query);

        if (!(characterList.isEmpty()))
            return characterList.get(0);

        return new People();

    }

    @Override
    public void createFavoritePeople(int user_id_fk, int people_id_fk) {

        String query = "INSERT INTO favoritePeople (user_id_fk, people_id_fk) VALUES(?,?)";

        try {

            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, user_id_fk);
            ps.setInt(2, people_id_fk);

            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deleteFavoritePeopleByUser_id_fkAndPeople_id_fk(int user_id_fk, int people_id_fk) {

        String query = String.format("DELETE FROM favoritePeople WHERE user_id_fk = %d AND people_id_fk = %d", user_id_fk, people_id_fk);

        try {

            PreparedStatement ps = db.getConnection(query);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<People> getFavoritePeople(String query) {

        List<People> peopleList = new ArrayList<>();

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                peopleList.add(new People(rs.getInt("people_id_pk"), rs.getString("name"), rs.getString("surname"), rs.getDate("birthday"), rs.getString("nationality"), rs.getString("biography")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return peopleList;

    }
}
