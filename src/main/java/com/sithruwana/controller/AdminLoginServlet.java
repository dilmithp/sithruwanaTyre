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

@WebServlet("/admin/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(AdminLoginServlet.class.getName());
    
    private AdminService adminService;
    
    public void init() {
        adminService = new AdminServiceImpl();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward to admin login page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Input validation
        if (!ValidationUtil.isValidUsername(username) || !ValidationUtil.isValidPassword(password)) {
            request.setAttribute("loginError", "Invalid username or password format");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        try {
            if (adminService.authenticateAdmin(username, password)) {
                // Get admin details for session
                Admin admin = adminService.getAdminByUsername(username);
                
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("adminUsername", username);
                session.setAttribute("adminId", admin.getAdminId());
                session.setAttribute("adminRole", admin.getRole());
                
                LOGGER.log(Level.INFO, "Admin {0} logged in successfully", username);
                
                // Redirect to admin dashboard
                response.sendRedirect("dashboard.jsp");
            } else {
                request.setAttribute("loginError", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error during admin login", e);
            request.setAttribute("loginError", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error during admin login", e);
            request.setAttribute("loginError", "An unexpected error occurred");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
