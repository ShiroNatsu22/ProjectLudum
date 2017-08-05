package dao;

import model.User;

import java.util.List;

public interface UserDAO {

    List<User> getAllUsers();

    User getUserByUsername(String username);
}
