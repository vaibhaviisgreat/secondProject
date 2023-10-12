
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

@WebServlet("/addBook")
public class addBook extends HttpServlet {

    String a = null;
    //Path where all the images are stored
   // private final String UPLOAD_DIRECTORY = "E:\\finalproject\\web\\admin\\assets\\photos\\products";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String category = request.getParameter("category");
//        String bname = request.getParameter("bname");
//        String aname = request.getParameter("aname");
//        String quantity = request.getParameter("quantity");
//        String price = request.getParameter("price");
        
        
        //Creating session
        HttpSession session = request.getSession();
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                //Taking all image requests
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String aname = null;
                String bname = null;
                String category =null;
//                String bookphoto;
                String price = null;
                String quantity = null;

                //SALTCHARS to generate unique code for product
                String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
                StringBuilder salt = new StringBuilder();
                Random rnd = new Random();
                while (salt.length() < 3) { // length of the random string.
                    int index = (int) (rnd.nextFloat() * SALTCHARS.length());
                    salt.append(SALTCHARS.charAt(index));
                }
                String code = salt.toString();

                for (FileItem item : multiparts) {
                   if (!item.isFormField()) {
                        //Getting image name
//                        bookphoto = new File(item.getName()).getName();
                        //Storing in the specified directory
                       // item.write(new File(UPLOAD_DIRECTORY + File.separator + bookphoto));

                        //Retriving all information from frontend
                        FileItem cat = (FileItem) multiparts.get(0);
                        category = cat.getString();
                        System.out.println(category);
                        
                        FileItem bookname = (FileItem) multiparts.get(1);
                        bname = bookname.getString();
                        System.out.println(bname);

                        FileItem authorname = (FileItem) multiparts.get(2);
                        aname = authorname.getString();
                        System.out.println(aname);

                        FileItem bookprice = (FileItem) multiparts.get(3);
                        price = bookprice.getString();
                        System.out.println(price);

                        FileItem bookquantity = (FileItem) multiparts.get(5);
                        quantity = bookquantity.getString();
                        System.out.println(quantity);
                    }
                }
                try {
                    int id = 0;
//                    String imagePath = UPLOAD_DIRECTORY + bookphoto;
                    //Querying to insert product in the table
                    int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into adminbook(category_name,book_name,author_name,book_price,book_quantity) values('" + category + "','" + bname + "','" + aname + "','" + price + "','" + quantity + "')");
                    //If product inserted sucessfully in the database
                    if (i > 0) {
                        String success = "Book added successfully.";
                        //Adding method in session.
                        session.setAttribute("message", success);
                        //Response send to the admin-add-product.jsp
                        response.sendRedirect("admin/index.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception ex) {
                //If any occur occured
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }
        } else {
            request.setAttribute("message", "Sorry this Servlet only handles file upload request");
        }
    }
}
