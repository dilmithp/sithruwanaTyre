<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sithruwana Tyre Mart - Admin Login</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">
    <div class="px-8 py-6 mt-4 text-left bg-white shadow-lg border-t-4 border-blue-600 rounded-lg">
        <div class="flex justify-center">
            <img src="../pictures/123.jpg" alt="Sithruwana Logo" class="w-20 h-20 rounded-full object-cover">
        </div>
        <h3 class="text-2xl font-bold text-center text-gray-800 mb-6">Admin Login</h3>
        
        <% if(request.getAttribute("loginError") != null) { %>
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                <span class="block sm:inline"><%= request.getAttribute("loginError") %></span>
            </div>
        <% } %>
        
        <form action="AdminLoginServlet" method="post">
            <div class="mt-4">
                <div>
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                        <i class="fas fa-user text-gray-500 mr-2"></i>Username
                    </label>
                    <input type="text" id="username" name="username" required 
                        class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                </div>
                
                <div class="mt-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                        <i class="fas fa-lock text-gray-500 mr-2"></i>Password
                    </label>
                    <input type="password" id="password" name="password" required 
                        class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                </div>
                
                <div class="flex items-baseline justify-between mt-6">
                    <button type="submit" 
                        class="px-6 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-900 focus:outline-none">
                        <i class="fas fa-sign-in-alt mr-2"></i>Login
                    </button>
                </div>
            </div>
        </form>
        
        <div class="mt-6 text-center">
            <a href="../index.jsp" class="text-sm text-gray-600 hover:text-blue-600">
                <i class="fas fa-home mr-1"></i>Back to Home
            </a>
        </div>
    </div>
</body>
</html>
