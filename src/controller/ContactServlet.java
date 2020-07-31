package controller;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Database;

public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	private Date date=new Date();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String msg=request.getParameter("msg");
		String company=request.getParameter("company");
		
		String insertQuery="insert into contact (name,email,phone,company,msg,date) values ( ? , ? , ? , ? , ?,?)";
		
		try {
			
			PreparedStatement preparedStmt = Database.getConnection().prepareStatement(insertQuery);
			preparedStmt.setString(1,name);
			preparedStmt.setString(2,email);
			preparedStmt.setString(3,phone);
			preparedStmt.setString(4,company);
			preparedStmt.setString(5,msg);
			preparedStmt.setString(6,dateFormat.format(date));
			preparedStmt.executeUpdate();
			
			request.setAttribute("msgSent",true);
			
			request.getRequestDispatcher("contact.jsp").forward(request, response);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		

		
	
	}

}
