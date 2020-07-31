package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

public class UpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String adress = request.getParameter("adress");
		String company = request.getParameter("company");
		
		String[] cookieData;
		int userId = 0;

		Cookie[] cookie = request.getCookies();

		User user = new User();

		user.setAdress(adress);
		user.setCompany(company);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone(phone);
		user.setUsername(username);

		for (Cookie c : cookie) {
			if (c.getName().equals("userCookie")) {

				cookieData = c.getValue().split("_");
				userId = Integer.parseInt(cookieData[0]);

				if (UserDAO.updateUser(user, userId)) {

					c.setValue(userId + "_" + username);
					response.addCookie(c);

					HttpSession session = request.getSession();
					session.setAttribute("userBean", null);
					response.sendRedirect("myaccount.jsp");
				}
			}
		}
	}
}