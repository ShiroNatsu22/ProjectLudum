package dao;

import model.Relationship;

import java.util.List;

public interface RelationshipDAO {

    List<Relationship> getRelationshipsByID(int user_id_fk);

    List<Relationship> getRelationshipsByIDAndStatus(int user_id_fk, String status);

    Relationship getRelationshipByUserIDandUserID(int user_id_fk1, int user_id_fk2);

    void createRelationship(Relationship relationship);

    void deleteRelationshipByID(int relationship_id_pk);

    void deleteRelationshipsByUserID(int user_id_fk);

}
