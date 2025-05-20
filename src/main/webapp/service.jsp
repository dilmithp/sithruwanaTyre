<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sithuruwana Tyre Mart - Service Center</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-color: #2c3e50;
      --secondary-color: #e74c3c;
      --accent-color: #3498db;
      --light-color: #ecf0f1;
      --dark-color: #2c3e50;
      --success-color: #2ecc71;
      --warning-color: #f39c12;
      --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      --transition: all 0.3s ease;
      --font-main: 'Poppins', sans-serif;
    }
    
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    
    body, html {
      font-family: var(--font-main);
      scroll-behavior: smooth;
      color: #333;
      background-color: #f5f5f5;
      line-height: 1.6;
      overflow-x: hidden;
      background-image: url("./pictures/RA2.jpg");
      background-repeat: no-repeat;
      background-position: center center;
      background-attachment: fixed;
      background-size: cover;
    }
    
    /* Custom Scrollbar */
    ::-webkit-scrollbar {
      width: 8px;
    }
    
    ::-webkit-scrollbar-track {
      background: #f1f1f1;
    }
    
    ::-webkit-scrollbar-thumb {
      background: var(--primary-color);
      border-radius: 5px;
    }
    
    ::-webkit-scrollbar-thumb:hover {
      background: #1a2530;
    }
    
    /* Header Styles */
    header {
      background-color: white;
      box-shadow: var(--box-shadow);
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 1000;
      transition: var(--transition);
      padding: 10px 20px;
    }
    
    header.scrolled {
      padding: 5px 20px;
    }
    
    .header-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .logo-section {
      display: flex;
      align-items: center;
    }
    
    .logo-section img {
      width: 60px;
      height: 60px;
      margin-right: 15px;
      border-radius: 50%;
      object-fit: cover;
      transition: var(--transition);
    }
    
    .logo-section h1 {
      font-size: 1.5rem;
      font-weight: 600;
      color: var(--primary-color);
      margin: 0;
    }
    
    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
    }
    
    nav li {
      margin: 0 5px;
    }
    
    nav a {
      display: flex;
      align-items: center;
      color: var(--text-color);
      text-decoration: none;
      font-size: 0.9rem;
      font-weight: 500;
      padding: 8px 15px;
      border-radius: 25px;
      transition: var(--transition);
    }
    
    nav a:hover {
      background-color: var(--primary-color);
      color: white;
      transform: translateY(-3px);
      box-shadow: 0 4px 8px rgba(44, 62, 80, 0.3);
    }
    
    nav a.active {
      background-color: var(--primary-color);
      color: white;
    }
    
    .hamburger {
      display: none;
      cursor: pointer;
      background: none;
      border: none;
      font-size: 1.5rem;
      color: var(--primary-color);
    }
    
    /* Container */
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 15px;
    }
    
    /* Service Dashboard Styling */
    .service-dashboard {
      padding: 120px 0 50px;
    }
    
    .service-header {
      text-align: center;
      margin-bottom: 50px;
    }
    
    .service-header h1 {
      font-size: 2.5rem;
      color: var(--primary-color);
      margin-bottom: 10px;
    }
    
    .service-cards {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 30px;
      margin-top: 40px;
    }
    
    .service-card {
      background: white;
      border-radius: 10px;
      box-shadow: var(--box-shadow);
      padding: 30px;
      text-align: center;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    
    .service-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
    }
    
    .service-card .icon {
      font-size: 3rem;
      color: var(--accent-color);
      margin-bottom: 20px;
    }
    
    .service-card h3 {
      font-size: 1.5rem;
      margin-bottom: 15px;
      color: var(--primary-color);
    }
    
    .btn-book {
      background-color: var(--accent-color);
      color: white;
      border: none;
      padding: 10px 25px;
      border-radius: 5px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s ease;
      margin-top: 20px;
    }
    
    .btn-book:hover {
      background-color: #2980b9;
    }
    
    /* Form Styling */
    .booking-container {
      background: white;
      border-radius: 10px;
      box-shadow: var(--box-shadow);
      padding: 40px;
      margin: 50px auto;
      max-width: 800px;
    }
    
    .booking-header {
      text-align: center;
      margin-bottom: 30px;
    }
    
    .booking-form .form-group {
      margin-bottom: 20px;
    }
    
    .booking-form label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      color: var(--dark-color);
    }
    
    .booking-form input,
    .booking-form select,
    .booking-form textarea {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 16px;
      transition: border-color 0.3s ease;
    }
    
    .booking-form input:focus,
    .booking-form select:focus,
    .booking-form textarea:focus {
      border-color: var(--accent-color);
      outline: none;
    }
    
    .btn-submit {
      background-color: var(--primary-color);
      color: white;
      border: none;
      padding: 12px 30px;
      border-radius: 5px;
      font-weight: bold;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      width: 100%;
      margin-top: 20px;
    }
    
    .btn-submit:hover {
      background-color: #1a2530;
    }
    
    /* Alert styling */
    .alert {
      position: fixed;
      top: 20px;
      right: 20px;
      padding: 15px 25px;
      border-radius: 5px;
      color: white;
      font-weight: bold;
      z-index: 1000;
      transform: translateX(120%);
      transition: transform 0.3s ease;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    
    .alert.show {
      transform: translateX(0);
    }
    
    .alert-success {
      background-color: var(--success-color);
    }
    
    .alert-error {
      background-color: var(--secondary-color);
    }
    
    /* Footer */
    footer {
      background-color: #222;
      color: white;
      padding: 40px 0 20px;
      margin-top: 50px;
    }
    
    .footer-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 20px;
    }
    
    .footer-content {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 40px;
      margin-bottom: 40px;
    }
    
    .footer-column h3 {
      font-size: 1.3rem;
      margin-bottom: 20px;
      color: var(--accent-color);
      position: relative;
      padding-bottom: 10px;
    }
    
    .footer-column h3::after {
      content: "";
      position: absolute;
      bottom: 0;
      left: 0;
      width: 40px;
      height: 2px;
      background-color: var(--accent-color);
    }
    
    .footer-links {
      list-style: none;
    }
    
    .footer-links li {
      margin-bottom: 10px;
    }
    
    .footer-links a {
      color: #bbb;
      text-decoration: none;
      transition: var(--transition);
      display: inline-block;
    }
    
    .footer-links a:hover {
      color: var(--accent-color);
      transform: translateX(5px);
    }
    
    .footer-bottom {
      border-top: 1px solid #444;
      padding-top: 20px;
      text-align: center;
      color: #bbb;
      font-size: 0.9rem;
    }
    
    /* Responsive Styles */
    @media (max-width: 768px) {
      nav ul {
        position: fixed;
        top: 80px;
        left: -100%;
        width: 80%;
        height: calc(100vh - 80px);
        background-color: white;
        flex-direction: column;
        align-items: flex-start;
        padding: 40px 20px;
        transition: 0.5s;
        box-shadow: 5px 0 15px rgba(0, 0, 0, 0.1);
        z-index: 999;
      }
      
      nav ul.active {
        left: 0;
      }
      
      nav li {
        margin: 15px 0;
        width: 100%;
      }
      
      nav a {
        width: 100%;
        padding: 10px;
      }
      
      .hamburger {
        display: block;
      }
      
      .booking-container {
        padding: 30px 20px;
      }
      
      .footer-content {
        grid-template-columns: 1fr;
      }
      
      .footer-column h3::after {
        left: 0;
      }
    }
    
    @media (max-width: 576px) {
      .service-header h1 {
        font-size: 2rem;
      }
      
      .service-card {
        padding: 20px;
      }
      
      .booking-header h2 {
        font-size: 1.5rem;
      }
    }
  </style>
</head>

<body>
  <!-- Header -->
  <header id="header">
    <div class="header-container">
      <div class="logo-section">
        <img src="pictures/123.jpg" alt="Sithruwana Tyre Mart Logo">
        <h1>Sithruwana Tyre Mart</h1>
      </div>
      <nav>
        <ul id="nav-menu">
          <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
          <li><a href="ProductServlet"><i class="fas fa-tags"></i> Products</a></li>
          <li><a href="service.jsp" class="active"><i class="fas fa-cogs"></i> Services</a></li>
          <li><a href="CartServlet"><i class="fas fa-shopping-cart"></i> Cart</a></li>
          <% if(session.getAttribute("username") != null) { %>
            <li><a href="ProfileServlet"><i class="fas fa-user-circle"></i> Profile</a></li>
            <li><a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
          <% } else { %>
            <li><a href="login.jsp"><i class="fas fa-user"></i> Login</a></li>
            <li><a href="register.jsp"><i class="fas fa-user-plus"></i> Sign Up</a></li>
          <% } %>
        </ul>
        <button class="hamburger" id="hamburger">
          <i class="fas fa-bars"></i>
        </button>
      </nav>
    </div>
  </header>

  <div class="container">
    <!-- Service Dashboard Section -->
    <div class="service-dashboard">
      <div class="service-header">
        <h1>Vehicle Service Center</h1>
        <p>Professional tyre and vehicle maintenance services</p>
      </div>

      <div class="service-cards">
        <div class="service-card">
          <div class="icon"><i class="fas fa-cog"></i></div>
          <h3>Tyre Replacement</h3>
          <p>Professional fitting of new tyres with computerized balancing</p>
          <button class="btn-book" data-service="tyre-replacement">Book Now</button>
        </div>

        <div class="service-card">
          <div class="icon"><i class="fas fa-sync"></i></div>
          <h3>Wheel Alignment</h3>
          <p>Precision alignment to improve handling and tyre life</p>
          <button class="btn-book" data-service="wheel-alignment">Book Now</button>
        </div>

        <div class="service-card">
          <div class="icon"><i class="fas fa-car"></i></div>
          <h3>Full Vehicle Service</h3>
          <p>Comprehensive maintenance package for your vehicle</p>
          <button class="btn-book" data-service="full-service">Book Now</button>
        </div>
      </div>
    </div>

    <!-- Service Booking Form Section -->
    <div class="booking-container" id="booking-form">
      <div class="booking-header">
        <h2>Schedule Your Service Appointment</h2>
        <p>Book your preferred time slot for vehicle servicing</p>
      </div>

      <form class="booking-form" id="service-booking-form">
        <div class="form-group">
          <label for="vehicle-type">Vehicle Type</label>
          <select id="vehicle-type" name="vehicleType" required>
            <option value="">Select Vehicle Type</option>
            <option value="sedan">Sedan</option>
            <option value="suv">SUV</option>
            <option value="truck">Truck</option>
            <option value="motorcycle">Motorcycle</option>
          </select>
        </div>

        <div class="form-group">
          <label for="vehicle-model">Vehicle Model</label>
          <input type="text" id="vehicle-model" name="vehicleModel" placeholder="e.g., Toyota Corolla" required>
        </div>

        <div class="form-group">
          <label for="vehicle-number">Vehicle Number</label>
          <input type="text" id="vehicle-number" name="vehicleNumber" placeholder="e.g., ABC-1234" required>
        </div>

        <div class="form-group">
          <label for="service-type">Service Required</label>
          <select id="service-type" name="serviceType" required>
            <option value="">Select Service</option>
            <option value="tyre-replacement">Tyre Replacement</option>
            <option value="wheel-alignment">Wheel Alignment</option>
            <option value="full-service">Full Vehicle Service</option>
            <option value="custom">Custom Service</option>
          </select>
        </div>

        <div class="form-group">
          <label for="service-date">Preferred Date</label>
          <input type="date" id="service-date" name="serviceDate" required>
        </div>

        <div class="form-group">
          <label for="service-time">Preferred Time</label>
          <select id="service-time" name="serviceTime" required>
            <option value="">Select Time Slot</option>
            <option value="morning">9:00 AM - 12:00 PM</option>
            <option value="afternoon">1:00 PM - 4:00 PM</option>
            <option value="evening">4:00 PM - 7:00 PM</option>
          </select>
        </div>

        <div class="form-group">
          <label for="additional-notes">Additional Notes</label>
          <textarea id="additional-notes" name="additionalNotes" rows="4" placeholder="Please provide any additional details about your service needs"></textarea>
        </div>

        <button type="submit" class="btn-submit">Submit Service Request</button>
      </form>
    </div>
  </div>

  <!-- Footer -->
  <footer>
    <div class="footer-container">
      <div class="footer-content">
        <div class="footer-column">
          <h3>Quick Links</h3>
          <ul class="footer-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="ProductServlet">Products</a></li>
            <li><a href="ServiceServlet">Services</a></li>
            <li><a href="CartServlet">Cart</a></li>
            <% if(session.getAttribute("username") != null) { %>
              <li><a href="ProfileServlet">Profile</a></li>
              <li><a href="LogoutServlet">Logout</a></li>
            <% } else { %>
              <li><a href="login.jsp">Login</a></li>
              <li><a href="register.jsp">Sign Up</a></li>
            <% } %>
          </ul>
        </div>
        <div class="footer-column">
          <h3>Business Hours</h3>
          <p style="color: #bbb; margin-bottom: 10px">Monday - Friday: 8:00 AM - 6:00 PM</p>
          <p style="color: #bbb; margin-bottom: 10px">Saturday: 9:00 AM - 5:00 PM</p>
          <p style="color: #bbb; margin-bottom: 10px">Sunday: Closed</p>
        </div>
        <div class="footer-column">
          <h3>Location</h3>
          <p style="color: #bbb; margin-bottom: 10px">No-177, Galle Rd, Beruwala, Colombo, Sri Lanka</p>
          <p style="color: #bbb; margin-bottom: 10px">Phone: 0342278240</p>
          <p style="color: #bbb; margin-bottom: 10px">Email: Sithuruwana.tyremart@gmail.com</p>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; 2025 Sithruwana Tyre Mart (Pvt) Ltd. All rights reserved.</p>
      </div>
    </div>
  </footer>

  <script>
    document.addEventListener("DOMContentLoaded", function() {
      // Mobile menu toggle
      const hamburger = document.getElementById("hamburger");
      const navMenu = document.getElementById("nav-menu");
      
      if (hamburger) {
        hamburger.addEventListener("click", function() {
          navMenu.classList.toggle("active");
        });
      }
      
      // Header scroll effect
      window.addEventListener("scroll", function() {
        const header = document.getElementById("header");
        if (window.scrollY > 50) {
          header.classList.add("scrolled");
        } else {
          header.classList.remove("scrolled");
        }
      });
      
      // Set minimum date for service booking
      const serviceDateInput = document.getElementById("service-date");
      if (serviceDateInput) {
        const tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);
        serviceDateInput.min = tomorrow.toISOString().split("T")[0];
      }
      
      // Service Booking Form Validation
      const bookingForm = document.getElementById("service-booking-form");
      
      if (bookingForm) {
        bookingForm.addEventListener("submit", function(e) {
          e.preventDefault();
          
          // Get form values
          const vehicleType = document.getElementById("vehicle-type").value;
          const vehicleModel = document.getElementById("vehicle-model").value;
          const vehicleNumber = document.getElementById("vehicle-number").value;
          const serviceType = document.getElementById("service-type").value;
          const serviceDate = document.getElementById("service-date").value;
          const serviceTime = document.getElementById("service-time").value;
          
          // Validate form
          if (!vehicleType || !vehicleModel || !vehicleNumber || !serviceType || !serviceDate || !serviceTime) {
            showAlert("Please fill in all required fields", "error");
            return;
          }
          
          // Form is valid, proceed with submission
          submitServiceRequest({
            vehicleType,
            vehicleModel,
            vehicleNumber,
            serviceType,
            serviceDate,
            serviceTime,
            notes: document.getElementById("additional-notes").value
          });
        });
      }
      
      // Service card booking buttons
      const bookButtons = document.querySelectorAll(".btn-book");
      bookButtons.forEach(button => {
        button.addEventListener("click", function() {
          const serviceType = this.getAttribute("data-service");
          document.getElementById("service-type").value = serviceType;
          document.getElementById("booking-form").scrollIntoView({ behavior: "smooth" });
        });
      });
    });
    
    // Helper functions
    function showAlert(message, type) {
      const alertDiv = document.createElement("div");
      alertDiv.className = `alert alert-${type}`;
      alertDiv.textContent = message;
      
      document.body.appendChild(alertDiv);
      
      setTimeout(() => {
        alertDiv.classList.add("show");
      }, 10);
      
      setTimeout(() => {
        alertDiv.classList.remove("show");
        setTimeout(() => {
          document.body.removeChild(alertDiv);
        }, 300);
      }, 3000);
    }
    
    function submitServiceRequest(formData) {
      // Show loading state
      const submitButton = document.querySelector(".btn-submit");
      const originalText = submitButton.textContent;
      submitButton.textContent = "Processing...";
      submitButton.disabled = true;
      
      // In a real application, this would be an AJAX call to your backend
      // For demonstration, we're simulating the API call
      setTimeout(() => {
        submitButton.textContent = originalText;
        submitButton.disabled = false;
        
        // Generate a random request ID
        const requestId = "SR" + Math.floor(10000 + Math.random() * 90000);
        
        // Show success message
        showAlert(`Service request submitted successfully! Your request ID is ${requestId}`, "success");
        
        // Reset form
        document.getElementById("service-booking-form").reset();
      }, 1500);
    }
  </script>
</body>
</html>
