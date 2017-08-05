package model;

import java.sql.*;

public class DataBase {
    private String driver;
    private String url;
    private String user;
    private String password;

    public DataBase() {

    }

    public DataBase(String driver, String url, String user, String password) {
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.password = password;
    }

    public PreparedStatement getConnection(String query) {

        try {
            Class.forName(this.getDriver());
            Connection connection = DriverManager.getConnection(
                    this.getUrl(),
                    this.getUser(),
                    this.getPassword()
            );
            PreparedStatement ps = connection.prepareStatement(query);
            return ps;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}