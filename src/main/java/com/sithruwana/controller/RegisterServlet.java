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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(RegisterServlet.class.getName());
    
    private UserService userService;
    
    public void init() {
        userService = new UserServiceImpl();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward to register page
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNo = request.getParameter("contactNo");
        
        // Validate input
        boolean isValid = true;
        
        if (!ValidationUtil.isValidUsername(username)) {
            request.setAttribute("usernameError", "Username must be 3-50 characters long");
            isValid = false;
        }
        
        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("emailError", "Please enter a valid email address");
            isValid = false;
        }
        
        if (!ValidationUtil.isValidPassword(password)) {
            request.setAttribute("passwordError", "Password must be at least 8 characters long");
            isValid = false;
        }
        
        if (contactNo != null && !contactNo.isEmpty() && !ValidationUtil.isValidContactNo(contactNo)) {
            request.setAttribute("contactError", "Please enter a valid contact number");
            isValid = false;
        }
        
        if (!isValid) {
            // Return to form with error messages
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("contactNo", contactNo);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        try {
            // Check if username already exists
            if (userService.getUserByUsername(username) != null) {
                request.setAttribute("registrationError", "Username already exists");
                request.setAttribute("email", email);
                request.setAttribute("contactNo", contactNo);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            // Check if email already exists
            if (userService.getUserByEmail(email) != null) {
                request.setAttribute("registrationError", "Email already registered");
                request.setAttribute("username", username);
                request.setAttribute("contactNo", contactNo);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            
            // Create user object
            User user = new User();
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password); // In production, hash the password
            user.setContactNo(contactNo);
            user.setRole("user"); // Default role
            
            // Register user
            userService.registerUser(user);
            
            LOGGER.log(Level.INFO, "New user registered: {0}", username);
            
            // Redirect to login page with success message
            request.setAttribute("registrationSuccess", "Registration successful! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error during registration", e);
            request.setAttribute("registrationError", "Registration failed: " + e.getMessage());
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("contactNo", contactNo);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error during registration", e);
            request.setAttribute("registrationError", "An unexpected error occurred");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.setAttribute("contactNo", contactNo);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
