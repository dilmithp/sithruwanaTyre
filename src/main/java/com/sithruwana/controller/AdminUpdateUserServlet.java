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

@WebServlet("/admin/AdminUpdateUserServlet")
public class AdminUpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(AdminUpdateUserServlet.class.getName());
    
    private UserService userService;
    
    public void init() {
        userService = new UserServiceImpl();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNo = request.getParameter("contactNo");
        String role = request.getParameter("role");
        
        // Validate input
        if (!ValidationUtil.isValidUsername(username) || !ValidationUtil.isValidEmail(email)) {
            request.setAttribute("errorMessage", "Invalid input data. Please check the form fields.");
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
            return;
        }
        
        try {
            // Get existing user
            User user = userService.getUserById(userId);
            
            if (user == null) {
                request.setAttribute("errorMessage", "User not found.");
                request.getRequestDispatcher("AdminUserServlet").forward(request, response);
                return;
            }
            
            // Check if username is being changed and if it already exists
            if (!user.getUsername().equals(username)) {
                User existingUser = userService.getUserByUsername(username);
                if (existingUser != null) {
                    request.setAttribute("errorMessage", "Username already exists. Please choose another username.");
                    request.getRequestDispatcher("AdminUserServlet").forward(request, response);
                    return;
                }
            }
            
            // Update user data
            user.setUsername(username);
            user.setEmail(email);
            user.setContactNo(contactNo);
            user.setRole(role);
            
            // Update password only if provided
            if (password != null && !password.trim().isEmpty()) {
                if (!ValidationUtil.isValidPassword(password)) {
                    request.setAttribute("errorMessage", "Invalid password format.");
                    request.getRequestDispatcher("AdminUserServlet").forward(request, response);
                    return;
                }
                user.setPassword(password);
            }
            
            // Save updated user
            boolean updated = userService.updateUser(user);
            
            if (updated) {
                LOGGER.log(Level.INFO, "User updated by admin: {0}", username);
                request.setAttribute("successMessage", "User updated successfully.");
            } else {
                request.setAttribute("errorMessage", "Failed to update user.");
            }
            
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating user", e);
            request.setAttribute("errorMessage", "Failed to update user: " + e.getMessage());
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid user ID format", e);
            request.setAttribute("errorMessage", "Invalid user ID format.");
            request.getRequestDispatcher("AdminUserServlet").forward(request, response);
        }
    }
}
