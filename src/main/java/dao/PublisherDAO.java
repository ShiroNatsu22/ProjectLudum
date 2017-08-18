package dao;

import model.Publisher;

import java.util.List;

public interface PublisherDAO {

    List<Publisher> getPublishersByVideogame_id_fk(int videogame_id_fk);

    List<Publisher> getPublishersByCompany_id_fk(int company_id_fk);

    void createPublisher(int company_id_fk, int videogame_id_fk);

}
