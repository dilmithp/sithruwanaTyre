package com.sithruwana.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.sithruwana.model.User;
import com.sithruwana.service.UserService;
import com.sithruwana.service.impl.UserServiceImpl;
import com.sithruwana.util.ValidationUtil;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(ProfileServlet.class.getName());
    
    private UserService userService;
    
    public void init() {
        userService = new UserServiceImpl();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String username = (String) session.getAttribute("username");
        
        try {
            // Get user profile
            User user = userService.getUserByUsername(username);
            
            if (user == null) {
                LOGGER.log(Level.WARNING, "Profile not found for username: {0}", username);
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            
            // Set user data as request attributes
            request.setAttribute("user", user);
            
            // Forward to profile JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while retrieving profile", e);
            request.setAttribute("errorMessage", "Failed to retrieve profile: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String username = (String) session.getAttribute("username");
        int userId = (int) session.getAttribute("userId");
        
        // Get form parameters
        String email = request.getParameter("email");
        String contactNo = request.getParameter("contactNo");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        
        try {
            // Get current user profile
            User user = userService.getUserByUsername(username);
            
            if (user == null) {
                LOGGER.log(Level.WARNING, "Profile not found for username: {0}", username);
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            
            // Validate input
            boolean isValid = true;
            
            if (!ValidationUtil.isValidEmail(email)) {
                request.setAttribute("emailError", "Please enter a valid email address");
                isValid = false;
            }
            
            if (contactNo != null && !contactNo.isEmpty() && !ValidationUtil.isValidContactNo(contactNo)) {
                request.setAttribute("contactError", "Please enter a valid contact number");
                isValid = false;
            }
            
            // Password change validation
            boolean changePassword = false;
            if (newPassword != null && !newPassword.isEmpty()) {
                if (!user.getPassword().equals(currentPassword)) {
                    request.setAttribute("passwordError", "Current password is incorrect");
                    isValid = false;
                } else if (!ValidationUtil.isValidPassword(newPassword)) {
                    request.setAttribute("passwordError", "New password must be at least 8 characters long");
                    isValid = false;
                } else {
                    changePassword = true;
                }
            }
            
            if (!isValid) {
                // Return to form with error messages
                request.setAttribute("user", user);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                return;
            }
            
            // Update user profile
            user.setEmail(email);
            user.setContactNo(contactNo);
            
            if (changePassword) {
                user.setPassword(newPassword);
            }
            
            // Save updated profile
            boolean updated = userService.updateUser(user);
            
            if (updated) {
                request.setAttribute("successMessage", "Profile updated successfully");
                LOGGER.log(Level.INFO, "Profile updated for user: {0}", username);
            } else {
                request.setAttribute("errorMessage", "Failed to update profile");
                LOGGER.log(Level.WARNING, "Failed to update profile for user: {0}", username);
            }
            
            // Forward back to profile page
            request.setAttribute("user", user);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error while updating profile", e);
            request.setAttribute("errorMessage", "Failed to update profile: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
