package dao;

import model.DataBase;
import model.Relationship;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RelationshipDAOImpl implements RelationshipDAO {

    private DataBase db;

    public RelationshipDAOImpl() {

        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");

    }

    @Override
    public List<Relationship> getRelationshipsByID(int user_id_fk) {

        String query = String.format("SELECT * FROM gamerlistDB.relationships WHERE sender_user_id_fk = %1$d or receiver_user_id_fk = %1$d", user_id_fk);
        return getRelationships(query);

    }

    @Override
    public List<Relationship> getRelationshipsByIDAndStatus(int user_id_fk, String status) {

        String query = String.format("SELECT * FROM gamerlistDB.relationships WHERE (sender_user_id_fk = %1$d or receiver_user_id_fk = %1$d) AND status = '%2$s'", user_id_fk, status);
        return getRelationships(query);

    }

    @Override
    public Relationship getRelationshipByUserIDandUserID(int user_id_fk1, int user_id_fk2) {

        String query = String.format("SELECT * FROM relationships WHERE (sender_user_id_fk = %1$d OR receiver_user_id_fk = %1$d) AND (sender_user_id_fk = %2$d OR receiver_user_id_fk = %2$d)", user_id_fk1, user_id_fk2);
        List<Relationship> relationshipList = getRelationships(query);

        if (!(relationshipList.isEmpty()))
            return relationshipList.get(0);

        return new Relationship();

    }

    @Override
    public void createRelationship(Relationship relationship) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = "INSERT INTO relationships (sender_user_id_fk, receiver_user_id_fk, status) VALUES(?,?,?)";

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setInt(1, relationship.getSender_user_id_fk());
            ps.setInt(2, relationship.getReceiver_user_id_fk());
            ps.setString(3, relationship.getStatus());
            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }

    @Override
    public void deleteRelationshipByID(int relationship_id_pk) {

        String query = String.format("DELETE FROM relationships WHERE relationship_id_pk = %d", relationship_id_pk);
        deleteRelationship(query);

    }

    @Override
    public void deleteRelationshipsByUserID(int user_id_fk) {

        String query = String.format("DELETE FROM relationship WHERE sender_user_id_fk = %1$d OR receiver_user_id_fk = %1$d", user_id_fk);
        deleteRelationship(query);

    }

    private List<Relationship> getRelationships(String query) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<Relationship> relationshipList = new ArrayList<Relationship>();

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                relationshipList.add(new Relationship(rs.getInt("relationship_id_pk"), rs.getInt("sender_user_id_fk"), rs.getInt("receiver_user_id_fk"), rs.getString("status")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, rs);
        }

        return relationshipList;
    }

    private void deleteRelationship(String query) {

        Connection connection = null;
        PreparedStatement ps = null;

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }


}
