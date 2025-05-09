package com.sithruwana.service;

import java.sql.SQLException;
import com.sithruwana.model.Admin;

public interface AdminService {
    Admin getAdminByUsername(String username) throws SQLException;
    boolean authenticateAdmin(String username, String password) throws SQLException;
    boolean updateAdmin(Admin admin) throws SQLException;
}
