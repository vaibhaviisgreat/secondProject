
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

@WebServlet("/addCategory")
public class addCategory extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Retrieving values from the frontend
        String categoryname = request.getParameter("categoryname");
        String descrip = request.getParameter("descrip");
        
        System.out.println("cat_name is :"+categoryname);
        System.out.println("description is :"+descrip);
        

        //Creating Session
        HttpSession hs = request.getSession();

        //Inserting all values inside the database
        try {
            //Connecting database connection and querying in the database
            int addCate = DatabaseConnection.insertUpdateFromSqlQuery("insert into cate(cat_name,description)values('" + categoryname + "','" + descrip + "')");

            //If customer registered successfully
            if (addCate > 0) {
                String message = "Category added successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("admin/index.jsp");
            } else {
                //If customer fails to register 
                String message = "Category is not successfully";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("admin/add-category.jsp");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
