package controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyAccountFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		Cookie[] cookie = req.getCookies();

		if (cookie == null) {
			res.addCookie(new Cookie("t", "t"));
			res.sendRedirect("myaccount.jsp");
		} else {
			for (Cookie c : cookie) {
				if (c.getName().equals("userCookie")) {
					if (c.getValue() != null) {
						if (session.getAttribute("userBean") != null) {
							req.getRequestDispatcher("myprofile.jsp").forward(req, res);
						} else {
							req.getRequestDispatcher("myinfo").forward(req, res);
						}
					} else {
						chain.doFilter(request, response);
					}
				}
			}
		}
		chain.doFilter(request, response);
	}

}
