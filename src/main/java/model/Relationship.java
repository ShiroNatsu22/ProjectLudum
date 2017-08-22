package model;

public class Relationship {

    private int relationship_id_pk;
    private int sender_user_id_fk;
    private int receiver_user_id_fk;
    private String status;

    public Relationship() {

    }

    public Relationship(int relationship_id_pk, int sender_user_id_fk, int receiver_user_id_fk, String status) {
        this.relationship_id_pk = relationship_id_pk;
        this.sender_user_id_fk = sender_user_id_fk;
        this.receiver_user_id_fk = receiver_user_id_fk;
        this.status = status;
    }

    public int getRelationship_id_pk() {
        return relationship_id_pk;
    }

    public void setRelationship_id_pk(int relationship_id_pk) {
        this.relationship_id_pk = relationship_id_pk;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
