
<title>Checkout</title>
<%@include file="header.jsp" %>
    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Checkout</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

<%
    String idCheckout = request.getParameter("idCheckout");
%>
    <!-- Checkout Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <input class="form-control" type="text" placeholder="John">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <input class="form-control" type="text" placeholder="Doe">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input class="form-control" type="text" placeholder="example@email.com">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <input class="form-control" type="text" placeholder="+123 456 789">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <input class="form-control" type="text" placeholder="123 Street">
                        </div>
                     
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <input class="form-control" type="text" placeholder="New York">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Pincode Code</label>
                            <input class="form-control" type="text" placeholder="123">
                        </div>
                        
                        
                    </div>
                </div>
                <div class="collapse mb-4" id="shipping-address">
                    <h4 class="font-weight-semi-bold mb-4">Shipping Address</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <input class="form-control" type="text" placeholder="John">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <input class="form-control" type="text" placeholder="Doe">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input class="form-control" type="text" placeholder="example@email.com">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <input class="form-control" type="text" placeholder="+123 456 789">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <input class="form-control" type="text" placeholder="123 Street">
                        </div>
                       
                       
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <input class="form-control" type="text" placeholder="New York">
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <label>Pincode Code</label>
                            <input class="form-control" type="text" placeholder="123">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">Book</h5>
                        <div class="d-flex justify-content-between">
                <%
                    String idd = request.getParameter("idCheckout");
                    ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select * from adminbook where book_id = "+idd);
                    while (rs.next()) {
                %> 
                            <p><%= rs.getString("book_name") %></p>
                            <p><span>&#8377;</span><%= rs.getString("book_price") %></p>
                           
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold"><span>&#8377;</span><%= rs.getString("book_price") %></h5>
                            <input type="text" value="<%= rs.getString("book_price") %>" id="amt" hidden>
                            <input type="text" value="<%= (idCheckout) %>" id="idCheckout" hidden >
                            
                            
                        </div>
                    </div>
                <%
                    }
                %>        
                </div>
                
                    <div class="card-footer border-secondary bg-transparent">
                        <button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" onclick="payment()">Place Order</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        function payment(){
            const randomNum = Math.floor(100000 + Math.random() * 900000);
        var h = $("#idCheckout").val();
        alert(h);
        var amt = $("#amt").val();
		var name = "Akshar";
		//alert(amt);
     //var email = $("#idLogout").val();
     var email="aks@gmail.com";
		//alert(no);
       // var total = amt * no;
      //  var totalAmount = $("#total").val();;

        var merchant_total = amt*100;

        var merchant_order_id = "123";
        var currency_code_id = "INR";
        var options = {
            "key": "rzp_test_svDjV0nje7aVz8",
            "amount": merchant_total, // 2000 paise = INR 20
            "name": "Book Shelf",
            "description": "Paymnet of Purchase Book ",

            "currency": "INR",
            "netbanking": true,
            prefill: {
                name: name,
                email: email,
                contact: 9898989898,

            },
            notes: {
                soolegal_order_id: merchant_order_id,
            },
            "handler": function (response) {

       
alert("Payment Success");

 //response. sendRedirect(index.jsp);
 window.location.replace("index.jsp); 
            



            },

            "theme": {
                "color": "#528FF0"
            }
        };

        var rzp1 = new Razorpay(options);
        rzp1.open();


    }
       
    </script>
<%@include file="footer.jsp" %>