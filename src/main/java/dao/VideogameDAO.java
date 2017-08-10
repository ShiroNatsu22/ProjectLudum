package dao;

import model.Videogame;

import java.util.List;

public interface VideogameDAO {

    List<Videogame> getAllVideogames();

    void createVideogame(String name, String description);

    void deleteVideogame(int videogame_id_pk);

}
