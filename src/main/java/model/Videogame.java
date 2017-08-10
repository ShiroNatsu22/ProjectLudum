package model;

public class Videogame {

    private int videogame_id_pk;
    private String name;
    private String description;

    public Videogame() {

    }

    public Videogame(int videogame_id_pk, String name, String description) {
        this.videogame_id_pk = videogame_id_pk;
        this.name = name;
        this.description = description;
    }

    public int getVideogame_id_pk() {
        return videogame_id_pk;
    }

    public void setVideogame_id_pk(int videogame_id_pk) {
        this.videogame_id_pk = videogame_id_pk;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
