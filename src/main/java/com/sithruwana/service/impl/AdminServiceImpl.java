package com.sithruwana.service.impl;

import java.sql.SQLException;

import com.sithruwana.dao.AdminDAO;
import com.sithruwana.dao.impl.AdminDAOImpl;
import com.sithruwana.model.Admin;
import com.sithruwana.service.AdminService;

public class AdminServiceImpl implements AdminService {
    private AdminDAO adminDAO;
    
    public AdminServiceImpl() {
        this.adminDAO = new AdminDAOImpl();
    }

    @Override
    public Admin getAdminByUsername(String username) throws SQLException {
        return adminDAO.getAdminByUsername(username);
    }

    @Override
    public boolean authenticateAdmin(String username, String password) throws SQLException {
        return adminDAO.validateAdmin(username, password);
    }
    
    @Override
    public boolean updateAdmin(Admin admin) throws SQLException {
        return adminDAO.updateAdmin(admin);
    }
}
