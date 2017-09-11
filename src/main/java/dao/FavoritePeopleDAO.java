package dao;

import model.People;

import java.util.List;

public interface FavoritePeopleDAO {

    List<People> getAllFavoritePeopleByUser_id_fk(int user_id_fk);

    int getFavoritePeopleCountByPeople_id_fk(int people_id_fk);

    People getFavoritePeopleByUser_id_fkAndPeople_id_fk(int user_id_fk, int people);

    void createFavoritePeople(int user_id_fk, int people_id_fk);

    void deleteFavoritePeopleByUser_id_fkAndPeople_id_fk(int user_id_fk, int people_id_fk);

}
