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

import com.sithruwana.model.User;
import com.sithruwana.service.UserService;
import com.sithruwana.service.impl.UserServiceImpl;
import com.sithruwana.util.ValidationUtil;

@WebServlet("/admin/AdminAddUserServlet")
public class AdminAddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(AdminAddUserServlet.class.getName());
    
    private UserService userService;
    
    public void init() {
        userService = new UserServiceImpl();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNo = request.getParameter("contactNo");
        String role = request.getParameter("role");
        
        // Validate input
        if (!ValidationUtil.isValidUsername(username) || !ValidationUtil.isValidEmail(email) || 
            !ValidationUtil.isValidPassword(password)) {
            
            request.setAttribute("errorMessage", "Invalid input data. Please check the form fields.");
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
            return;
        }
        
        try {
            // Check if username already exists
            User existingUser = userService.getUserByUsername(username);
            if (existingUser != null) {
                request.setAttribute("errorMessage", "Username already exists. Please choose another username.");
                request.getRequestDispatcher("AdminUserServlet").forward(request, response);
                return;
            }
            
            // Create new user
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setEmail(email);
            newUser.setPassword(password);
            newUser.setContactNo(contactNo);
            newUser.setRole(role);
            
            // Register user
            userService.registerUser(newUser);
            
            LOGGER.log(Level.INFO, "New user added by admin: {0}", username);
            
            // Redirect with success message
            request.setAttribute("successMessage", "User added successfully.");
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding user", e);
            request.setAttribute("errorMessage", "Failed to add user: " + e.getMessage());
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
        }
    }
}
