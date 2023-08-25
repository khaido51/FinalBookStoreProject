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
 * Servlet implementation class BookServlet
 */
@WebServlet("/book")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String genreId = request.getParameter("genreId");
			String bookName = request.getParameter("bookName");
			
			GenreService genreService = new GenreService();
			List<Genre> FicList = genreService.getFictionGenres();
			
			//genre non-fiction list
			GenreService genreService1 = new GenreService();
			List<Genre> NonFicList = genreService1.getNonFictionGenres();
			
		
			List<Genre> genreChildrenList = genreService.getChildrenGenres();
			
			BookService bookService= new BookService();
			List<Book> bookList = new ArrayList<Book>();
			List<Book> randomBookList=new ArrayList<Book>();
			List<Book> randomBookList1=new ArrayList<Book>();
			
			//get wishlist item count
			int customerId = 0;
			HttpSession session = request.getSession();
            if (session.getAttribute("customerId") != null) {
                customerId = (int) session.getAttribute("customerId");
            }
			WishlistService wishListService = new WishlistService();
			int wishListItemcount = wishListService.countWishlistItem(customerId);
			//System.out.println("Wishlist item count at home page  " + wishListItemcount);
			request.setAttribute("wishListItemcount", wishListItemcount);
			
			//Uyen code so mess 
			List<Wishlist> wishList = wishListService.showWishlist(customerId);
			List<Book> booksInWishlist = new ArrayList<>();
			
			for (Wishlist wishlistItem : wishList) {
				int bookIsbn = wishlistItem.getBook_isbn();
				Book book1 = bookService.getBookDetails(bookIsbn);
				if (book1 != null) {
					booksInWishlist.add(book1);
				}
			}
			
			int currentPage = 1;
			if(request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
		
			int totalPage = 0;
			if(genreId == null && bookName == null) {
				bookList = bookService.getAllBooks();
				bookList = bookService.getBooksByPage(currentPage);
				randomBookList=bookService.getThreeBooks();
				randomBookList1=bookService.getThreeBooks();
				totalPage = bookService.getTotalPage();
			}
			else if(bookName != null) {
				bookList = bookService.getBooksByName(bookName);
			}
			else {
				bookList = bookService.getBooksByGenreId(Integer.parseInt(genreId));
				System.out.println("Before setting totalPage for genreId: " + genreId);
				bookList = bookService.getBooksByPageBelongToGenre(currentPage, Integer.parseInt(genreId));
				randomBookList=bookService.getThreeBooks();
				randomBookList1=bookService.getThreeBooks();
				totalPage = bookService.getTotalPageFromGenre(Integer.parseInt(genreId));
				System.out.println("After setting totalPage: " + totalPage);
			    request.setAttribute("genreId", genreId);
			    request.setAttribute("totalPage", totalPage);
			    System.out.println("Genre ID in servlet: " + genreId); // Add this line
			}
			
			//Adding request dispatcher in order to dispatch the request to the home page
			RequestDispatcher rd = request.getRequestDispatcher("shop-list.jsp");
			request.setAttribute("bookList", bookList);
			request.setAttribute("FicList", FicList);
			request.setAttribute("booksInWishlist", booksInWishlist);
			request.setAttribute("NonFicList", NonFicList);
			request.setAttribute("genreChildrenList", genreChildrenList);
			request.setAttribute("randomBookList", randomBookList);
			request.setAttribute("randomBookList1", randomBookList1);
			//request.setAttribute("totalPage", totalPage);
			
			rd.forward(request, response);
			
			
		}catch(SQLException e) {
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
