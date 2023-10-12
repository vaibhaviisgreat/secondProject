<title>Add Book</title>
<%@ page language="java"%>
<%@include file="header.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.DatabaseConnection"%>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Form Layouts</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Manage Books</li>
          <li class="breadcrumb-item active">Add Book</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Add Book</h5>

              <!-- No Labels Form -->
              <form class="row g-3" role ="form" action="../addBook" method="post" enctype="multipart/form-data">
                <div class="col-md-12">  
                     <select name="category" class="form-control" aria-label="label for the select" >
                         <option>Select Category</option>
               <%
                    ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from cate");
                    while (rs.next()) {
                %>                    
                        <option value="<%=rs.getString("cat_name")%>"><%=rs.getString("cat_name")%></option>
                <%
                   }
                %>
                    </select> 
                </div>     
                <div class="col-md-12">
                    <input type="text" class="form-control" placeholder="Book Name" name="bname" required/>
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control" placeholder="Author Name" name="aname" required/>
                </div>
                <div class="col-md-6">
                    <input type="text" class="form-control" placeholder="Price" name="price" required/>
                </div>
<!--                <div class="col-12">
                    <input type="file" class="form-control" placeholder="Photos" name="photo" />
                </div>-->
                <div class="col-12">
                    <input type="text" class="form-control" placeholder="Quantity of Book" name="quantity"/>
                </div>    
                
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
              </form><!-- End No Labels Form -->
            </div>
          </div>


           

        </div>
      </div>
    </section>

  </main><!-- End #main --> 

<%@include file="footer.jsp" %>
