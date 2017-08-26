package dao;

import model.PrivateMessage;

import java.util.List;

public interface PrivateMessageDAO {

    List<PrivateMessage> getAllPrivateMessagesByOwner_user_id_fk(int owner_user_id_fk);

    PrivateMessage getPrivateMessageByID(int privateMessage_id_pk);

    void createPrivateMessage(PrivateMessage privateMessage);

    void updatePrivateMessageReaded(int privateMessage_id_pk, boolean readed);

    void deletePrivateMessage(int privateMessage_id_pk);

}
