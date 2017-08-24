package dao;

import model.PrivateMessage;

import java.util.List;

public interface PrivateMessageDAO {

    List<PrivateMessage> getAllPrivateMessagesByOwner_user_id_fk(int owner_user_id_fk);

    void createPrivateMessage(PrivateMessage privateMessage);

    void deletePrivateMessage(int privateMessage_id_pk);

}
