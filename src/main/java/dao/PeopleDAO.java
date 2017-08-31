package dao;

import model.People;

import java.util.List;

public interface PeopleDAO {

    List<People> getAllPeople();

    People getPeopleByID(int People_id_pk);

    int createPeople(People People);

    void deletePeople(int People_id_pk);

}
