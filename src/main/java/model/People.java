package model;

import java.util.Date;

public class People {

    private int people_id_pk;
    private String name;
    private String surname;
    private Date birthday;
    private String nationality;
    private String biography;

    public People() {
    }

    public People(int people_id_pk, String name, String surname, Date birthday, String nationality, String biography) {
        this.people_id_pk = people_id_pk;
        this.name = name;
        this.surname = surname;
        this.birthday = birthday;
        this.nationality = nationality;
        this.biography = biography;
    }

    public int getPeople_id_pk() {
        return people_id_pk;
    }

    public void setPeople_id_pk(int people_id_pk) {
        this.people_id_pk = people_id_pk;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }
}
