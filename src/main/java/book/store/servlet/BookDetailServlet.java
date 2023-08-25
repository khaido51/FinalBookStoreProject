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

import book.store.entity.Author;
import book.store.entity.Book;
import book.store.entity.Genre;
import book.store.entity.Review;
import book.store.entity.Wishlist;
import book.store.service.BookService;
import book.store.service.GenreService;
import book.store.service.ReviewService;
import book.store.service.WishlistService;

/**
 * Servlet implementation class BookDetailServlet
 */
@WebServlet("/details")
public class BookDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookDetailServlet() {
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
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			GenreService genreService = new GenreService();

			// fiction genre list
			List<Genre> FicList = genreService.getFictionGenres();

			// non-fiction genre list
			List<Genre> NonFicList = genreService.getNonFictionGenres();

			// children genres list
			List<Genre> genreChildrenList = genreService.getChildrenGenres();

			BookService bookService = new BookService();

			Book book = bookService.getBookDetails(bookId);
			List<Book> bookList = bookService.getSmallBookList(bookId);
			List<Book> AuthorBookList = bookService.getBooksSameAuthors(bookId);
			Author author = bookService.getAuthorOnBookDetails(bookId);
			
			//get wishlist item count
			int customerId = 0;
			HttpSession session = request.getSession();
            if (session.getAttribute("customerId") != null) {
                customerId = (int) session.getAttribute("customerId");
            }
			
			WishlistService wishListService = new WishlistService();
			//int wishListItemcount = wishListService.countWishlistItem(customerId);
			//System.out.println("Wishlist item count at home page  " + wishListItemcount);
			//request.setAttribute("wishListItemcount", wishListItemcount);
			
			
			//Uyen code so mess 
			List<Wishlist> wishList = wishListService.showWishlist(customerId);
			int wishListItemcount = wishListService.countWishlistItem(customerId);
			List<Book> booksInWishlist = new ArrayList<>();
			
			for (Wishlist wishlistItem : wishList) {
				int bookIsbn = wishlistItem.getBook_isbn();
				Book book1 = bookService.getBookDetails(bookIsbn);
				if (book1 != null) {
					booksInWishlist.add(book1);
				}
			}
			//show review list
			ReviewService reviewService = new ReviewService();
			List<Review> reviewList = reviewService.showReview(bookId);
			  for (Review review : reviewList) {
		            String processedDescription = review.getDescription().replace("\n", "<br><br>");
		            review.setDescription(processedDescription);
		        }
			  int reviewCount = reviewList.size();
			

			// Adding request dispatcher in order to dispatch the request to the home page
			RequestDispatcher rd = request.getRequestDispatcher("product-details.jsp");
			request.setAttribute("book", book);
			request.setAttribute("bookId", bookId);
			request.setAttribute("FicList", FicList);
			request.setAttribute("NonFicList", NonFicList);
			request.setAttribute("genreChildrenList", genreChildrenList);
			request.setAttribute("bookList", bookList);
			request.setAttribute("wishListItemcount", wishListItemcount);
			request.setAttribute("author", author);
			request.setAttribute("reviewList", reviewList);
			request.setAttribute("reviewCount", reviewCount);
			request.setAttribute("booksInWishlist", booksInWishlist);
			request.setAttribute("AuthorBookList", AuthorBookList);
			rd.forward(request, response);

		} catch (SQLException e) {
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
		//doGet(request, response);
		String command = request.getParameter("command");
		HttpSession session = request.getSession();
		ReviewService reviewService = new ReviewService();
		try {
			if (command != null && command.equals("SUBMIT_REVIEW")) {
				int bookId = Integer.parseInt(request.getParameter("bookId"));
				int customerId = (int) session.getAttribute("customerId");
				String userName = request.getParameter("userName");

				String reviewTitle = request.getParameter("reviewTitle");
				String reviewDescription = request.getParameter("description");
				
				Review review = new Review(bookId, customerId, reviewTitle, reviewDescription);

				WishlistService wishListService = new WishlistService();

				int count = wishListService.countWishlistItem(customerId);

				request.setAttribute("count", count);
				// boolean isInsertedSuccess = reviewService.addReview(review);
				int insertedId = reviewService.checkDuplicateReview(review);
				if (insertedId == -1) {
					// Item already exists in the wishlist
				
					String errorMessage = "You have already reviewed this book!";
					request.setAttribute("errorMessage", errorMessage);
					
				}
					reviewService.checkDuplicateReview(review);
					response.sendRedirect("details?bookId=" + bookId);
				}

		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
