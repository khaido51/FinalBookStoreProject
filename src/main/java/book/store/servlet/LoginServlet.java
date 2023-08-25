package book.store.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.store.entity.Customer;
import book.store.service.CustomerService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		//Get username and password passed from the user input
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		//create loginservice object to get to the login service function
		CustomerService customerService = new CustomerService();
		Customer customer = new Customer();
		
		try {
			customer = customerService.getUsernameAndPassword(userName, password);
			if(customer == null) {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				request.setAttribute("errorMessage", "Your username or password is incorrect");
				rd.forward(request, response);
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				session.setAttribute("customerId", customer.getId());
				System.out.println(customer.getId());
				response.sendRedirect("home");
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		
	}

}
