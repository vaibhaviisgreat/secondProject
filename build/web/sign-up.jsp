
<title>Registration</title>
<%@include file="header.jsp" %>
                <div class="post">
                    <div class="heading">
                        <P style="font-size: larger;"><b>Registration</b></P>
                    </div>
                    <div class="form-for-book">
                        <div class="row px-xl-5">
                            <div class="col-lg-7 mb-5">
                                <div class="contact-form">
                                    <div id="success"></div>
                                
                                    <form name="sentMessage" role="form" action="./userSignin" method="post">
                                        <div class="control-group">
                                            <input type="text" class="form-control" id="fname" name="fname" placeholder="First Name"
                                                required="required" data-validation-required-message="Please enter your First Name" />
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name"
                                                required="required" data-validation-required-message="Please enter your last name" />
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <lable>Gender : </lable>
                                            <input type="radio" id="male" value="male" name="gender" /> Male
                                            <input type="radio" id="female" value="female" name="gender"/> Female

                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <input type="text" class="form-control" id="dob" name="dob" placeholder="Date of Birth"
                                                required="required"
                                                data-validation-required-message="Please add your birth date"/>
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <input type="text" class="form-control" name="contact" id="contactno" placeholder="Contact No."
                                                required="required" data-validation-required-message="Please enter your Contact Number" />
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <input type="email" class="form-control" name="email" id="emailid" placeholder="Email ID"
                                                required="required" data-validation-required-message="Please enter your Email Id" />
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <textarea class="form-control" rows="6" name="address" id="address" placeholder="Address"
                                                required="required"
                                                data-validation-required-message="Please enter your address"></textarea>
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <input type="text" class="form-control" id="city" name="city"e placeholder="City Name"
                                                required="required"
                                                data-validation-required-message="Please add your city name"/>
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Pincode"
                                                required="required" data-validation-required-message="Please enter your pincode number" />
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        <div class="control-group">
                                            <input type="password" class="form-control " id="password" name="password" placeholder="Enter Password"
                                                required="required" data-validation-required-message="Please set a Password" />
                                            <p class="help-block text-danger"></p>
                                        </div>
                                        
                                        <div>
                                            <button class="btn btn-primary py-2 px-4" type="submit">SUBMIT 
                                                </button>
                                        </div>
                                        <p class="help-block text-danger" style="padding-top: 20px ">
                                            <a href="log-in.jsp">Existing Customer? Log In</a>
                                        </p> 
                                    </form>
                                </div>
                            </div>


                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Navbar End -->
<%@include file="footer.jsp" %> 