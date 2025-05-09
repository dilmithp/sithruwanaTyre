package com.sithruwana.dao;

import java.sql.SQLException;
import com.sithruwana.model.Admin;

public interface AdminDAO {
    Admin getAdminByUsername(String username) throws SQLException;
    boolean validateAdmin(String username, String password) throws SQLException;
    boolean updateAdmin(Admin admin) throws SQLException;
}
