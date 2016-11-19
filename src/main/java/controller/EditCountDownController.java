package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Cookie;

import model.CountDown;

public class EditCountDownController extends HttpServlet {

	@Override
	public void doPost( HttpServletRequest request, HttpServletResponse response )
		throws ServletException, IOException {
			String id = request.getParameter("id");
      String title = request.getParameter("title");
      String time = request.getParameter("time");
      String locale = request.getParameter("locale");

      CountDown c = new CountDown(title, locale, time);

      Cookie[] cookies = request.getCookies();
      for (int i=0; i<cookies.length; i++) {
        if (cookies[i].getName().equals(id)) {
          // Edition du cookie
					cookies[i].setValue(c.toString());
					cookies[i].setMaxAge((int)c.diffSeconds());
					response.addCookie(cookies[i]);
        }
      }
      response.sendRedirect("/CountDownWebApp");
	}
}
