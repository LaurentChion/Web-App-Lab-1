package your.packag;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Cookie;

public class CountDownController extends HttpServlet {

	@Override
	public void doGet( HttpServletRequest request, HttpServletResponse response )
		throws ServletException, IOException {
			CountDown c = new CountDown();
			request.setAttribute( "diff", c.toString() );
			this.getServletContext().getRequestDispatcher( "/WEB-INF/CountDownView.jsp" ).forward( request, response );
	}

	@Override
	public void doPost( HttpServletRequest request, HttpServletResponse response )
		throws ServletException, IOException {
			String title = request.getParameter("title");
			String time = request.getParameter("time");
			String locale = request.getParameter("locale");
			CountDown c = new CountDown(title, "en", time);

			Cookie cookie = new Cookie(title, time);
			response.addCookie(cookie);

			this.getServletContext().getRequestDispatcher( "/index.jsp" ).forward( request, response );
	}

	/* TODO: fonction delete compteur
	@Override
	public void doDelete( HttpServletRequest request, HttpServletResponse response )
		throws ServletException, IOException {
			String title = request.getParameter("title");
			CountDown c = new CountDown(title, "en", "");
			request.setAttribute( "diff", c.toString() );
			this.getServletContext().getRequestDispatcher( "/WEB-INF/CountDownView.jsp" ).forward( request, response );
	}*/
}
