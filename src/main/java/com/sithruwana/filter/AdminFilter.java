package com.sithruwana.filter;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {
    private static final Logger LOGGER = Logger.getLogger(AdminFilter.class.getName());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        HttpSession session = httpRequest.getSession(false);
        String requestURI = httpRequest.getRequestURI();
        
        // Allow access to admin login page and login servlet
        if (requestURI.endsWith("/admin/login.jsp") || requestURI.endsWith("/admin/AdminLoginServlet")) {
            chain.doFilter(request, response);
            return;
        }
        
        // Check if admin is logged in
        if (session == null || session.getAttribute("adminUsername") == null) {
            LOGGER.log(Level.INFO, "Unauthorized access attempt to admin area: {0}", requestURI);
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/admin/login.jsp");
            return;
        }
        
        // Admin is authenticated, proceed with the request
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
