package model;

public class Developer {

    private int developer_id_pk;
    private int company_id_fk;
    private int videogame_id_fk;

    public Developer() {
    }

    public Developer(int developer_id_pk, int company_id_fk, int videogame_id_fk) {
        this.developer_id_pk = developer_id_pk;
        this.company_id_fk = company_id_fk;
        this.videogame_id_fk = videogame_id_fk;
    }

    public int getDeveloper_id_pk() {
        return developer_id_pk;
    }

    public void setDeveloper_id_pk(int developer_id_pk) {
        this.developer_id_pk = developer_id_pk;
    }

    public int getCompany_id_fk() {
        return company_id_fk;
    }

    public void setCompany_id_fk(int company_id_fk) {
        this.company_id_fk = company_id_fk;
    }

    public int getVideogame_id_fk() {
        return videogame_id_fk;
    }

    public void setVideogame_id_fk(int videogame_id_fk) {
        this.videogame_id_fk = videogame_id_fk;
    }
}
