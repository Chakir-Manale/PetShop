package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

public class MyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cookie[] cookie = request.getCookies();
		String username = "";

		for (Cookie c : cookie) {
			if (c.getName().equals("userCookie")) {
				String[] cookieData = c.getValue().split("_");
				username = cookieData[1];
			}
		}
		HttpSession session = request.getSession();
		List<User> users = UserDAO.getUsersList();

		User user = new User();
		
		for (User usr : users) {
			if (usr.getUsername().equals(username)) {
				user.setAdress(usr.getAdress());
				user.setCompany(usr.getCompany());
				user.setEmail(usr.getEmail());
				user.setPassword(usr.getPassword());
				user.setUsername(usr.getUsername());
				user.setPhone(usr.getPhone());
			}
		}
		session.setAttribute("userBean", user);
		request.getRequestDispatcher("myprofile.jsp").forward(request, response);
	}
}