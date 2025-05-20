<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sithruwana Tyre Mart</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
      /* General Styles */
      :root {
        --primary-color: #fa7501;
        --secondary-color: #333;
        --accent-color: #0056b3;
        --light-color: #f8f9fa;
        --dark-color: #212529;
        --text-color: #333;
        --text-light: #f8f9fa;
        --transition: all 0.3s ease;
        --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body,
      html {
        font-family: "Poppins", sans-serif;
        scroll-behavior: smooth;
        color: var(--text-color);
        overflow-x: hidden;
        background-color: #f5f5f5;
      }

      /* Custom Scrollbar */
      ::-webkit-scrollbar {
        width: 10px;
      }

      ::-webkit-scrollbar-track {
        background: #f1f1f1;
      }

      ::-webkit-scrollbar-thumb {
        background: var(--primary-color);
        border-radius: 5px;
      }

      ::-webkit-scrollbar-thumb:hover {
        background: #e06800;
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

      .logo-section img:hover {
        transform: scale(1.1);
      }

      .logo-section h1 {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary-color);
        margin: 0;
      }

      nav {
        background-color: transparent;
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
        box-shadow: 0 4px 8px rgba(250, 117, 1, 0.3);
      }

      nav a.active {
        background-color: var(--primary-color);
        color: white;
      }

      nav img {
        width: 20px;
        height: 20px;
        margin-right: 8px;
      }

      .hamburger {
        display: none;
        cursor: pointer;
        background: none;
        border: none;
        font-size: 1.5rem;
        color: var(--primary-color);
      }

      /* Main Banner Styles */
      .main-banner {
        position: relative;
        height: 100vh;
        overflow: hidden;
        margin-top: 80px;
      }

      .main-banner img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        filter: brightness(0.7);
        transition: transform 10s ease;
      }

      .main-banner:hover img {
        transform: scale(1.1);
      }

      .banner-text {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        width: 100%;
        padding: 0 20px;
      }

      .banner-text h2 {
        font-size: 4rem;
        font-weight: 700;
        color: white;
        text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
        margin-bottom: 20px;
        opacity: 0;
        animation: fadeInUp 1s ease forwards 0.5s;
      }

      .banner-text p {
        font-size: 1.2rem;
        color: white;
        max-width: 800px;
        margin: 0 auto 30px;
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8);
        opacity: 0;
        animation: fadeInUp 1s ease forwards 0.8s;
      }

      .banner-btn {
        display: inline-block;
        padding: 12px 30px;
        background-color: var(--primary-color);
        color: white;
        text-decoration: none;
        border-radius: 50px;
        font-weight: 500;
        transition: var(--transition);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        opacity: 0;
        animation: fadeInUp 1s ease forwards 1.1s;
      }

      .banner-btn:hover {
        background-color: #e06800;
        transform: translateY(-5px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
      }

      /* Welcome Section */
      .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
      }

      .section {
        padding: 60px 30px;
        margin: 40px 0;
        background: white;
        border-radius: 15px;
        box-shadow: var(--box-shadow);
        transition: var(--transition);
      }

      .section:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
      }

      .section h2 {
        font-size: 2.2rem;
        margin-bottom: 30px;
        position: relative;
        display: inline-block;
        color: var(b);
      }

      .section h2::after {
        content: "";
        position: absolute;
        bottom: -10px;
        left: 0;
        width: 50%;
        height: 3px;
        background-color: var(--primary-color);
        border-radius: 2px;
      }

      .welcome-content {
        display: flex;
        align-items: center;
        gap: 30px;
      }

      .welcome-image {
        flex: 0 0 200px;
      }

      .welcome-image img {
        width: 100%;
        height: auto;
        border-radius: 10px;
        box-shadow: var(--box-shadow);
        transition: var(--transition);
      }

      .welcome-image img:hover {
        transform: scale(1.05);
      }

      .welcome-text {
        flex: 1;
      }

      .welcome-text p {
        line-height: 1.8;
        color: #666;
        text-align: justify;
        padding: 20px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        transition: var(--transition);
      }

      .welcome-text p:hover {
        background: #f8f8f8;
        color: #333;
        transform: translateY(-5px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      }

      /* Why Choose Us Section */
      .section-dark {
        background: linear-gradient(135deg, #333, #222);
        color: white;
      }

      .section-dark h2 {
        color: white;
      }

      .section-dark h2::after {
        background-color: var(--primary-color);
      }

      .why-choose-us {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        margin-top: 30px;
      }

      .why-choose-item {
        background: rgba(255, 255, 255, 0.1);
        border-radius: 10px;
        padding: 25px;
        transition: var(--transition);
        position: relative;
        overflow: hidden;
        z-index: 1;
      }

      .why-choose-item::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: var(--primary-color);
        z-index: -1;
        transform: scaleX(0);
        transform-origin: right;
        transition: transform 0.5s ease;
      }

      .why-choose-item:hover::before {
        transform: scaleX(1);
        transform-origin: left;
      }

      .why-choose-item:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
      }

      .why-choose-item h3 {
        font-size: 1.3rem;
        margin-bottom: 15px;
        color: var(--primary-color);
        transition: var(--transition);
      }

      .why-choose-item:hover h3 {
        color: white;
      }

      .why-choose-item p {
        color: #ddd;
        line-height: 1.6;
        transition: var(--transition);
      }

      .why-choose-item:hover p {
        color: white;
      }

      .why-choose-icon {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 15px;
        transition: var(--transition);
      }

      .why-choose-item:hover .why-choose-icon {
        color: white;
        transform: rotateY(360deg);
        transition: transform 0.8s ease, color 0.3s ease;
      }

      /* Services Section */
      .services-section {
        padding: 80px 20px;
        background-color: #f9f9f9;
      }

      .services-container {
        max-width: 1200px;
        margin: 0 auto;
      }

      .services-header {
        text-align: center;
        margin-bottom: 50px;
      }

      .services-header h2 {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 15px;
        position: relative;
        display: inline-block;
      }

      .services-header h2::after {
        content: "";
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background-color: var(--primary-color);
        border-radius: 2px;
      }

      .services-header p {
        max-width: 700px;
        margin: 0 auto;
        color: #666;
      }

      .services-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 30px;
      }

      .service-item {
        background: white;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: var(--box-shadow);
        transition: var(--transition);
        position: relative;
      }

      .service-item:hover {
        transform: translateY(-15px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
      }

      .service-img {
        position: relative;
        height: 250px;
        overflow: hidden;
      }

      .service-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: transform 0.5s ease;
      }

      .service-item:hover .service-img img {
        transform: scale(1.1);
      }

      .service-content {
        padding: 20px;
        text-align: center;
      }

      .service-content h3 {
        font-size: 1.3rem;
        margin-bottom: 10px;
        color: var(--primary-color);
      }

      .service-content p {
        color: #666;
        margin-bottom: 15px;
      }

      .service-btn {
        display: inline-block;
        padding: 8px 20px;
        background-color: var(--primary-color);
        color: white;
        text-decoration: none;
        border-radius: 50px;
        font-size: 0.9rem;
        transition: var(--transition);
      }

      .service-btn:hover {
        background-color: #e06800;
        transform: translateY(-3px);
      }

      /* Products Section */
      .products-section {
        padding: 80px 20px;
        background-color: white;
      }

      .products-container {
        max-width: 1200px;
        margin: 0 auto;
      }

      .products-header {
        text-align: center;
        margin-bottom: 50px;
      }

      .products-header h2 {
        font-size: 2.5rem;
        color: var(--primary-color);
        margin-bottom: 15px;
        position: relative;
        display: inline-block;
      }

      .products-header h2::after {
        content: "";
        position: absolute;
        bottom: -10px;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background-color: var(--primary-color);
        border-radius: 2px;
      }

      .products-header p {
        max-width: 700px;
        margin: 0 auto;
        color: #666;
      }

      .products-carousel {
        position: relative;
        overflow: hidden;
        padding: 20px 0;
      }

      .carousel-container {
        display: flex;
        transition: transform 0.5s ease;
      }

      .product-item {
        flex: 0 0 calc(20% - 20px);
        margin: 0 10px;
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: var(--box-shadow);
        transition: var(--transition);
        transform: scale(0.95);
      }

      .product-item.active {
        transform: scale(1);
      }

      .product-item:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
      }

      .product-img {
        height: 180px;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        background: #f9f9f9;
      }

      .product-img img {
        max-width: 100%;
        max-height: 140px;
        transition: var(--transition);
      }

      .product-item:hover .product-img img {
        transform: scale(1.1);
      }

      .product-content {
        padding: 15px;
        text-align: center;
      }

      .product-content h3 {
        font-size: 1.2rem;
        margin-bottom: 5px;
        color: var(--primary-color);
      }

      .carousel-btn {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        width: 40px;
        height: 40px;
        background-color: var(--primary-color);
        color: white;
        border: none;
        border-radius: 50%;
        font-size: 1.2rem;
        cursor: pointer;
        z-index: 10;
        transition: var(--transition);
      }

      .carousel-btn:hover {
        background-color: #e06800;
      }

      .carousel-btn.prev {
        left: 10px;
      }

      .carousel-btn.next {
        right: 10px;
      }

      /* Footer */
      footer {
        background-color: #222;
        color: white;
        padding: 40px 0 20px;
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
        color: var(--primary-color);
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
        background-color: var(--primary-color);
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
        color: var(--primary-color);
        transform: translateX(5px);
      }

      .footer-bottom {
        border-top: 1px solid #444;
        padding-top: 20px;
        text-align: center;
        color: #bbb;
        font-size: 0.9rem;
      }

      /* Back to Top Button */
      .back-to-top {
        position: fixed;
        bottom: 30px;
        right: 30px;
        width: 50px;
        height: 50px;
        background-color: var(--primary-color);
        color: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
        cursor: pointer;
        opacity: 0;
        visibility: hidden;
        transition: var(--transition);
        z-index: 999;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
      }

      .back-to-top.show {
        opacity: 1;
        visibility: visible;
      }

      .back-to-top:hover {
        background-color: #e06800;
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
      }

      /* Animations */
      @keyframes fadeInUp {
        from {
          opacity: 0;
          transform: translateY(30px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @keyframes fadeIn {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }

      .fade-in {
        opacity: 0;
        animation: fadeIn 1s ease forwards;
      }

      .fade-in-up {
        opacity: 0;
        transform: translateY(30px);
        animation: fadeInUp 1s ease forwards;
      }

      /* Responsive Styles */
      @media (max-width: 992px) {
        .product-item {
          flex: 0 0 calc(33.333% - 20px);
        }
      }

      @media (max-width: 768px) {
        .banner-text h2 {
          font-size: 3rem;
        }

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

        .product-item {
          flex: 0 0 calc(50% - 20px);
        }

        .welcome-content {
          flex-direction: column;
          text-align: center;
        }

        .welcome-image {
          margin-bottom: 20px;
        }
      }

      @media (max-width: 576px) {
        .banner-text h2 {
          font-size: 2.5rem;
        }

        .banner-text p {
          font-size: 1rem;
        }

        .section {
          padding: 40px 20px;
        }

        .section h2 {
          font-size: 1.8rem;
        }

        .product-item {
          flex: 0 0 calc(100% - 20px);
        }

        .footer-content {
          grid-template-columns: 1fr;
          text-align: center;
        }

        .footer-column h3::after {
          left: 50%;
          transform: translateX(-50%);
        }

        .footer-links a:hover {
          transform: translateX(0) scale(1.05);
        }
      }
    </style>
  </head>
  <body>
    <!-- Header -->
    <header id="header">
      <div class="header-container">
        <div class="logo-section">
          <img src="pictures/123.jpg" alt="Sithruwana Tyre Mart Logo" />
          <h1>Sithruwana Tyre Mart</h1>
        </div>
        <nav>
          <ul id="nav-menu">
            <li>
              <a href="index.jsp" class="active"
                ><i class="fas fa-home"></i> Home</a
              >
            </li>
            <li>
              <a href="ProductServlet"><i class="fas fa-tags"></i> Products</a>
            </li>
            <li>
              <a href="service.jsp"><i class="fas fa-cogs"></i> Services</a>
            </li>
            <li>
              <a href="CartServlet"><i class="fas fa-shopping-cart"></i> Cart</a>
            </li>
            
            <% if(session.getAttribute("username") != null) { %>
            <li>
              <a href="ProfileServlet"><i class="fas fa-user-circle"></i> Profile</a>
            </li>
            <li>
              <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </li>
            <% } else { %>
            <li>
              <a href="login.jsp"><i class="fas fa-user"></i> Login</a>
            </li>
            <li>
              <a href="register.jsp"><i class="fas fa-user-plus"></i> Sign Up</a>
            </li>
            <% } %>
          </ul>
          <button class="hamburger" id="hamburger">
            <i class="fas fa-bars"></i>
          </button>
        </nav>
      </div>
    </header>

    <!-- Main Banner -->
    <section class="main-banner" id="home">
      <img src="pictures/main banner.jpg" alt="Tyre Banner" />
      <div class="banner-text">
        <h2>Premium Tyre Solutions</h2>
        <p>
          Your trusted partner for all tyre needs with over 30 years of
          experience
        </p>
        <a href="#services" class="banner-btn">Explore Our Services</a>
      </div>
    </section>

    <!-- Welcome Section -->
    <div class="container" id="about">
      <div class="section fade-in">
        <h2>Welcome to Sithruwana Tyre Mart</h2>
        <div class="welcome-content">
          <div class="welcome-image">
            <img src="pictures/123.jpg" alt="Sithruwana Tyre Mart" />
          </div>
          <div class="welcome-text">
            <p>
              "Sithruwana Tyre Mart" warmly welcomes you to its website, the
              ultimate destination which has solutions for all your tyre and
              tube needs. We have been catering to the needs of the clients for
              more than 30 years and our company is established in the industry
              as "People's trusted service". When it comes to the accurate tyre,
              tube and battery solutions for your automobile, "Sithruwana Tyre
              Mart" is the place you should choose, since it possesses decades
              of experience in the industry with the expertise knowledge. The
              company imports around 10 high quality tyres and tube brands from
              China, India, Turkey and Thailand. Apart from these high quality
              yet cost effective tyre solutions, it lets you have a range of
              automobile services including tyre retreading to enhance the
              performance of your vehicle. Contact "Sithruwana Tyre Mart" to
              have it all under one roof.
            </p>
          </div>
        </div>
      </div>

      <div class="section section-dark fade-in">
        <h2>Why Choose Us</h2>
        <div class="why-choose-us">
          <div class="why-choose-item">
            <div class="why-choose-icon">
              <i class="fas fa-award"></i>
            </div>
            <h3>Expertise</h3>
            <p>
              Since the company is more than 30 years old, it has experience in
              the service they render and are experts in tyres and tubes along
              with the field of automobiles. The professional team has the
              knowledge of catering to the actual requirements of the customers.
            </p>
          </div>
          <div class="why-choose-item">
            <div class="why-choose-icon">
              <i class="fas fa-headset"></i>
            </div>
            <h3>After Sales Service</h3>
            <p>
              We offer comprehensive after-sales service to ensure customer
              satisfaction. Our team is always ready to assist you with any
              issues or questions you might have after your purchase.
            </p>
          </div>
          <div class="why-choose-item">
            <div class="why-choose-icon">
              <i class="fas fa-check-circle"></i>
            </div>
            <h3>Quality</h3>
            <p>
              We provide high-quality tyres and tubes from reputable brands to
              ensure durability and performance. All our products are sourced
              directly from manufacturers to guarantee authenticity.
            </p>
          </div>
          <div class="why-choose-item">
            <div class="why-choose-icon">
              <i class="fas fa-users"></i>
            </div>
            <h3>The Team</h3>
            <p>
              Our team consists of experienced professionals dedicated to
              delivering the best service. With years of industry knowledge, we
              can provide expert advice for all your tyre needs.
            </p>
          </div>
          <div class="why-choose-item">
            <div class="why-choose-icon">
              <i class="fas fa-handshake"></i>
            </div>
            <h3>Professionalism</h3>
            <p>
              We maintain a high level of professionalism in all our
              interactions and services. Our commitment to excellence ensures
              that you receive the best possible experience.
            </p>
          </div>
        </div>
      </div>
    </div>

    <!-- Products Section -->
    <section class="products-section" id="products">
      <div class="products-container">
        <div class="products-header">
          <h2>Our Product Brands</h2>
          <p>
            We offer a wide selection of premium tyre brands to suit every
            vehicle and budget
          </p>
        </div>
        <div class="products-carousel">
          <button class="carousel-btn prev" id="prevBtn">
            <i class="fas fa-chevron-left"></i>
          </button>
          <div class="carousel-container" id="productCarousel">
            <div class="product-item">
              <div class="product-img">
                <img src="pictures/2111.png" alt="CEAT" />
              </div>
              <div class="product-content">
                <h3>CEAT</h3>
              </div>
            </div>
            <div class="product-item">
              <div class="product-img">
                <img src="pictures/2112.jpg" alt="DSI" />
              </div>
              <div class="product-content">
                <h3>DSI</h3>
              </div>
            </div>
            <div class="product-item">
              <div class="product-img">
                <img src="pictures/2113.jpg" alt="APOLLO" />
              </div>
              <div class="product-content">
                <h3>APOLLO</h3>
              </div>
            </div>
            <div class="product-item">
              <div class="product-img">
                <img src="pictures/2114.jpg" alt="DUNLOP" />
              </div>
              <div class="product-content">
                <h3>DUNLOP</h3>
              </div>
            </div>
            <div class="product-item">
              <div class="product-img">
                <img src="pictures/caltex-logo.png" alt="CALTEX" />
              </div>
              <div class="product-content">
                <h3>CALTEX</h3>
              </div>
            </div>
            <div class="product-item">
              <div class="product-img">
                <img src="pictures/Mobil-logo.png" alt="MOBIL" />
              </div>
              <div class="product-content">
                <h3>MOBIL</h3>
              </div>
            </div>
            <div class="product-item">
              <div class="product-img">
                <img src="pictures/maxxis.png" alt="MAXXIS" />
              </div>
              <div class="product-content">
                <h3>MAXXIS</h3>
              </div>
            </div>
            <div class="product-item">
              <div class="product-img">
                <img src="pictures/amaron.jpg" alt="AMARON" />
              </div>
              <div class="product-content">
                <h3>AMARON</h3>
              </div>
            </div>
          </div>
          <button class="carousel-btn next" id="nextBtn">
            <i class="fas fa-chevron-right"></i>
          </button>
        </div>
      </div>
    </section>

    <!-- Services Section -->
    <section class="services-section" id="services">
      <div class="services-container">
        <div class="services-header">
          <h2>Our Services</h2>
          <p>
            We offer a comprehensive range of services to keep your vehicle
            running smoothly
          </p>
        </div>
        <div class="services-grid">
          <div class="service-item fade-in-up">
            <div class="service-img">
              <img src="pictures/1114.jpg" alt="Tyre Retreading" />
            </div>
            <div class="service-content">
              <h3>Tyre Repair</h3>
              <p>
                Extend the life of your tyres with our professional retreading
                service. Cost-effective and environmentally friendly.
              </p>
            </div>
          </div>
          <div class="service-item fade-in-up">
            <div class="service-img">
              <img src="pictures/1115.jpg" alt="Alloy Wheels" />
            </div>
            <div class="service-content">
              <h3>Rims and Wheels</h3>
              <p>
                Upgrade your vehicle's appearance and performance with our
                premium range of alloy wheels.
              </p>
            </div>
          </div>
          <div class="service-item fade-in-up">
            <div class="service-img">
              <img src="pictures/1116.jpg" alt="Mobile Service" />
            </div>
            <div class="service-content">
              <h3>Mobile Service</h3>
              <p>
                Can't come to us? We'll come to you! Our mobile service brings
                professional tyre care to your location.
              </p>
            </div>
          </div>
          <div class="service-item fade-in-up">
            <div class="service-img">
              <img src="pictures/lubri.png" alt="Lubricants and Oil" />
            </div>
            <div class="service-content">
              <h3>Lubricants and Oil</h3>
              <p>ELEVATE YOUR MACHINERY'S POTENTIAL</p>
            </div>
          </div>
          <div class="service-item fade-in-up">
            <div class="service-img">
              <img
                src="pictures/Fitting_Car_Battery_BG_770x470.jpg"
                alt="Battery Replacements"
              />
            </div>
            <div class="service-content">
              <h3>Battery Replacements</h3>
              <p>
                Quick and reliable battery replacement service with high-quality
                batteries for all vehicle types.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

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
            <p style="color: #bbb; margin-bottom: 10px">
              Monday - Friday: 8:00 AM - 6:00 PM
            </p>
            <p style="color: #bbb; margin-bottom: 10px">
              Saturday: 9:00 AM - 5:00 PM
            </p>
            <p style="color: #bbb; margin-bottom: 10px">Sunday: Closed</p>
          </div>
          <div class="footer-column">
            <h3>Location</h3>
            <p style="color: #bbb; margin-bottom: 10px">
              No-177, Galle Rd, Beruwala, Colombo, Sri Lanka
            </p>
            <p style="color: #bbb; margin-bottom: 10px">Phone: 0342278240</p>
            <p style="color: #bbb; margin-bottom: 10px">
              Email: Sithuruwana.tyremart@gmail.com
            </p>
          </div>
        </div>
        <div class="footer-bottom">
          <p>
            &copy; 2025 Sithruwana Tyre Mart (Pvt) Ltd. All rights reserved.
          </p>
        </div>
      </div>
    </footer>

    <!-- Back to Top Button -->
    <div class="back-to-top" id="backToTop">
      <i class="fas fa-arrow-up"></i>
    </div>

    <!-- JavaScript -->
    <script>
      // DOM Elements
      const header = document.getElementById("header");
      const hamburger = document.getElementById("hamburger");
      const navMenu = document.getElementById("nav-menu");
      const navLinks = document.querySelectorAll("nav a");
      const backToTop = document.getElementById("backToTop");
      const productCarousel = document.getElementById("productCarousel");
      const prevBtn = document.getElementById("prevBtn");
      const nextBtn = document.getElementById("nextBtn");
      const sections = document.querySelectorAll("section");
      const fadeElements = document.querySelectorAll(".fade-in, .fade-in-up");

      // Mobile Menu Toggle
      hamburger.addEventListener("click", () => {
        navMenu.classList.toggle("active");
        hamburger.innerHTML = navMenu.classList.contains("active")
          ? '<i class="fas fa-times"></i>'
          : '<i class="fas fa-bars"></i>';
      });

      // Close mobile menu when clicking on a link
      navLinks.forEach((link) => {
        link.addEventListener("click", () => {
          navMenu.classList.remove("active");
          hamburger.innerHTML = '<i class="fas fa-bars"></i>';
        });
      });

      // Scroll Events
      window.addEventListener("scroll", () => {
        // Header scroll effect
        if (window.scrollY > 100) {
          header.classList.add("scrolled");
        } else {
          header.classList.remove("scrolled");
        }

        // Back to top button visibility
        if (window.scrollY > 500) {
          backToTop.classList.add("show");
        } else {
          backToTop.classList.remove("show");
        }

        // Activate nav links based on scroll position
        let current = "";

        sections.forEach((section) => {
          const sectionTop = section.offsetTop - 100;
          const sectionHeight = section.clientHeight;

          if (
            window.scrollY >= sectionTop &&
            window.scrollY < sectionTop + sectionHeight
          ) {
            current = section.getAttribute("id");
          }
        });

        navLinks.forEach((link) => {
          link.classList.remove("active");
          if (link.getAttribute("href") === `#${current}`) {
            link.classList.add("active");
          }
        });

        // Animate elements on scroll
        fadeElements.forEach((element) => {
          const elementTop = element.getBoundingClientRect().top;
          const windowHeight = window.innerHeight;

          if (elementTop < windowHeight - 100) {
            element.style.animation = "fadeInUp 1s ease forwards";
          }
        });
      });

      // Back to top functionality
      backToTop.addEventListener("click", () => {
        window.scrollTo({
          top: 0,
          behavior: "smooth"
        });
      });

      // Product Carousel
      let currentIndex = 0;
      const itemWidth = document.querySelector(".product-item").offsetWidth + 20;
      const itemCount = document.querySelectorAll(".product-item").length;
      const visibleItems = window.innerWidth < 768 ? 1 : window.innerWidth < 992 ? 2 : 5;
      const maxIndex = itemCount - visibleItems;

      function updateCarousel() {
        productCarousel.style.transform = `translateX(-${currentIndex * itemWidth}px)`;
      }

      prevBtn.addEventListener("click", () => {
        currentIndex = Math.max(0, currentIndex - 1);
        updateCarousel();
      });

      nextBtn.addEventListener("click", () => {
        currentIndex = Math.min(maxIndex, currentIndex + 1);
        updateCarousel();
      });

      // Window resize event
      window.addEventListener("resize", () => {
        const newVisibleItems = window.innerWidth < 768 ? 1 : window.innerWidth < 992 ? 2 : 5;
        const newMaxIndex = itemCount - newVisibleItems;
        currentIndex = Math.min(newMaxIndex, currentIndex);
        updateCarousel();
      });
    </script>
  </body>
</html>
