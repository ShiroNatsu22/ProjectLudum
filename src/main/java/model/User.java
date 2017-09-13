package model;

import java.util.Date;

public class User {

    private int user_id_pk;
    private String username;
    private String password;
    private boolean admin;
    private String name;
    private String surname;
    private String gender;
    private String country;
    private String email;
    private Date birthday;
    private String biography;
    private Date registration;
    private String profileImage;

    public User() {

    }

    public User(int user_id_pk, String username, String password, boolean admin, String name, String surname, String gender, String country, String email, Date birthday, String biography, Date registration, String profileImage) {
        this.user_id_pk = user_id_pk;
        this.username = username;
        this.password = password;
        this.admin = admin;
        this.name = name;
        this.surname = surname;
        this.gender = gender;
        this.country = country;
        this.email = email;
        this.birthday = birthday;
        this.biography = biography;
        this.registration = registration;
        this.profileImage = profileImage;
    }

    public int getUser_id_pk() {
        return user_id_pk;
    }

    public void setUser_id_pk(int user_id_pk) {
        this.user_id_pk = user_id_pk;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    public Date getRegistration() {
        return registration;
    }

    public void setRegistration(Date registration) {
        this.registration = registration;
    }

    public String getProfileImage() {
        return profileImage;
    }

    public void setProfileImage(String profileImage) {
        this.profileImage = profileImage;
    }
}