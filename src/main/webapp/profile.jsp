<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="container mx-auto px-4 py-8">
    <div class="max-w-4xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
        <div class="md:flex">
            <div class="md:flex-shrink-0 bg-blue-600 md:w-48 flex items-center justify-center">
                <div class="text-center p-6">
                    <div class="w-24 h-24 rounded-full bg-white mx-auto flex items-center justify-center">
                        <i class="fas fa-user-circle text-6xl text-blue-600"></i>
                    </div>
                    <h2 class="mt-4 text-xl font-bold text-white">${user.username}</h2>
                    <p class="text-blue-200">${user.role}</p>
                </div>
            </div>
            
            <div class="p-8 w-full">
                <h1 class="text-2xl font-bold text-gray-800 mb-6">User Profile</h1>
                
                <% if(request.getAttribute("successMessage") != null) { %>
                    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                        <span class="block sm:inline">${successMessage}</span>
                    </div>
                <% } %>
                
                <% if(request.getAttribute("errorMessage") != null) { %>
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                        <span class="block sm:inline">${errorMessage}</span>
                    </div>
                <% } %>
                
                <form action="ProfileServlet" method="post">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                                <i class="fas fa-user text-gray-500 mr-2"></i>Username
                            </label>
                            <input type="text" id="username" value="${user.username}" readonly
                                class="w-full px-4 py-2 bg-gray-100 border rounded-md focus:outline-none">
                            <p class="text-xs text-gray-500 mt-1">Username cannot be changed</p>
                        </div>
                        
                        <div>
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
                                <i class="fas fa-envelope text-gray-500 mr-2"></i>Email
                            </label>
                            <input type="email" id="email" name="email" value="${user.email}" required
                                class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                            <% if(request.getAttribute("emailError") != null) { %>
                                <span class="text-xs tracking-wide text-red-600">${emailError}</span>
                            <% } %>
                        </div>
                        
                        <div>
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="contactNo">
                                <i class="fas fa-phone text-gray-500 mr-2"></i>Contact Number
                            </label>
                            <input type="text" id="contactNo" name="contactNo" value="${user.contactNo}"
                                class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                            <% if(request.getAttribute("contactError") != null) { %>
                                <span class="text-xs tracking-wide text-red-600">${contactError}</span>
                            <% } %>
                        </div>
                    </div>
                    
                    <div class="mt-8">
                        <h2 class="text-xl font-bold text-gray-800 mb-4">Change Password</h2>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="currentPassword">
                                    <i class="fas fa-lock text-gray-500 mr-2"></i>Current Password
                                </label>
                                <input type="password" id="currentPassword" name="currentPassword"
                                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                            </div>
                            
                            <div>
                                <label class="block text-gray-700 text-sm font-bold mb-2" for="newPassword">
                                    <i class="fas fa-key text-gray-500 mr-2"></i>New Password
                                </label>
                                <input type="password" id="newPassword" name="newPassword"
                                    class="w-full px-4 py-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                            </div>
                        </div>
                        <% if(request.getAttribute("passwordError") != null) { %>
                            <span class="text-xs tracking-wide text-red-600 block mt-2">${passwordError}</span>
                        <% } %>
                        <p class="text-xs text-gray-500 mt-1">Leave password fields empty if you don't want to change it</p>
                    </div>
                    
                    <div class="mt-8 flex justify-end">
                        <button type="submit" 
                            class="px-6 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-900 focus:outline-none">
                            <i class="fas fa-save mr-2"></i>Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
