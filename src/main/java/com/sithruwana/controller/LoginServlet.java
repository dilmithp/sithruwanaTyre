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

import com.sithruwana.model.User;
import com.sithruwana.service.UserService;
import com.sithruwana.service.impl.UserServiceImpl;
import com.sithruwana.util.ValidationUtil;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());
    
    private UserService userService;
    
    public void init() {
        userService = new UserServiceImpl();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward to login page
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
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
            if (userService.authenticateUser(username, password)) {
                // Get user details for session
                User user = userService.getUserByUsername(username);
                
                // Create session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("userRole", user.getRole());
                
                LOGGER.log(Level.INFO, "User {0} logged in successfully", username);
                
                // Redirect based on role
                if ("admin".equals(user.getRole())) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                request.setAttribute("loginError", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error during login", e);
            request.setAttribute("loginError", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error during login", e);
            request.setAttribute("loginError", "An unexpected error occurred");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
