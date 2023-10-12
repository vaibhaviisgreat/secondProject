
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>


<title>Log In</title>
<%@include file="header.jsp" %>
                <div class="post">
                    <div class="heading">
                        <P style="font-size: larger;"><b>Log In</b></P>
                    </div>
                    <div class="form-for-book">
                        <div class="row px-xl-5">
                            <div class="col-lg-7 mb-5">
                                <div class="contact-form">
                                    <div id="success"></div>

                                    <form action="./userLogin" method="post">
                                       
                                       
                                        <div class="control-group">
                                            <input type="email" class="form-control" id="emailid" name="uemailid" placeholder="Email ID"
                                                required="required" />
                                            <p class="help-block text-danger"></p>
                                        </div>
                                       
                                       
                                        <div class="control-group">
                                            <input type="text" class="form-control " id="password" name="upassword" placeholder="Enter Password"
                                                required="required"/>
                                            <p class="help-block text-danger"></p>
                                        </div>
                                     
                                       
                                        <div>
                                            <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">SUBMIT</button> 
                                                
                                        </div>
                                      
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