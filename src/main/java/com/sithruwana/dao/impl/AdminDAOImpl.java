package com.sithruwana.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sithruwana.dao.AdminDAO;
import com.sithruwana.model.Admin;
import com.sithruwana.util.DBConnectionUtil;

public class AdminDAOImpl implements AdminDAO {
    private static final String GET_ADMIN_BY_USERNAME = "SELECT * FROM Admin WHERE username = ?";
    private static final String VALIDATE_ADMIN = "SELECT * FROM Admin WHERE username = ? AND password = ?";
    private static final String UPDATE_ADMIN = "UPDATE Admin SET email = ?, password = ? WHERE adminId = ?";
    
    @Override
    public Admin getAdminByUsername(String username) throws SQLException {
        Admin admin = null;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ADMIN_BY_USERNAME)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                admin = extractAdminFromResultSet(rs);
            }
        } catch (SQLException e) {
            throw new SQLException("Error retrieving admin by username: " + e.getMessage());
        }
        return admin;
    }
    
    @Override
    public boolean validateAdmin(String username, String password) throws SQLException {
        boolean valid = false;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_ADMIN)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            valid = rs.next();
        } catch (SQLException e) {
            throw new SQLException("Error validating admin: " + e.getMessage());
        }
        return valid;
    }
    
    @Override
    public boolean updateAdmin(Admin admin) throws SQLException {
        boolean updated = false;
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ADMIN)) {
            preparedStatement.setString(1, admin.getEmail());
            preparedStatement.setString(2, admin.getPassword());
            preparedStatement.setInt(3, admin.getAdminId());
            
            int rowsAffected = preparedStatement.executeUpdate();
            updated = rowsAffected > 0;
        } catch (SQLException e) {
            throw new SQLException("Error updating admin: " + e.getMessage());
        }
        return updated;
    }
    
    private Admin extractAdminFromResultSet(ResultSet rs) throws SQLException {
        Admin admin = new Admin();
        admin.setAdminId(rs.getInt("adminId"));
        admin.setUsername(rs.getString("username"));
        admin.setEmail(rs.getString("email"));
        admin.setPassword(rs.getString("password"));
        admin.setRole(rs.getString("role"));
        return admin;
    }
}
