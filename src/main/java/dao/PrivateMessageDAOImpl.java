package dao;

import model.DataBase;
import model.PrivateMessage;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

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

        try {

            String query = "INSERT INTO privateMessages (owner_user_id_fk, senderUsername, receiverUsername, subject, content, sended, readed) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, privateMessage.getOwner_user_id_fk());
            ps.setString(2, privateMessage.getSenderUsername());
            ps.setString(3, privateMessage.getReceiverUsername());
            ps.setString(4, privateMessage.getSubject());
            ps.setString(5, privateMessage.getContent());
            ps.setTimestamp(6, new Timestamp((new Date()).getTime()));
            ps.setBoolean(7, privateMessage.isReaded());

            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void updatePrivateMessageReaded(int privateMessage_id_pk, boolean readed) {

        try {

            String query = "UPDATE privateMessages SET readed = ? WHERE privateMessage_id_pk = ?";

            PreparedStatement ps = db.getConnection(query);
            ps.setBoolean(1, !readed);
            ps.setInt(2, privateMessage_id_pk);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void deletePrivateMessage(int privateMessage_id_pk) {

        try {

            String query = String.format("DELETE FROM privateMessages WHERE privateMessage_id_pk = %d", privateMessage_id_pk);
            PreparedStatement ps = db.getConnection(query);
            ps.execute();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private List<PrivateMessage> getPrivateMessages(String query) {

        List<PrivateMessage> privateMessageList = new ArrayList<PrivateMessage>();

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                privateMessageList.add(new PrivateMessage(rs.getInt("privateMessage_id_pk"), rs.getInt("owner_user_id_fk"), rs.getString("senderUsername"), rs.getString("receiverUsername"), rs.getString("subject"), rs.getString("content"), rs.getTimestamp("sended"), rs.getBoolean("readed")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return privateMessageList;

    }

}
