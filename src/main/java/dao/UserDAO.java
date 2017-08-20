package dao;

import model.User;

import java.util.List;

public interface UserDAO {

    List<User> getAllUsers();

    User getUserByUserID(int user_id_pk);
    User getUserByUsername(String username);

    void createUser(User user);

    void deleteUser(int id);
}
