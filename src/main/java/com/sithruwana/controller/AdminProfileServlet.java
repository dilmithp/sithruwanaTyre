package com.sithruwana.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sithruwana.model.Admin;
import com.sithruwana.service.AdminService;
import com.sithruwana.service.impl.AdminServiceImpl;
import com.sithruwana.util.ValidationUtil;

@WebServlet("/admin/AdminProfileServlet")
public class AdminProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(AdminProfileServlet.class.getName());
    
    private AdminService adminService;
    
    public void init() {
        adminService = new AdminServiceImpl();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("adminUsername") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String username = (String) session.getAttribute("adminUsername");
        int adminId = (int) session.getAttribute("adminId");
        
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        
        try {
            Admin admin = adminService.getAdminByUsername(username);
            
            if (admin == null) {
                request.setAttribute("errorMessage", "Admin not found");
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                return;
            }
            
            // Validate email
            if (!ValidationUtil.isValidEmail(email)) {
                request.setAttribute("errorMessage", "Invalid email format");
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                return;
            }
            
            // Update email
            admin.setEmail(email);
            
            // Update password if provided
            if (newPassword != null && !newPassword.isEmpty()) {
                // Verify current password
                if (!admin.getPassword().equals(currentPassword)) {
                    request.setAttribute("errorMessage", "Current password is incorrect");
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                    return;
                }
                
                // Validate new password
                if (!ValidationUtil.isValidPassword(newPassword)) {
                    request.setAttribute("errorMessage", "New password must be at least 8 characters long");
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                    return;
                }
                
                admin.setPassword(newPassword);
            }
            
            // Save changes
            boolean updated = adminService.updateAdmin(admin);
            
            if (updated) {
                request.setAttribute("successMessage", "Profile updated successfully");
                LOGGER.log(Level.INFO, "Admin profile updated: {0}", username);
            } else {
                request.setAttribute("errorMessage", "Failed to update profile");
            }
            
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error updating admin profile", e);
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}
