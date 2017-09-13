package dao;

import com.sun.org.apache.regexp.internal.RE;
import model.DataBase;
import model.PrivateMessage;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PrivateMessageDAOImpl implements PrivateMessageDAO {

    private DataBase db;

    public PrivateMessageDAOImpl() {

        ApplicationContext beans = new ClassPathXmlApplicationContext("spring-conf.xml");
        this.db = (DataBase) beans.getBean("dbc");

    }

    @Override
    public List<PrivateMessage> getAllPrivateMessagesByOwner_user_id_fk(int owner_user_id_fk) {

        String query = String.format("SELECT * FROM privateMessages WHERE owner_user_id_fk = %d", owner_user_id_fk);
        return getPrivateMessages(query);

    }

    @Override
    public PrivateMessage getPrivateMessageByID(int privateMessage_id_pk) {

        String query = String.format("SELECT * FROM privateMessages WHERE privateMessage_id_pk = %d", privateMessage_id_pk);
        List<PrivateMessage> privateMessageList = getPrivateMessages(query);

        if (!(privateMessageList.isEmpty()))
            return privateMessageList.get(0);

        return new PrivateMessage();
    }

    @Override
    public void createPrivateMessage(PrivateMessage privateMessage) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = "INSERT INTO privateMessages (owner_user_id_fk, senderUsername, receiverUsername, subject, content, sended, readed) VALUES(?,?,?,?,?,?,?)";

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setInt(1, privateMessage.getOwner_user_id_fk());
            ps.setString(2, privateMessage.getSenderUsername());
            ps.setString(3, privateMessage.getReceiverUsername());
            ps.setString(4, privateMessage.getSubject());
            ps.setString(5, privateMessage.getContent());
            ps.setTimestamp(6, new Timestamp((new Date()).getTime()));
            ps.setBoolean(7, privateMessage.isReaded());

            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }

    @Override
    public void updatePrivateMessageReaded(int privateMessage_id_pk, boolean readed) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = "UPDATE privateMessages SET readed = ? WHERE privateMessage_id_pk = ?";

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);

            ps.setBoolean(1, !readed);
            ps.setInt(2, privateMessage_id_pk);
            ps.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

    }

    @Override
    public void deletePrivateMessage(int privateMessage_id_pk) {

        Connection connection = null;
        PreparedStatement ps = null;

        String query = String.format("DELETE FROM privateMessages WHERE privateMessage_id_pk = %d", privateMessage_id_pk);

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

    private List<PrivateMessage> getPrivateMessages(String query) {

        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<PrivateMessage> privateMessageList = new ArrayList<PrivateMessage>();

        try {

            connection = db.getConnection();
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                privateMessageList.add(new PrivateMessage(rs.getInt("privateMessage_id_pk"), rs.getInt("owner_user_id_fk"), rs.getString("senderUsername"), rs.getString("receiverUsername"), rs.getString("subject"), rs.getString("content"), rs.getTimestamp("sended"), rs.getBoolean("readed")));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(connection, ps, null);
        }

        return privateMessageList;

    }

}
