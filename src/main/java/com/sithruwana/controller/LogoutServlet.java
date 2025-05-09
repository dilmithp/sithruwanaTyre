package com.sithruwana.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(LogoutServlet.class.getName());
    
    public LogoutServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        LOGGER.log(Level.INFO, "Logout initiated");
        
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Log the username that is logging out
            String username = (String) session.getAttribute("username");
            LOGGER.log(Level.INFO, "User {0} logged out", username);
            
            // Remove all session attributes
            session.removeAttribute("username");
            session.removeAttribute("userId");
            session.removeAttribute("userRole");
            
            // Invalidate the session
            session.invalidate();
            
            LOGGER.log(Level.INFO, "Session invalidated successfully");
        }
        
        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}
