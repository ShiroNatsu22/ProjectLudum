package dao;

import model.DataBase;
import model.People;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class PeopleDAOImpl implements PeopleDAO {

    private DataBase db;

    public PeopleDAOImpl() {
        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");
    }

    @Override
    public List<People> getAllPeople() {

        String query = "SELECT * FROM people";
        return getPeople(query);

    }

    @Override
    public People getPeopleByID(int people_id_pk) {

        String query = String.format("SELECT * FROM people WHERE people.people_id_pk = %d", people_id_pk);
        List<People> peopleList = getPeople(query);

        if (!(peopleList.isEmpty()))
            return peopleList.get(0);

        return new People();

    }

    @Override
    public void createPeople(People people) {

        try {

            String query = "INSERT INTO people (name, surname, birthday, nationality, biography) VALUES(?,?,?,?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setString(1, people.getName());
            ps.setString(2, people.getSurname());
            if (people.getBirthday() != null) ps.setDate(3, new Date(people.getBirthday().getTime()));
            else ps.setNull(3, Types.DATE);
            ps.setString(4, people.getNationality());
            ps.setString(5, people.getBiography());
            ps.execute();

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deletePeople(int people_id_pk) {

        try {

            String query = String.format("DELETE FROM people WHERE people.people_id_pk = %d", people_id_pk);

            PreparedStatement ps = db.getConnection(query);

            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<People> getPeople(String query) {

        List<People> peopleList = new ArrayList<>();

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next())
                peopleList.add(new People(rs.getInt("people_id_pk"), rs.getString("name"), rs.getString("surname"), rs.getDate("birthday"), rs.getString("nationality"), rs.getString("biography")));

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return peopleList;

    }
}
