<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- Footer -->
    <footer class="bg-gray-800 text-white mt-12">
        <div class="container mx-auto px-4 py-10">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div>
                    <h3 class="text-xl font-bold mb-4 text-blue-400">Quick Links</h3>
                    <ul class="space-y-2">
                        <li><a href="index.jsp" class="text-gray-300 hover:text-white transition-colors">Home</a></li>
                        <li><a href="ProductServlet" class="text-gray-300 hover:text-white transition-colors">Products</a></li>
                        <li><a href="ServiceServlet" class="text-gray-300 hover:text-white transition-colors">Services</a></li>
                        <li><a href="CartServlet" class="text-gray-300 hover:text-white transition-colors">Cart</a></li>
                    </ul>
                </div>
                
                <div>
                    <h3 class="text-xl font-bold mb-4 text-blue-400">Business Hours</h3>
                    <p class="text-gray-300 mb-2">Monday - Friday: 8:00 AM - 6:00 PM</p>
                    <p class="text-gray-300 mb-2">Saturday: 9:00 AM - 5:00 PM</p>
                    <p class="text-gray-300 mb-2">Sunday: Closed</p>
                </div>
                
                <div>
                    <h3 class="text-xl font-bold mb-4 text-blue-400">Contact Us</h3>
                    <p class="text-gray-300 mb-2">
                        <i class="fas fa-map-marker-alt mr-2"></i>
                        No-177, Galle Rd, Beruwala, Colombo, Sri Lanka
                    </p>
                    <p class="text-gray-300 mb-2">
                        <i class="fas fa-phone mr-2"></i>
                        0342278240
                    </p>
                    <p class="text-gray-300 mb-2">
                        <i class="fas fa-envelope mr-2"></i>
                        Sithuruwana.tyremart@gmail.com
                    </p>
                </div>
            </div>
            
            <div class="border-t border-gray-700 mt-8 pt-6 text-center">
                <p class="text-gray-400">
                    &copy; <%= java.time.Year.now().getValue() %> Sithruwana Tyre Mart (Pvt) Ltd. All rights reserved.
                </p>
            </div>
        </div>
    </footer>
</body>
</html>
