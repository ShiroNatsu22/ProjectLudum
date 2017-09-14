package dao;

import model.Company;
import model.DataBase;
import model.Developer;
import model.Videogame;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
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

        String query = String.format("SELECT * FROM developers, videogames, companies WHERE developers.videogame_id_fk = videogames.videogame_id_pk AND developers.company_id_fk = companies.company_id_pk AND developers.videogame_id_fk = %d", videogame_id_fk);
        return getDevelopersById_fk(query);

    }

    @Override
    public List<Developer> getDevelopersByCompany_id_fk(int company_id_fk) {

        String query = String.format("SELECT * FROM developers, videogames, companies WHERE developers.videogame_id_fk = videogames.videogame_id_pk AND developers.company_id_fk = companies.company_id_pk AND developers.company_id_fk = %d", company_id_fk);
        return getDevelopersById_fk(query);

    }

    @Override
    public void createDeveloper(int company_id_fk, int videogame_id_fk) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = "INSERT INTO developers (company_id_fk, videogame_id_fk) VALUES(?,?)";

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setInt(1, company_id_fk);
            ps.setInt(2, videogame_id_fk);
            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }

    private List<Developer> getDevelopersById_fk(String query) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Developer> developerList = new ArrayList<>();

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Company company = new Company(rs.getInt("companies.company_id_pk"), rs.getString("companies.name"), rs.getDate("companies.founded"));
                Videogame videogame = new Videogame(rs.getInt("videogames.videogame_id_pk"), rs.getString("videogames.name"), rs.getString("videogames.description"), rs.getString("videogames.image"));

                developerList.add(new Developer(rs.getInt("developers.developer_id_pk"), company, videogame));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, rs);
        }

        return developerList;

    }

}
