package dao;

import model.Videogame;

import java.util.List;

public interface VideogameDAO {

    List<Videogame> getAllVideogames();

    Videogame getVideogameByID(int videogame_id_pk);

    int createVideogame(Videogame videogame);

    void deleteVideogame(int videogame_id_pk);

}
