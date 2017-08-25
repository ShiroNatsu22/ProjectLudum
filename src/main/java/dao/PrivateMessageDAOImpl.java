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

        List<PrivateMessage> privateMessageList = new ArrayList<PrivateMessage>();
        String query = String.format("SELECT * FROM privateMessages WHERE owner_user_id_fk = %d", owner_user_id_fk);

        try {

            PreparedStatement ps = db.getConnection(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                privateMessageList.add(new PrivateMessage(rs.getInt("privateMessage_id_pk"), rs.getInt("owner_user_id_fk"), rs.getInt("sender_user_id_fk"), rs.getInt("receiver_user_id_fk"), rs.getString("subject"), rs.getString("content"), rs.getTimestamp("sended"), rs.getBoolean("readed")));
            }

            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return privateMessageList;

    }

    @Override
    public void createPrivateMessage(PrivateMessage privateMessage) {

        try {

            String query = "INSERT INTO privateMessages (owner_user_id_fk, sender_user_id_fk, receiver_user_id_fk, subject, content, sended, readed) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps = db.getConnection(query);

            ps.setInt(1, privateMessage.getOwner_user_id_fk());
            ps.setInt(2, privateMessage.getSender_user_id_fk());
            ps.setInt(3, privateMessage.getReceiver_user_id_fk());
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

}
