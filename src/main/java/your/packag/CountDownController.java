package your.packag;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CountDownController extends HttpServlet {

	@Override
	public void doGet( HttpServletRequest request, HttpServletResponse response )
		throws ServletException, IOException {
			CountDown c = new CountDown();
			request.setAttribute( "diff", c.toString() );
			this.getServletContext().getRequestDispatcher( "/WEB-INF/CountDownView.jsp" ).forward( request, response );
	}
}
