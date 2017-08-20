package dao;

import model.Relationship;

import java.util.List;

public interface RelationshipDAO {

    List<Relationship> getRelationshipsByID(int user_id_fk);

    void createRelationship(Relationship relationship);

    void deleteRelationshipByID(int relationship_id_pk);

    void deleteRelationshipsByUserID(int user_id_fk);

}
