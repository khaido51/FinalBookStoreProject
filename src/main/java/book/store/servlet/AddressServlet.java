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


import book.store.entity.Address;
import book.store.service.AddressService;

/**
 * Servlet implementation class AddressServlet
 */
@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		HttpSession session = request.getSession();
		int customerId = (int) session.getAttribute("customerId");
		int streetNo = Integer.parseInt(request.getParameter("streetNo"));
		String streetName = request.getParameter("streetName");
		String suburb = request.getParameter("suburb");
		String state = request.getParameter("state");
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		Address address = new Address(streetNo, streetName, suburb, postcode, state);
		address.toString();
		
		System.out.println("Customer Id is " + customerId);
		
		try {
			AddressService addressServive = new AddressService();
			Boolean isInserted = addressServive.insertAddress(address);
			System.out.println(" Inserted sucessful? " + isInserted);
			if (isInserted) {
				response.sendRedirect("cart");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
				request.setAttribute("errorMessage", "Error, please enter again");
				rd.forward(request, response);
			}
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
