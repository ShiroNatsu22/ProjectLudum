package model;

public class Character {

    private int character_id_pk;
    private String name;
    private String biography;

    public Character(int character_id_pk, String name, String biography) {
        this.character_id_pk = character_id_pk;
        this.name = name;
        this.biography = biography;
    }

    public int getCharacter_id_pk() {
        return character_id_pk;
    }

    public void setCharacter_id_pk(int character_id_pk) {
        this.character_id_pk = character_id_pk;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }
}
