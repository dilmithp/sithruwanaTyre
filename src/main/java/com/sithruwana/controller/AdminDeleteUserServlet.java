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

import com.sithruwana.service.UserService;
import com.sithruwana.service.impl.UserServiceImpl;

@WebServlet("/admin/AdminDeleteUserServlet")
public class AdminDeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(AdminDeleteUserServlet.class.getName());
    
    private UserService userService;
    
    public void init() {
        userService = new UserServiceImpl();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            
            boolean deleted = userService.deleteUser(userId);
            
            if (deleted) {
                LOGGER.log(Level.INFO, "User deleted by admin: ID {0}", userId);
                request.setAttribute("successMessage", "User deleted successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to delete user.");
            }
            
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting user", e);
            request.setAttribute("errorMessage", "Failed to delete user: " + e.getMessage());
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid user ID format", e);
            request.setAttribute("errorMessage", "Invalid user ID format.");
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
        }
    }
}
