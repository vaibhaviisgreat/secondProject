
<title>Add Category</title>
<%@include file="header.jsp" %>

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Form Layouts</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Manage Books</li>
          <li class="breadcrumb-item active">Add Category</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Add Category</h5>

              <!-- No Labels Form -->
              <form class="row g-3" action="../addCategory" method="post">
                <div class="col-md-9">
                    <input type="text" class="form-control" placeholder="Category Name" name="categoryname">
                </div>
                <div class="col-md-9">
                    <textarea class="form-control" id="description" style="height: 100px" placeholder="Description" name="descrip"></textarea>

                </div>
                
                
                <div class="text-center">
                  <button type="submit" class="btn btn-primary">Submit</button>
                  
                </div>
              </form><!-- End No Labels Form -->
            </div>
          </div>


           

        </div>
      </div>
    </section>

  </main><!-- End #main --> 

<%@include file="footer.jsp" %>
