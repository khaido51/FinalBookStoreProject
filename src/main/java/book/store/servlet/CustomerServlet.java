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

import book.store.entity.Address;
import book.store.entity.Order;
import book.store.service.AddressService;
import book.store.service.OrderService;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/customer")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
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
			HttpSession session = request.getSession();
			OrderService orderService = new OrderService();
			List<Order> orderList = new ArrayList<Order>();
			
			//Getting customerId from jsp
			Integer customerId = (int) session.getAttribute("customerId");
			String userName = (String) session.getAttribute("userName");
			
			System.out.println("Customer iD" + customerId);
			
			if(customerId != null) {
				//passing id to the service to check
				orderList = orderService.showAllOrders(customerId);
			}
			AddressService addressServive = new AddressService();
			Address address = addressServive.getAddressDetailOfCustomer(customerId);
			
			
			
			
			//get the list of order out
			RequestDispatcher rd = request.getRequestDispatcher("my-account.jsp");
			request.setAttribute("orderList", orderList);
			request.setAttribute("customerId", customerId);
			request.setAttribute("userName", userName);
			request.setAttribute("address", address);
			rd.forward(request, response);
			
			
			//send it back to jsp
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
