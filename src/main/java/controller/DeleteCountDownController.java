package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Cookie;

public class DeleteCountDownController extends HttpServlet {

	@Override
	public void doPost( HttpServletRequest request, HttpServletResponse response )
		throws ServletException, IOException {
			String id = request.getParameter("id");

      Cookie[] cookies = request.getCookies();

      for (int i=0; i<cookies.length; i++) {
        if (cookies[i].getName().equals(id)) {

          // suppression du cookie
					cookies[i].setValue(null);
					cookies[i].setMaxAge(-1);
					response.addCookie(cookies[i]);
        }
      }
			response.sendRedirect("/CountDownWebApp");
	}
}
