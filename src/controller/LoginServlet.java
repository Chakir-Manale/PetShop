package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		boolean validLogin = false;

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");
		String cookieData = "";
		List<User> users = UserDAO.getUsersList();

		for (User usr : users) {
			if (usr.getUsername().equals(username) && usr.getPassword().equals(password)) {
				cookieData = usr.getId() + "_" + username; // cookieData={id_username};
				validLogin = true;
			}
		}

		if (validLogin) {
			Cookie cookie = new Cookie("userCookie", cookieData);
			if (rememberMe != null) {
				cookie.setMaxAge(24 * 60 * 60);
				response.addCookie(cookie);
			} else {
				cookie.setMaxAge(-1);
				response.addCookie(cookie);
			}
			response.sendRedirect("index.jsp");
		} else {
			request.setAttribute("error", true);
			request.getRequestDispatcher("myaccount.jsp").forward(request, response);
		}
	}
}
