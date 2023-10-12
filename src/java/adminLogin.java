
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

@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {

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
            String emailid = request.getParameter("emailid");
            String password = request.getParameter("password");
            
            System.out.println("email is :"+emailid);
            System.out.println("adm_pass is :"+password);

            //Retriving our session
            HttpSession hs = request.getSession();

            //Calling Connection method
            Connection con = DatabaseConnection.getConnection();

            //Creating Statement
            Statement st = con.createStatement();

            //Querying inside the database
            ResultSet resultset = st.executeQuery("select * from admin where email='" + emailid + "' AND adm_pass='" + password + "'");
            //If all the details are correct
            if (resultset.next()) {
                System.out.println("Inside result set and if cond..."+emailid);
//                hs.setAttribute("uname", resultset.getString("name"));
                //Redirecting admin to dashboard page
                response.sendRedirect("admin/index.jsp");

            } else {
                //If details are wrongS
                String message = "You have enter wrong credentials";
                System.out.println("Inside else..."+emailid);
                hs.setAttribute("credential", message);
                //Redirecting admin to admin login page
                response.sendRedirect("admin/admin-login.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}