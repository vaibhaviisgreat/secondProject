
    <%@ page import="java.sql.*"%>
    <%@ page import="com.connection.DatabaseConnection"%>
<html>
<head>
    <meta charset="utf-8">
    <title>Buyer's Homepage</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
  

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">


    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
<!--    <style>
        .twooptions{
            display: flex;
            justify-content: center;
            margin-top: 3px;
           
            
         }
         .switch{
            height: 25px;
            width: 50px;
            position: relative;
            display: inline-block;
            margin:0 10px;
            padding: 4px;
            

         }
         .slider{
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 30px; 

         }
         .switch input{display: none}

         .slider::before{
            position: absolute;
            content: "";
            height: 20.5px;
            width: 20px;
            left: 2.5px;
            bottom: 2px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
         }
         .checkbox:checked + .slider
         {
            background-color: skyblue;
         }

         .checkbox:checked + .slider::before
         {
            transform: translateX(25px);
         }
    </style>-->
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block" style="max-width: 35%;">
                <div class="d-inline-flex align-items-center" style="margin-right: auto !important">
                    <a class="text-dark" href="">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Help</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Support</a>
                </div>
            </div>
<% 
  // get the value stored in the session for the attribute name "username"
  String useremail = (String) session.getAttribute("email");
%>

<!--            <div class="twooptions">
                <p><b style="color: purple;">Want to BUY Book</b></p>
                <label class="switch" >
                    <input class="checkbox" id="check" type="checkbox">
                    <span class="slider"></span>
                </label>
                <p><b style="color:purple;">Want to SELL Book</b></p>
            </div>-->
            <div class="col-lg-6 text-center text-lg-right" style="max-width: 30%; margin-left: auto">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div> 
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">Book</span>Shelf</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">
                <a href="" class="btn border">
                    <i class="fas fa-heart text-primary"></i>
                    <span class="badge">0</span>
                </a>
                <a href="" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge">0</span>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid mb-5">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Categories</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                   <%
                       
                    ResultSet catname = DatabaseConnection.getResultFromSqlQuery("select * from cate");
                    while (catname.next()) {
                   %>  
                        
                        <a href="books.jsp?idCategory=<%= catname.getString("cat_name") %>" class="nav-item nav-link"><%= catname.getString("cat_name") %></a>
                  <%
                    }
                  %>      
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="index.jsp" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.jsp" class="nav-item nav-link active">Home</a>
                            <a href="books.jsp" class="nav-item nav-link">Books</a>
                            <!--<a href="books.jsp" class="nav-item nav-link">Free Books</a>-->
                            <a href="book-details" class="nav-item nav-link">My Orders</a>
                            <!-- <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                    <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                    <a href="checkout.html" class="dropdown-item">Checkout</a>
                                </div>
                            </div> -->
                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                        </div>
                <%
                    ResultSet lo = DatabaseConnection.getResultFromSqlQuery("select * from registration");
                    while (lo.next()) {
                %>
                        <div class="navbar-nav ml-auto py-0">
 <%
     if(useremail==null){
 %>                        
                            <a href="log-in.jsp" class="nav-item nav-link">Login</a>
                            <a href="sign-up.jsp" class="nav-item nav-link">Register</a>
  <%
      }else{
  %>                
                            <a href="logout.jsp?idLogout=<%= lo.getString("reg_id") %>" class="nav-item nav-link">Logout</a>
  <%
      }
  %>                    
                        </div>
                <%
                    }
                %>            
                    </div>
                </nav>
