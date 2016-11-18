package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Cookie;

import model.CountDown;

public class CountDownController extends HttpServlet {

	// TODO: trouver une autre méthode plus propre pour gerer les ids
	private int maxId(HttpServletRequest request) {
		int max = 0;
		Cookie[] cookies = request.getCookies();

		int nb = 0;

		for (int i= 0; i < cookies.length; i++) {
			try {
				nb = Integer.parseInt(cookies[i].getName());
			} catch(NumberFormatException e) {

			}
			if (max < nb) {
				max = nb;
			}
		}
		return max + 1;
	}

	@Override
	public void doPost( HttpServletRequest request, HttpServletResponse response )
		throws ServletException, IOException {
			String title = request.getParameter("title");
			String time = request.getParameter("time");
			String locale = request.getParameter("locale");
			CountDown c = new CountDown(title, locale, time);

			int id = maxId(request);
			Cookie cookie = new Cookie( id+"", c.toString());
			cookie.setMaxAge( (int) c.diffSeconds());
			response.addCookie(cookie);

			response.sendRedirect("/CountDownWebApp");
	}
}
