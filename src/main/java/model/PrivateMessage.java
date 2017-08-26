package model;

import java.util.Date;

public class PrivateMessage {

    private int privateMessage_id_pk;
    private int owner_user_id_fk;
    private String senderUsername;
    private String receiverUsername;
    private String subject;
    private String content;
    private Date sended;
    private boolean readed;

    public PrivateMessage() {

    }

    public PrivateMessage(int privateMessage_id_pk, int owner_user_id_fk, String senderUsername, String receiverUsername, String subject, String content, Date sended, boolean readed) {
        this.privateMessage_id_pk = privateMessage_id_pk;
        this.owner_user_id_fk = owner_user_id_fk;
        this.senderUsername = senderUsername;
        this.receiverUsername = receiverUsername;
        this.subject = subject;
        this.content = content;
        this.sended = sended;
        this.readed = readed;
    }

    public int getPrivateMessage_id_pk() {
        return privateMessage_id_pk;
    }

    public void setPrivateMessage_id_pk(int privateMessage_id_pk) {
        this.privateMessage_id_pk = privateMessage_id_pk;
    }

    public int getOwner_user_id_fk() {
        return owner_user_id_fk;
    }

    public void setOwner_user_id_fk(int owner_user_id_fk) {
        this.owner_user_id_fk = owner_user_id_fk;
    }

    public String getSenderUsername() {
        return senderUsername;
    }

    public void setSenderUsername(String senderUsername) {
        this.senderUsername = senderUsername;
    }

    public String getReceiverUsername() {
        return receiverUsername;
    }

    public void setReceiverUsername(String receiverUsername) {
        this.receiverUsername = receiverUsername;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSended() {
        return sended;
    }

    public void setSended(Date sended) {
        this.sended = sended;
    }

    public boolean isReaded() {
        return readed;
    }

    public void setReaded(boolean readed) {
        this.readed = readed;
    }
}
