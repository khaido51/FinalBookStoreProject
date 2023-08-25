package book.store.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.store.entity.Book;
import book.store.entity.Genre;
import book.store.entity.Wishlist;
import book.store.service.BookService;
import book.store.service.GenreService;
import book.store.service.WishlistService;

/**
 * Servlet implementation class WishlistServlet
 */
@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WishlistServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			GenreService genreService = new GenreService();

			List<Genre> FicList = genreService.getFictionGenres();

			// non-fiction genre list
			List<Genre> NonFicList = genreService.getNonFictionGenres();

			// children genres list
			List<Genre> genreChildrenList = genreService.getChildrenGenres();

			HttpSession session = request.getSession();

			int customerId = 0;
			int bookId = 0;

			String command = request.getParameter("command");
			if (session.getAttribute("customerId") != null) {
				customerId = (int) session.getAttribute("customerId");
			} else {
				// If the user is not logged in, redirect to the login page
				response.sendRedirect("login.jsp");
				return;
			}

			WishlistService wishListService = new WishlistService();

			int wishListItemcount = 0;
			wishListItemcount = wishListService.countWishlistItem(customerId);
			System.out.println("Wishlist item count  " + wishListItemcount);
			request.setAttribute("wishListItemcount", wishListItemcount);

			if (command != null && command.equals("ADD_TO_WISHLIST")) {
				bookId = Integer.parseInt(request.getParameter("bookId"));
				BookService bookService = new BookService();
				Book book = bookService.getBookDetails(bookId);
				// Map<Integer, Book> wishlist = (Map<Integer, Book>)
				// session.getAttribute("wishlist");

				// if (wishlist == null) {
				// wishlist = new HashMap<Integer, Book>();
				// }
				Wishlist wishlist1 = new Wishlist(bookId, customerId);
				int insertedId = wishListService.addWishlistItem(wishlist1);
				if (insertedId == -1) {
					// Item already exists in the wishlist
					String errorMessage = "This book is already in the wishlist";
					request.setAttribute("errorMessage", errorMessage);
				}
				wishListService.addWishlistItem(wishlist1);
				// wishlist.put(book.getIsbn(), book);
				// session.setAttribute("wishlist", wishlist);
				request.setAttribute("book", book);
				response.sendRedirect("details?bookId=" + bookId);

			} else if (command != null && command.equals("REMOVE_ITEM_FROM_WISHLIST")) {
				bookId = Integer.parseInt(request.getParameter("bookId"));
				WishlistService wishListservice = new WishlistService();
				wishListservice.deleteWishListItem(bookId, customerId);
				response.sendRedirect("wishlist?command=VIEW_WISHLIST");

			} else if (command != null && command.equals("VIEW_WISHLIST")) {
				customerId = (int) session.getAttribute("customerId");
				WishlistService wishlistService = new WishlistService();
				BookService bookService = new BookService();
				List<Wishlist> wishList = wishlistService.showWishlist(customerId);
				List<Book> booksInWishlist = new ArrayList<Book>();

				for (Wishlist wishlistItem : wishList) {
					int bookIsbn = wishlistItem.getBook_isbn();
					Book book = bookService.getBookDetails(bookIsbn);
					if (book != null) {
						booksInWishlist.add(book);
					}
				}
				RequestDispatcher rd = request.getRequestDispatcher("wishlist.jsp");
				request.setAttribute("wishList", wishList);
				request.setAttribute("booksInWishlist", booksInWishlist);
				request.setAttribute("FicList", FicList);
				request.setAttribute("NonFicList", NonFicList);
				request.setAttribute("genreChildrenList", genreChildrenList);

				rd.forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
