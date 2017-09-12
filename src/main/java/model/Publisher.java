package model;

public class Publisher {

    private int publisher_id_pk;
    private Videogame videogame_id_fk;
    private Company company_id_fk;

    public Publisher() {
    }

    public Publisher(int publisher_id_pk, Videogame videogame_id_fk, Company company_id_fk) {
        this.publisher_id_pk = publisher_id_pk;
        this.videogame_id_fk = videogame_id_fk;
        this.company_id_fk = company_id_fk;
    }

    public int getPublisher_id_pk() {
        return publisher_id_pk;
    }

    public void setPublisher_id_pk(int publisher_id_pk) {
        this.publisher_id_pk = publisher_id_pk;
    }

    public Videogame getVideogame_id_fk() {
        return videogame_id_fk;
    }

    public void setVideogame_id_fk(Videogame videogame_id_fk) {
        this.videogame_id_fk = videogame_id_fk;
    }

    public Company getCompany_id_fk() {
        return company_id_fk;
    }

    public void setCompany_id_fk(Company company_id_fk) {
        this.company_id_fk = company_id_fk;
    }
}
