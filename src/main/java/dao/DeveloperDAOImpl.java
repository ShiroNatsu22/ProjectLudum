package dao;

import model.DataBase;
import model.Developer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DeveloperDAOImpl implements DeveloperDAO {

    private DataBase db;

    public DeveloperDAOImpl() {

        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");

    }

    @Override
    public List<Developer> getDevelopersByVideogame_id_fk(int videogame_id_fk) {

        List<Developer> developerList = new ArrayList<Developer>();

        try {

            String query = "SELECT * FROM developers WHERE developers.videogame_id_fk = " + String.valueOf(videogame_id_fk);
            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                developerList.add(new Developer(rs.getInt("developer_id_pk"), rs.getInt("company_id_fk"), rs.getInt("videogame_id_fk")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return developerList;

    }

    @Override
    public void createDeveloper(int company_id_fk, int videogame_id_fk) {

        try {

            String query = "INSERT INTO developers (company_id_fk, videogame_id_fk) VALUES(?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, company_id_fk);
            ps.setInt(2, videogame_id_fk);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}