package book.store.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Scanner;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import book.store.dto.CartSession;
import book.store.entity.Address;
import book.store.entity.Book;
import book.store.entity.Customer;
import book.store.entity.Genre;
import book.store.entity.Order;
import book.store.entity.OrderDetails;
import book.store.service.AddressService;
import book.store.service.BookService;
import book.store.service.GenreService;
import book.store.service.OrderDetailsService;
import book.store.service.OrderService;
import book.store.service.WishlistService;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		try {

			// Import List of genre here to display book's genre on navigation bar
			GenreService genreService = new GenreService();
			// List<Genre> genreList = genreService.getAllGenres();
			List<Genre> FicList = genreService.getFictionGenres();
			// non-fiction genre list
			List<Genre> NonFicList = genreService.getNonFictionGenres();
			// children genres list
			List<Genre> genreChildrenList = genreService.getChildrenGenres();

			int bookId = 0;
			String command = request.getParameter("command");
			System.out.println("Received command: " + command);

			if (command != null && command.equals("ADD_TO_CART")) {
				JsonObject jsonResponse = new JsonObject();

				bookId = Integer.parseInt(request.getParameter("bookId"));
				BookService bookService = new BookService();
				Book book = bookService.getBookDetails(bookId);
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");
				// CartSession cart = (CartSession) session.getAttribute("cart");

				if (cart == null) {
					cart = new HashMap<Integer, Book>();
				}

				cart.put(book.getIsbn(), book);
				session.setAttribute("cart", cart);
				request.setAttribute("book", book);

				// update cart
				int cartCount = cart.size();
				jsonResponse.addProperty("cartCount", cartCount);
				jsonResponse.add("cartItems", new Gson().toJsonTree(cart.values()));

				String jsonString = jsonResponse.toString();

				// Set the content type and write the JSON response to the response
				response.setContentType("application/json");
				response.getWriter().write(jsonString);
				response.getWriter().flush();
				response.getWriter().close();
				// response.sendRedirect("home");
			} else if (command != null && command.equals("ADD_TO_CART_REMOVE_FROM_WISHLIST")) {
				bookId = Integer.parseInt(request.getParameter("bookId"));
				BookService bookService = new BookService();
				Book book = bookService.getBookDetails(bookId);
				HttpSession session = request.getSession();

				int customerId = 0;
				if (session.getAttribute("customerId") != null) {
					customerId = (int) session.getAttribute("customerId");
				}

				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");

				WishlistService wishlistService = new WishlistService();

				if (cart == null) {
					cart = new HashMap<Integer, Book>();

				}
				cart.put(book.getIsbn(), book);
				session.setAttribute("cart", cart);
				request.setAttribute("book", book);
				wishlistService.deleteWishListItem(bookId, customerId);
				response.sendRedirect("wishlist?command=VIEW_WISHLIST");
			} else if (command != null && command.equals("REMOVE_CART")) {
//				JsonObject jsonResponse = new JsonObject();

//				bookId = Integer.parseInt(request.getParameter("bookId"));
//				HttpSession session = request.getSession();
//				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");
//				cart.remove(bookId);

//				int cartCount = cart.size();
//				jsonResponse.addProperty("cartCount", cartCount);
//				jsonResponse.add("cartItems", new Gson().toJsonTree(cart.values()));
//				// Update cart items in the JSON response (optional)
//		     
//		        // Set the content type and write the JSON response to the response
//		        response.setContentType("application/json");
//		        response.getWriter().write(jsonResponse.toString());
//		        response.getWriter().flush();
//		        response.getWriter().close();

				bookId = Integer.parseInt(request.getParameter("bookId"));
				double price = Double.parseDouble(request.getParameter("bookPrice"));
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");
				double initalPrice = 0;
				for (Book book : cart.values()) {
					initalPrice = initalPrice + book.getPrice();
				}
				double totalPrice = initalPrice - price;

				cart.remove(bookId);

				RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				request.setAttribute("totalPrice", totalPrice);
				rd.forward(request, response);
			}

			else if (command != null && command.equals("VIEW_CART")) {
				HttpSession session = request.getSession();
				String message = "";
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");

				double totalPrice = 0;

				for (Book book : cart.values()) {
					totalPrice = totalPrice + book.getPrice();
				}
				
				
				int customerId = 0;
				
	            if (session.getAttribute("customerId") != null) {
	                customerId = (int) session.getAttribute("customerId");
	            }
				WishlistService wishListService = new WishlistService();
				int wishListItemcount = wishListService.countWishlistItem(customerId);
				//System.out.println("Wishlist item count at home page  " + wishListItemcount);
				request.setAttribute("wishListItemcount", wishListItemcount);
				
				RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
				request.setAttribute("cart", cart);
				request.setAttribute("FicList", FicList);
				request.setAttribute("NonFicList", NonFicList);
				request.setAttribute("genreChildrenList", genreChildrenList);
				request.setAttribute("totalPrice", totalPrice);
				request.setAttribute("message", message);
				rd.forward(request, response);
			}

		} catch (Exception e) {
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
		// doGet(request, response);
		try {
			String command = request.getParameter("command");

			if (command != null && command.equals("PROCEED_TO_CHECKOUT")) {
				HttpSession session = request.getSession();

				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");

				// gathering all info to display at checkout stage
				// totalPrice
				String totalPriceParam = request.getParameter("totalPrice");
				double finalTotalPrice = 0.0;

				if (totalPriceParam != null) {
					finalTotalPrice = Double.parseDouble(totalPriceParam);
				}
				// customer
				Integer customerId = (Integer) session.getAttribute("customerId");
				if (customerId == null) {
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					request.setAttribute("errorMessage", "Please signin to continue to checkout");
					rd.forward(request, response);
				}

				//Count item in wishlist
				WishlistService wishListService = new WishlistService();
				int wishListItemcount = wishListService.countWishlistItem(customerId);
				//System.out.println("Wishlist item count at home page  " + wishListItemcount);
				request.setAttribute("wishListItemcount", wishListItemcount);
				
				//Get Address of customer 
				AddressService addressServive = new AddressService();
				Address address = addressServive.getAddressDetailOfCustomer(customerId);

				// amount of each book
				List<Integer> amountList = new ArrayList<>();
				for (Book book : cart.values()) {
					// not working here
					// it must be an ArrayList to store multiple quantity of each product
					int amount = Integer.parseInt(request.getParameter("amount_" + book.getIsbn()));
					amountList.add(amount);
				}
				System.out.println("Total Amount List : " + amountList.size());
				// System.out.println("Amount List: " + amountList.size());
				// System.out.println("Amount List : " + amountList.size());
				//
				RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
				request.setAttribute("finalTotalPrice", finalTotalPrice);
				request.setAttribute("address", address);
				request.setAttribute("customerId", customerId);
				request.setAttribute("amountList", amountList);

				rd.forward(request, response);

			} else if (command != null && command.equals("CHECKOUT")) {
				HttpSession session = request.getSession();
				Map<Integer, Book> cart = (Map<Integer, Book>) session.getAttribute("cart");
				int customerId = (int) session.getAttribute("customerId");

				// create order - return orderId
				String totalPriceParam = request.getParameter("totalPrice");
				double finalTotalPrice = 0.0;

				if (totalPriceParam != null) {
					finalTotalPrice = Double.parseDouble(totalPriceParam);
				}

				Order order = new Order(customerId, finalTotalPrice);
				System.out.println("Total price: " + finalTotalPrice);

				OrderService orderService = new OrderService();
				Integer orderId = orderService.addOrder(order);

				session.setAttribute("orderId", orderId);

				AddressService addressService = new AddressService();
				boolean hasShippingAddress = addressService.hasShippingAddress(customerId);
				System.out.println("Existing address" + hasShippingAddress);
				if (!hasShippingAddress) {
					// save address
					int streetNo = Integer.parseInt(request.getParameter("streetNo"));
					String streetName = request.getParameter("streetName");
					String suburb = request.getParameter("suburb");
					String state = request.getParameter("state");
					int postcode = Integer.parseInt(request.getParameter("postcode"));

					Address address = new Address(streetNo, streetName, suburb, postcode, state, customerId);
					boolean isInserted = addressService.insertAddress(address);
					address.toString();
					System.out.println(" Inserted successful? " + isInserted);

					if (!isInserted) {
						RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
						request.setAttribute("errorMessage", "Error, please enter again");
						rd.forward(request, response);
					}
				} else {
					// create orderDetails
					for (Book book : cart.values()) {
						int amount = Integer.parseInt(request.getParameter("amount_" + book.getIsbn()));
						System.out.println("Amount is " + amount);
						System.out.println("Hello This is Khai" + amount);

						OrderDetails orderDetails = new OrderDetails(orderId, book.getIsbn(), amount, book.getPrice());
						OrderDetailsService orderDetailsService = new OrderDetailsService();
						orderDetailsService.addOrderDetails(orderDetails);
					}
				}

				session.removeAttribute("cart");
				response.sendRedirect("payment-success.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
