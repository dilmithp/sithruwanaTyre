package com.sithruwana.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.sithruwana.dao.UserDAO;
import com.sithruwana.dao.impl.UserDAOImpl;
import com.sithruwana.model.User;
import com.sithruwana.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDAO userDAO;
    
    public UserServiceImpl() {
        this.userDAO = new UserDAOImpl();
    }

    @Override
    public void registerUser(User user) throws SQLException {
        // Set default role if not specified
        if (user.getRole() == null || user.getRole().isEmpty()) {
            user.setRole("user");
        }
        userDAO.insertUser(user);
    }

    @Override
    public User getUserById(int userId) throws SQLException {
        return userDAO.getUserById(userId);
    }

    @Override
    public User getUserByUsername(String username) throws SQLException {
        return userDAO.getUserByUsername(username);
    }

    @Override
    public User getUserByEmail(String email) throws SQLException {
        return userDAO.getUserByEmail(email);
    }

    @Override
    public List<User> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userDAO.updateUser(user);
    }

    @Override
    public boolean deleteUser(int userId) throws SQLException {
        return userDAO.deleteUser(userId);
    }

    @Override
    public boolean authenticateUser(String username, String password) throws SQLException {
        return userDAO.validateUser(username, password);
    }
}
