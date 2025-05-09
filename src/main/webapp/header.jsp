<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sithruwana Tyre Mart</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <header class="bg-white shadow-md fixed top-0 left-0 w-full z-50">
        <div class="container mx-auto px-4 py-3">
            <div class="flex justify-between items-center">
                <div class="flex items-center">
                    <img src="pictures/123.jpg" alt="Sithruwana Tyre Mart Logo" class="h-12 w-12 rounded-full mr-3">
                    <h1 class="text-xl font-bold text-blue-600">Sithruwana Tyre Mart</h1>
                </div>
                
                <nav>
                    <ul class="flex space-x-6">
                        <li>
                            <a href="index.jsp" class="text-gray-700 hover:text-blue-600 transition-colors">
                                <i class="fas fa-home mr-1"></i> Home
                            </a>
                        </li>
                        <li>
                            <a href="ProductServlet" class="text-gray-700 hover:text-blue-600 transition-colors">
                                <i class="fas fa-tags mr-1"></i> Products
                            </a>
                        </li>
                        <li>
                            <a href="ServiceServlet" class="text-gray-700 hover:text-blue-600 transition-colors">
                                <i class="fas fa-cogs mr-1"></i> Services
                            </a>
                        </li>
                        <li>
                            <a href="CartServlet" class="text-gray-700 hover:text-blue-600 transition-colors">
                                <i class="fas fa-shopping-cart mr-1"></i> Cart
                            </a>
                        </li>
                        
                        <% if(session.getAttribute("username") != null) { %>
                        <li>
                            <a href="ProfileServlet" class="text-gray-700 hover:text-blue-600 transition-colors">
                                <i class="fas fa-user-circle mr-1"></i> Profile
                            </a>
                        </li>
                        <li>
                            <a href="LogoutServlet" class="text-gray-700 hover:text-blue-600 transition-colors">
                                <i class="fas fa-sign-out-alt mr-1"></i> Logout
                            </a>
                        </li>
                        <% } else { %>
                        <li>
                            <a href="login.jsp" class="text-gray-700 hover:text-blue-600 transition-colors">
                                <i class="fas fa-user mr-1"></i> Login
                            </a>
                        </li>
                        <li>
                            <a href="register.jsp" class="text-gray-700 hover:text-blue-600 transition-colors">
                                <i class="fas fa-user-plus mr-1"></i> Sign Up
                            </a>
                        </li>
                        <% } %>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    
    <!-- Content space to prevent overlap with fixed header -->
    <div class="pt-20"></div>
