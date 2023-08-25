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
import book.store.entity.OrderDetails;
import book.store.service.BookService;
import book.store.service.OrderDetailsService;
import book.store.service.WishlistService;

/**
 * Servlet implementation class OrderDetailsServlet
 */
@WebServlet("/order-details")
public class OrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailsServlet() {
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
			List<OrderDetails> orderDetails = new ArrayList<OrderDetails>();
			OrderDetailsService service = new OrderDetailsService();
			List<Book> books = new ArrayList<Book>();
			BookService bookService = new BookService();
			
			//get wishlist item count
			HttpSession session = request.getSession();
			int customerId = (int) session.getAttribute("customerId");
			WishlistService wishListService = new WishlistService();
			int wishListItemcount = wishListService.countWishlistItem(customerId);
			//System.out.println("Wishlist item count at home page  " + wishListItemcount);
			request.setAttribute("wishListItemcount", wishListItemcount);
			
			//get OrderId from jsp 
			Integer orderId = Integer.parseInt(request.getParameter("orderId"));
			System.out.println("Order ID is " + orderId);
			
			if(orderId != null) {
				orderDetails = service.getOrderDetailsFromID(orderId);
			}
			
			for(OrderDetails item: orderDetails) {
				Book book = bookService.getBookDetails(item.getBookId());
				books.add(book);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("order-details.jsp");
			request.setAttribute("orderDetails", orderDetails);
			request.setAttribute("books", books);
			rd.forward(request, response);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		//passing orderId to service
		
		//get the list of order-details to display
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
