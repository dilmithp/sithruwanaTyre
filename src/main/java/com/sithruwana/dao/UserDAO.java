package com.sithruwana.dao;

import java.sql.SQLException;
import java.util.List;
import com.sithruwana.model.User;

public interface UserDAO {
    void insertUser(User user) throws SQLException;
    User getUserById(int userId) throws SQLException;
    User getUserByUsername(String username) throws SQLException;
    User getUserByEmail(String email) throws SQLException;
    List<User> getAllUsers() throws SQLException;
    boolean updateUser(User user) throws SQLException;
    boolean deleteUser(int userId) throws SQLException;
    boolean validateUser(String username, String password) throws SQLException;
}
