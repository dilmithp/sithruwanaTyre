package com.sithruwana.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtil {
    private static final String JDBC_URL = "jdbc:mysql://localhost:8889/sithruwana_db";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "root";
    
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database driver not found: " + e.getMessage());
        } catch (SQLException e) {
            throw new SQLException("Database connection error: " + e.getMessage());
        }
        return connection;
    }
}
