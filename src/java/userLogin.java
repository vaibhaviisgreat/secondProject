
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

@WebServlet("/userLogin")
public class userLogin extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Getting all the parameters from the frontend (admin)
            String uemailid = request.getParameter("uemailid");
            String upassword = request.getParameter("upassword");
            
            System.out.println("user_email is :"+uemailid);
            System.out.println("user_password is :"+upassword);

            //Retriving our session
            HttpSession hs = request.getSession();

            //Calling Connection method
            Connection con = DatabaseConnection.getConnection();

            //Creating Statement
            Statement st = con.createStatement();

            //Querying inside the database
            ResultSet resultset = st.executeQuery("select * from registration where email='" + uemailid + "' AND password='" + upassword + "'");
            //If all the details are correct
            if (resultset.next()) {
                System.out.println("Inside result set and if cond..."+uemailid);
                hs.setAttribute("uname", resultset.getString("f_name"));
                hs.setAttribute("email", uemailid);
                //Redirecting admin to dashboard page
                response.sendRedirect("index.jsp");

            } else {
                //If details are wrongS
                String message = "You have enter wrong credentials";
                System.out.println("Inside else..."+uemailid);
                hs.setAttribute("credential", message);
                //Redirecting admin to admin login page
                response.sendRedirect("log-in.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}