package book.store.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import book.store.db.util.DBUtil;
import book.store.entity.Order;
import book.store.entity.OrderDetails;


public class OrderDetailsService {
	
	public int addOrderDetails(OrderDetails orderDetails) throws SQLException{
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		
		try {
			conn = DBUtil.makeConnection();
			
			//Query
			String query = "INSERT INTO `order_details`(order_id, book_id, amount, ordered_price) VALUES (?,?,?,?)";
			ps = conn.prepareStatement(query);
			
			ps.setInt(1, orderDetails.getOrderId());
			ps.setInt(2, orderDetails.getBookId());
			ps.setInt(3, orderDetails.getAmount());
			ps.setDouble(4, orderDetails.getOrderedPrice());
			
			ps.execute();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		
		return 0;
	}
	
	public List<OrderDetails> getOrderDetailsFromID(int orderId) throws SQLException {

		// Connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		OrderDetails orderDetails = new OrderDetails();
		List<OrderDetails> list = new ArrayList<OrderDetails>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "Select * from order_details where order_id = ?";
			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);
			ps.setInt(1, orderId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int id = rs.getInt("id");
				int bookId = rs.getInt("book_id");
				int amount = rs.getInt("amount");
				double orderedPrice = rs.getDouble("ordered_price");
				
				orderDetails = new OrderDetails(id, orderId, bookId, amount, orderedPrice);
				list.add(orderDetails);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}

		return list;
	}
}
