
<title>View Books</title>
<%@include file="header.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
  <main id="main" class="main">

    <div class="pagetitle">
      <h1>General Tables</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Manage Books</li>
          <li class="breadcrumb-item active">View Books</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-6" style="width: 80%;">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">BOOKS</h5>

              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Book ID</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author Name</th>
                    <th scope="col">Price</th>
<!--                    <th scope="col">Photos</th>
                    <th scope="col">Book Status</th>-->
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <%
                    ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from adminbook");
                    while (rs.next()) {
                   %>    
                  <tr>
                    <th scope="row"><%= rs.getString("book_id") %></th>
                    <td><%= rs.getString("book_name") %></td>
                    <td><%= rs.getString("author_name")%></td>
                    <td><%= rs.getString("book_price") %></td>
                  </tr>
                   <%
                    }
                  %>    
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