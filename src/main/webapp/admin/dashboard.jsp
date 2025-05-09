<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sithruwana Tyre Mart - Admin Dashboard</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen">
    <div class="flex h-screen bg-gray-100">
        <!-- Sidebar -->
        <div class="bg-gray-800 text-white w-64 flex-shrink-0">
            <div class="p-4 flex items-center">
                <img src="../pictures/123.jpg" alt="Sithruwana Logo" class="w-10 h-10 rounded-full mr-3">
                <span class="text-lg font-semibold">Admin Panel</span>
            </div>
            <nav class="mt-5">
                <a href="dashboard.jsp" class="flex items-center py-2 px-4 bg-gray-700 text-white">
                    <i class="fas fa-tachometer-alt mr-3"></i>
                    Dashboard
                </a>
                <a href="AdminUserServlet" class="flex items-center py-2 px-4 hover:bg-gray-700 text-white">
                    <i class="fas fa-users mr-3"></i>
                    Users
                </a>
                <a href="#" class="flex items-center py-2 px-4 hover:bg-gray-700 text-white">
                    <i class="fas fa-tags mr-3"></i>
                    Products
                </a>
                <a href="#" class="flex items-center py-2 px-4 hover:bg-gray-700 text-white">
                    <i class="fas fa-shopping-cart mr-3"></i>
                    Orders
                </a>
                <a href="#" class="flex items-center py-2 px-4 hover:bg-gray-700 text-white">
                    <i class="fas fa-chart-bar mr-3"></i>
                    Reports
                </a>
                <a href="#" onclick="openProfileModal()" class="flex items-center py-2 px-4 hover:bg-gray-700 text-white">
                    <i class="fas fa-user-cog mr-3"></i>
                    My Profile
                </a>
                <a href="AdminLogoutServlet" class="flex items-center py-2 px-4 hover:bg-gray-700 text-white mt-10">
                    <i class="fas fa-sign-out-alt mr-3"></i>
                    Logout
                </a>
            </nav>
        </div>
        
        <!-- Main Content -->
        <div class="flex-1 overflow-x-hidden overflow-y-auto">
            <!-- Top Navigation -->
            <header class="bg-white shadow">
                <div class="max-w-7xl mx-auto py-4 px-4 sm:px-6 lg:px-8 flex justify-between items-center">
                    <h1 class="text-2xl font-bold text-gray-900">Dashboard</h1>
                    <div class="flex items-center">
                        <span class="mr-2 text-gray-700">Welcome, <%= session.getAttribute("adminUsername") %></span>
                        <img src="../pictures/admin-avatar.jpg" alt="Admin" class="w-8 h-8 rounded-full">
                    </div>
                </div>
            </header>
            
            <!-- Alert Messages -->
            <% if(request.getAttribute("successMessage") != null) { %>
                <div class="max-w-7xl mx-auto mt-4 px-4 sm:px-6 lg:px-8">
                    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                        <span class="block sm:inline"><%= request.getAttribute("successMessage") %></span>
                    </div>
                </div>
            <% } %>
            
            <% if(request.getAttribute("errorMessage") != null) { %>
                <div class="max-w-7xl mx-auto mt-4 px-4 sm:px-6 lg:px-8">
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                        <span class="block sm:inline"><%= request.getAttribute("errorMessage") %></span>
                    </div>
                </div>
            <% } %>
            
            <!-- Dashboard Content -->
            <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
                <!-- Stats Cards -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
                    <div class="bg-white overflow-hidden shadow rounded-lg">
                        <div class="p-5">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-blue-500 rounded-md p-3">
                                    <i class="fas fa-users text-white text-xl"></i>
                                </div>
                                <div class="ml-5 w-0 flex-1">
                                    <dl>
                                        <dt class="text-sm font-medium text-gray-500 truncate">Total Users</dt>
                                        <dd class="text-3xl font-semibold text-gray-900">
                                            <c:choose>
                                                <c:when test="${not empty userList}">
                                                    ${userList.size()}
                                                </c:when>
                                                <c:otherwise>
                                                    0
                                                </c:otherwise>
                                            </c:choose>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white overflow-hidden shadow rounded-lg">
                        <div class="p-5">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-green-500 rounded-md p-3">
                                    <i class="fas fa-shopping-cart text-white text-xl"></i>
                                </div>
                                <div class="ml-5 w-0 flex-1">
                                    <dl>
                                        <dt class="text-sm font-medium text-gray-500 truncate">Total Orders</dt>
                                        <dd class="text-3xl font-semibold text-gray-900">0</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white overflow-hidden shadow rounded-lg">
                        <div class="p-5">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-yellow-500 rounded-md p-3">
                                    <i class="fas fa-tags text-white text-xl"></i>
                                </div>
                                <div class="ml-5 w-0 flex-1">
                                    <dl>
                                        <dt class="text-sm font-medium text-gray-500 truncate">Products</dt>
                                        <dd class="text-3xl font-semibold text-gray-900">0</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bg-white overflow-hidden shadow rounded-lg">
                        <div class="p-5">
                            <div class="flex items-center">
                                <div class="flex-shrink-0 bg-red-500 rounded-md p-3">
                                    <i class="fas fa-dollar-sign text-white text-xl"></i>
                                </div>
                                <div class="ml-5 w-0 flex-1">
                                    <dl>
                                        <dt class="text-sm font-medium text-gray-500 truncate">Revenue</dt>
                                        <dd class="text-3xl font-semibold text-gray-900">$0</dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- User Management Section (Conditionally Displayed) -->
                <c:if test="${not empty userList}">
                    <div class="bg-white shadow overflow-hidden sm:rounded-lg mb-8">
                        <div class="px-4 py-5 sm:px-6 flex justify-between items-center">
                            <h3 class="text-lg leading-6 font-medium text-gray-900">User Management</h3>
                            <button onclick="openAddUserModal()" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-md">
                                <i class="fas fa-user-plus mr-2"></i>Add User
                            </button>
                        </div>
                        <div class="border-t border-gray-200">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            ID
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Username
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Email
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Contact
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Role
                                        </th>
                                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Actions
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <c:forEach var="user" items="${userList}">
                                        <tr>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                ${user.userId}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${user.username}</div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="text-sm text-gray-900">${user.email}</div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                ${user.contactNo}
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800">
                                                    ${user.role}
                                                </span>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                                <button onclick="openEditUserModal(${user.userId}, '${user.username}', '${user.email}', '${user.contactNo}', '${user.role}')" 
                                                    class="text-indigo-600 hover:text-indigo-900 mr-3">
                                                    <i class="fas fa-edit"></i> Edit
                                                </button>
                                                <button onclick="confirmDeleteUser(${user.userId}, '${user.username}')" 
                                                    class="text-red-600 hover:text-red-900">
                                                    <i class="fas fa-trash-alt"></i> Delete
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>
                
                <!-- Recent Activity Section -->
                <div class="bg-white shadow overflow-hidden sm:rounded-lg">
                    <div class="px-4 py-5 sm:px-6">
                        <h3 class="text-lg leading-6 font-medium text-gray-900">Recent Activity</h3>
                    </div>
                    <div class="border-t border-gray-200">
                        <div class="p-6">
                            <ul class="divide-y divide-gray-200">
                                <li class="py-4">
                                    <div class="flex space-x-3">
                                        <div class="flex-shrink-0">
                                            <i class="fas fa-user-plus text-blue-500 text-xl"></i>
                                        </div>
                                        <div class="flex-1 space-y-1">
                                            <div class="flex items-center justify-between">
                                                <h3 class="text-sm font-medium">New user registered</h3>
                                                <p class="text-sm text-gray-500">5 minutes ago</p>
                                            </div>
                                            <p class="text-sm text-gray-500">User "john_doe" created an account</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="py-4">
                                    <div class="flex space-x-3">
                                        <div class="flex-shrink-0">
                                            <i class="fas fa-shopping-cart text-green-500 text-xl"></i>
                                        </div>
                                        <div class="flex-1 space-y-1">
                                            <div class="flex items-center justify-between">
                                                <h3 class="text-sm font-medium">New order placed</h3>
                                                <p class="text-sm text-gray-500">1 hour ago</p>
                                            </div>
                                            <p class="text-sm text-gray-500">Order #2025-1001 has been placed</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="py-4">
                                    <div class="flex space-x-3">
                                        <div class="flex-shrink-0">
                                            <i class="fas fa-tag text-yellow-500 text-xl"></i>
                                        </div>
                                        <div class="flex-1 space-y-1">
                                            <div class="flex items-center justify-between">
                                                <h3 class="text-sm font-medium">Product updated</h3>
                                                <p class="text-sm text-gray-500">3 hours ago</p>
                                            </div>
                                            <p class="text-sm text-gray-500">Product "CEAT Tyre 205/55R16" stock updated</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    
    <!-- Admin Profile Modal -->
    <div id="profileModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3 text-center">
                <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-blue-100">
                    <i class="fas fa-user-cog text-blue-600 text-xl"></i>
                </div>
                <h3 class="text-lg leading-6 font-medium text-gray-900 mt-2">Update Profile</h3>
                <form action="AdminProfileServlet" method="post" class="mt-4 text-left">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="adminUsername">
                            Username
                        </label>
                        <input type="text" id="adminUsername" value="<%= session.getAttribute("adminUsername") %>" readonly
                            class="w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-md focus:outline-none">
                        <p class="text-xs text-gray-500 mt-1">Username cannot be changed</p>
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="adminEmail">
                            Email
                        </label>
                        <input type="email" id="adminEmail" name="email" required
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="currentPassword">
                            Current Password
                        </label>
                        <input type="password" id="currentPassword" name="currentPassword"
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="newPassword">
                            New Password
                        </label>
                        <input type="password" id="newPassword" name="newPassword"
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                        <p class="text-xs text-gray-500 mt-1">Leave blank to keep current password</p>
                    </div>
                    <div class="flex justify-between mt-6">
                        <button type="button" onclick="closeProfileModal()" class="px-4 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400">
                            Cancel
                        </button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">
                            Update Profile
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Add User Modal -->
    <div id="addUserModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3 text-center">
                <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-green-100">
                    <i class="fas fa-user-plus text-green-600 text-xl"></i>
                </div>
                <h3 class="text-lg leading-6 font-medium text-gray-900 mt-2">Add New User</h3>
                <form action="AdminAddUserServlet" method="post" class="mt-4 text-left">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="username">
                            Username
                        </label>
                        <input type="text" id="username" name="username" required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="email">
                            Email
                        </label>
                        <input type="email" id="email" name="email" required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="password">
                            Password
                        </label>
                        <input type="password" id="password" name="password" required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="contactNo">
                            Contact Number
                        </label>
                        <input type="text" id="contactNo" name="contactNo" 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="role">
                            Role
                        </label>
                        <select id="role" name="role" 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                            <option value="user">User</option>
                            <option value="admin">Admin</option>
                            <option value="guest">Guest</option>
                        </select>
                    </div>
                    <div class="flex justify-between mt-6">
                        <button type="button" onclick="closeAddUserModal()" class="px-4 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400">
                            Cancel
                        </button>
                        <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700">
                            Add User
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Edit User Modal -->
    <div id="editUserModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3 text-center">
                <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-blue-100">
                    <i class="fas fa-user-edit text-blue-600 text-xl"></i>
                </div>
                <h3 class="text-lg leading-6 font-medium text-gray-900 mt-2">Edit User</h3>
                <form action="AdminUpdateUserServlet" method="post" class="mt-4 text-left">
                    <input type="hidden" id="editUserId" name="userId">
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="editUsername">
                            Username
                        </label>
                        <input type="text" id="editUsername" name="username" required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="editEmail">
                            Email
                        </label>
                        <input type="email" id="editEmail" name="email" required 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="editPassword">
                            New Password (leave empty to keep current)
                        </label>
                        <input type="password" id="editPassword" name="password" 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="editContactNo">
                            Contact Number
                        </label>
                        <input type="text" id="editContactNo" name="contactNo" 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                    </div>
                    <div class="mb-4">
                        <label class="block text-gray-700 text-sm font-bold mb-2" for="editRole">
                            Role
                        </label>
                        <select id="editRole" name="role" 
                            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                            <option value="user">User</option>
                            <option value="admin">Admin</option>
                            <option value="guest">Guest</option>
                        </select>
                    </div>
                    <div class="flex justify-between mt-6">
                        <button type="button" onclick="closeEditUserModal()" class="px-4 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400">
                            Cancel
                        </button>
                        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700">
                            Update User
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Delete Confirmation Modal -->
    <div id="deleteConfirmModal" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full hidden">
        <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div class="mt-3 text-center">
                <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-red-100">
                    <i class="fas fa-exclamation-triangle text-red-600 text-xl"></i>
                </div>
                <h3 class="text-lg leading-6 font-medium text-gray-900 mt-2">Confirm Delete</h3>
                <div class="mt-2 px-7 py-3">
                    <p class="text-sm text-gray-500" id="deleteConfirmMessage">
                        Are you sure you want to delete this user? This action cannot be undone.
                    </p>
                </div>
                <div class="flex justify-between mt-4">
                    <button type="button" onclick="closeDeleteConfirmModal()" class="px-4 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400">
                        Cancel
                    </button>
                    <form action="AdminDeleteUserServlet" method="post">
                        <input type="hidden" id="deleteUserId" name="userId">
                        <button type="submit" class="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700">
                            Delete
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- JavaScript for Modal Functionality -->
    <script>
        // Admin Profile Modal
        function openProfileModal() {
            // Fetch admin data and populate fields
            document.getElementById('adminEmail').value = 'admin@sithruwana.com'; // Replace with actual admin email
            document.getElementById('profileModal').classList.remove('hidden');
        }
        
        function closeProfileModal() {
            document.getElementById('profileModal').classList.add('hidden');
        }
        
        // Add User Modal
        function openAddUserModal() {
            document.getElementById('addUserModal').classList.remove('hidden');
        }
        
        function closeAddUserModal() {
            document.getElementById('addUserModal').classList.add('hidden');
        }
        
        // Edit User Modal
        function openEditUserModal(userId, username, email, contactNo, role) {
            document.getElementById('editUserId').value = userId;
            document.getElementById('editUsername').value = username;
            document.getElementById('editEmail').value = email;
            document.getElementById('editContactNo').value = contactNo;
            document.getElementById('editRole').value = role;
            
            document.getElementById('editUserModal').classList.remove('hidden');
        }
        
        function closeEditUserModal() {
            document.getElementById('editUserModal').classList.add('hidden');
        }
        
        // Delete Confirmation Modal
        function confirmDeleteUser(userId, username) {
            document.getElementById('deleteUserId').value = userId;
            document.getElementById('deleteConfirmMessage').textContent = 
                `Are you sure you want to delete user "${username}"? This action cannot be undone.`;
            document.getElementById('deleteConfirmModal').classList.remove('hidden');
        }
        
        function closeDeleteConfirmModal() {
            document.getElementById('deleteConfirmModal').classList.add('hidden');
        }
        
        // Close modals when clicking outside
        window.onclick = function(event) {
            const profileModal = document.getElementById('profileModal');
            const addModal = document.getElementById('addUserModal');
            const editModal = document.getElementById('editUserModal');
            const deleteModal = document.getElementById('deleteConfirmModal');
            
            if (event.target === profileModal) {
                closeProfileModal();
            }
            if (event.target === addModal) {
                closeAddUserModal();
            }
            if (event.target === editModal) {
                closeEditUserModal();
            }
            if (event.target === deleteModal) {
                closeDeleteConfirmModal();
            }
        }
    </script>
</body>
</html>
