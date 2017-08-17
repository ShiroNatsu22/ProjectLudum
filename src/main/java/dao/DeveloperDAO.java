package dao;

import model.Developer;

import java.util.List;

public interface DeveloperDAO {

    List<Developer> getDevelopersByVideogame_id_fk(int videogame_id_fk);

    List<Developer> getDevelopersByCompany_id_fk(int company_id_fk);

    void createDeveloper(int company_id_fk, int videogame_id_fk);

}
