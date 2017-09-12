package dao;

import model.Company;
import model.DataBase;
import model.Publisher;
import model.Videogame;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PublisherDAOImpl implements PublisherDAO {

    private DataBase db;

    public PublisherDAOImpl() {

        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");

    }

    @Override
    public List<Publisher> getPublishersByVideogame_id_fk(int videogame_id_fk) {

        String query = String.format("SELECT * FROM publishers, videogames, companies WHERE publishers.videogame_id_fk = videogames.videogame_id_pk AND publishers.company_id_fk = companies.company_id_pk AND publishers.videogame_id_fk = %d", videogame_id_fk);
        return getPublishersById_fk(query);

    }

    @Override
    public List<Publisher> getPublishersByCompany_id_fk(int company_id_fk) {

        String query = String.format("SELECT * FROM publishers, videogames, companies WHERE publishers.videogame_id_fk = videogames.videogame_id_pk AND publishers.company_id_fk = companies.company_id_pk AND publishers.company_id_fk = %d", company_id_fk);
        return getPublishersById_fk(query);

    }

    @Override
    public void createPublisher(int company_id_fk, int videogame_id_fk) {

        try {

            String query = "INSERT INTO publishers (company_id_fk, videogame_id_fk) VALUES(?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, company_id_fk);
            ps.setInt(2, videogame_id_fk);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<Publisher> getPublishersById_fk(String query) {

        List<Publisher> publisherList = new ArrayList<Publisher>();

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Videogame videogame = new Videogame(rs.getInt("videogames.videogame_id_pk"), rs.getString("videogames.name"), rs.getString("videogames.description"));
                Company company = new Company(rs.getInt("companies.company_id_pk"), rs.getString("companies.name"), rs.getDate("companies.founded"));

                publisherList.add(new Publisher(rs.getInt("publisher_id_pk"), videogame, company));

            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return publisherList;

    }

}
