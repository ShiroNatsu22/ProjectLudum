package model;

public class Developer {

    private int developer_id_pk;
    private Company company_id_fk;
    private Videogame videogame_id_fk;

    public Developer() {
    }

    public Developer(int developer_id_pk, Company company_id_fk, Videogame videogame_id_fk) {
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

    public Company getCompany_id_fk() {
        return company_id_fk;
    }

    public void setCompany_id_fk(Company company_id_fk) {
        this.company_id_fk = company_id_fk;
    }

    public Videogame getVideogame_id_fk() {
        return videogame_id_fk;
    }

    public void setVideogame_id_fk(Videogame videogame_id_fk) {
        this.videogame_id_fk = videogame_id_fk;
    }
}
