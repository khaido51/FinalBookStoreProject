package book.store.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.store.entity.Address;
import book.store.entity.Customer;
import book.store.service.CustomerService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		// --> Register Account
		// Read data input from user

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		int phoneNo = Integer.parseInt(request.getParameter("phoneNo"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Customer customer = new Customer(firstName, lastName, email, phoneNo, username, password);
		
		//Address will be update later
		// int streetNo = Integer.parseInt(request.getParameter("streetNo"));
		// String streetName = request.getParameter("streetName");
		// String suburb = request.getParameter("suburb");
		// String state = request.getParameter("state");
		// int postcode = Integer.parseInt(request.getParameter("postcode"));
		// Address address = new Address(streetNo, streetName, suburb, postcode, state);

		// Create a new account and store to the database
		CustomerService registerService = new CustomerService();

		try {
			boolean isInsertSuccess = registerService.registerAccount(customer);
			if (isInsertSuccess) {
				response.sendRedirect("login.jsp");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				request.setAttribute("errorMessage", "Error, please enter again");
				rd.forward(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
