package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean userExists = false;
		User user = new User();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String adress = request.getParameter("adress");
		String company = request.getParameter("company");

		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAdress(adress);
		user.setCompany(company);
		
		List<User> users = UserDAO.getUsersList();

		for (User usr : users) {
			if (usr.getUsername().equals(username)) {
				userExists = true;
			}
		}

		if (userExists) {
			request.setAttribute("error", true);
		} else {
			UserDAO.addUser(user);
			request.setAttribute("registered", true);
		}
		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}

}
