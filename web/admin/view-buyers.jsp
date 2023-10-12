
<title>View Buyers</title>
<%@include file="header.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>General Tables</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Manage Buyers</li>
          <li class="breadcrumb-item active">View Buyers</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6" style="width: 80%;">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Sellers</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Register ID</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Gender</th>
                    
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>Brandon Jacob</td>
                    <td>Designer</td>
                    
                    <td>2016-05-25</td>
                  </tr>
                  
                  
                 
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>

          

        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <%@include file="footer.jsp" %>