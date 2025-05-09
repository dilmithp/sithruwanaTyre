package com.sithruwana.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sithruwana.dao.UserDAO;
import com.sithruwana.model.User;
import com.sithruwana.util.DBConnectionUtil;

public class UserDAOImpl implements UserDAO {
    private static final String INSERT_USER = "INSERT INTO User (username, email, password, contactNo, role) VALUES (?, ?, ?, ?, ?)";
    private static final String GET_USER_BY_ID = "SELECT * FROM User WHERE userId = ?";
    private static final String GET_USER_BY_USERNAME = "SELECT * FROM User WHERE username = ?";
    private static final String GET_USER_BY_EMAIL = "SELECT * FROM User WHERE email = ?";
    private static final String GET_ALL_USERS = "SELECT * FROM User";
    private static final String UPDATE_USER = "UPDATE User SET username = ?, email = ?, password = ?, contactNo = ?, role = ? WHERE userId = ?";
    private static final String DELETE_USER = "DELETE FROM User WHERE userId = ?";
    private static final String VALIDATE_USER = "SELECT * FROM User WHERE username = ? AND password = ?";

    @Override
    public void insertUser(User user) throws SQLException {
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getContactNo());
            preparedStatement.setString(5, user.getRole());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error inserting user: " + e.getMessage());
        }
    }

    @Override
    public User getUserById(int userId) throws SQLException {
        User user = null;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BY_ID)) {
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                user = extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving user by ID: " + e.getMessage());
        }
        return user;
    }

    @Override
    public User getUserByUsername(String username) throws SQLException {
        User user = null;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BY_USERNAME)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                user = extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving user by username: " + e.getMessage());
        }
        return user;
    }

    @Override
    public User getUserByEmail(String email) throws SQLException {
        User user = null;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                user = extractUserFromResultSet(rs);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving user by email: " + e.getMessage());
        }
        return user;
    }

    @Override
    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_USERS);
             ResultSet rs = preparedStatement.executeQuery()) {
            
            while (rs.next()) {
                User user = extractUserFromResultSet(rs);
                users.add(user);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving all users: " + e.getMessage());
        }
        return users;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getContactNo());
            preparedStatement.setString(5, user.getRole());
            preparedStatement.setInt(6, user.getUserId());
            
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new SQLException("Error updating user: " + e.getMessage());
        }
        return rowUpdated;
    }

    @Override
    public boolean deleteUser(int userId) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER)) {
            preparedStatement.setInt(1, userId);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new SQLException("Error deleting user: " + e.getMessage());
        }
        return rowDeleted;
    }

    @Override
    public boolean validateUser(String username, String password) throws SQLException {
        boolean valid = false;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_USER)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            valid = rs.next();
        } catch (SQLException e) {
            throw new SQLException("Error validating user: " + e.getMessage());
        }
        return valid;
    }

    private User extractUserFromResultSet(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getInt("userId"));
        user.setUsername(rs.getString("username"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setContactNo(rs.getString("contactNo"));
        user.setRole(rs.getString("role"));
        return user;
    }
}
