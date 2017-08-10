package model;

public class User {

    private int user_id_pk;
    private String username;
    private String password;
    private boolean admin;

    public User() {

    }

    public User(int user_id_pk, String username, String password, boolean admin) {
        this.user_id_pk = user_id_pk;
        this.username = username;
        this.password = password;
        this.admin = admin;
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
}
