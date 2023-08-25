package book.store.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.store.entity.Genre;
import book.store.service.GenreService;

/**
 * Servlet implementation class ErrorServlet
 */
@WebServlet("/error")
public class ErrorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ErrorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			GenreService genreService = new GenreService();

			// fiction genre list
			List<Genre> FicList = genreService.getFictionGenres();

			// non-fiction genre list
			List<Genre> NonFicList = genreService.getNonFictionGenres();

			// children genres list
			List<Genre> genreChildrenList = genreService.getChildrenGenres();

			//get accountId
			
			// Adding request dispatcher in order to dispatch the request to the home page
			RequestDispatcher rd = request.getRequestDispatcher("404.jsp");
			request.setAttribute("FicList", FicList);
			request.setAttribute("NonFicList", NonFicList);
			request.setAttribute("genreChildrenList", genreChildrenList);
			rd.forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
