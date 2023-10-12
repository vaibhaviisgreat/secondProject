
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet("/userSignin")
public class userSignin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Retrieving values from the frontend
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String password = request.getParameter("password");
      
        
        
        System.out.println("f_name is :"+fname);
        System.out.println("l_name is :"+lname);
        System.out.println("gender is :"+gender);
        System.out.println("dob is :"+dob);
        System.out.println("contact is :"+contact);
        System.out.println("email is :"+email);
        System.out.println("address is :"+address);
        System.out.println("city is :"+city);
        System.out.println("pincode is :"+pincode);
        System.out.println("password is :"+password);
        
        //Creating Session
        HttpSession hs = request.getSession();

        //Inserting all values inside the database
        try {
            //Connecting database connection and querying in the database
            int addUser = DatabaseConnection.insertUpdateFromSqlQuery("insert into registration(f_name,l_name,gender,dob,contact,email,address,city,pincode,password)values('" + fname + "','" + lname + "','" + gender + "','" + dob + "','" + contact + "','" + email + "','" + address + "','" + city + "','" + pincode + "','" + password + "')");

            //If customer registered successfully
            if (addUser > 0) {
                String message = "Registered successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("log-in.jsp");
            } else {
                //If customer fails to register 
                String message = "Registration Failed";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("sign-up.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
