package model;

import java.util.Date;

public class PrivateMessage {

    private int privateMessage_id_pk;
    private int owner_user_id_fk;
    private int sender_user_id_fk;
    private int receiver_user_id_fk;
    private String subject;
    private String content;
    private Date sended;
    private boolean readed;

    public PrivateMessage() {

    }

    public PrivateMessage(int privateMessage_id_pk, int owner_user_id_fk, int sender_user_id_fk, int receiver_user_id_fk, String subject, String content, Date sended, boolean readed) {
        this.privateMessage_id_pk = privateMessage_id_pk;
        this.owner_user_id_fk = owner_user_id_fk;
        this.sender_user_id_fk = sender_user_id_fk;
        this.receiver_user_id_fk = receiver_user_id_fk;
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

    public int getSender_user_id_fk() {
        return sender_user_id_fk;
    }

    public void setSender_user_id_fk(int sender_user_id_fk) {
        this.sender_user_id_fk = sender_user_id_fk;
    }

    public int getReceiver_user_id_fk() {
        return receiver_user_id_fk;
    }

    public void setReceiver_user_id_fk(int receiver_user_id_fk) {
        this.receiver_user_id_fk = receiver_user_id_fk;
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
