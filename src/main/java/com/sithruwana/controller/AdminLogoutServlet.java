package com.sithruwana.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(AdminLogoutServlet.class.getName());
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            String adminUsername = (String) session.getAttribute("adminUsername");
            LOGGER.log(Level.INFO, "Admin {0} logged out", adminUsername);
            
            // Remove admin-specific attributes
            session.removeAttribute("adminUsername");
            session.removeAttribute("adminId");
            session.removeAttribute("adminRole");
            
            // Invalidate the session
            session.invalidate();
        }
        
        // Redirect to admin login page
        response.sendRedirect("login.jsp");
    }
}
