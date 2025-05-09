<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sithruwana Tyre Mart - Error</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg shadow-md max-w-md w-full text-center">
        <div class="text-red-500 text-6xl mb-4">
            <i class="fas fa-exclamation-circle"></i>
        </div>
        <h1 class="text-2xl font-bold text-gray-800 mb-4">Error</h1>
        <p class="text-gray-600 mb-6">${errorMessage}</p>
        <a href="dashboard.jsp" class="inline-block px-6 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-900">
            <i class="fas fa-home mr-2"></i>Back to Dashboard
        </a>
    </div>
</body>
</html>
