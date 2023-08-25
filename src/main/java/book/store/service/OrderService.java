package book.store.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import book.store.db.util.DBUtil;
import book.store.entity.Order;

public class OrderService {
	public int addOrder(Order order) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.makeConnection();

			// QUery
			String query = "INSERT INTO `order` (`total_price`, `customer_id`) VALUES (?,?)";
			ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

			// Set params
			
			ps.setDouble(1, order.getTotalPrice());
			ps.setInt(2, order.getCustomerId());

			ps.execute();

			rs = ps.getGeneratedKeys();

			if (rs.next()) {
				int insertedId = rs.getInt(1);
				return insertedId;
			}
			return 0;

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
		return 0;

	}
	
	public List<Order> showAllOrders(int customerId) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Order order = null;
		List<Order> list = new ArrayList<Order>();
		
		
		try {
			conn = DBUtil.makeConnection();
			
			//Query
			String query = "SELECT * FROM `order` where customer_id =?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, customerId);
			rs = ps.executeQuery();
			
			//mapping data in result set 
			while(rs.next()) {
				int id = rs.getInt("id");
				Date dateOfOrder = rs.getDate("date_of_order");
				double totalPrice = rs.getDouble("total_price");
				
				order = new Order(id, dateOfOrder, totalPrice, customerId);
				list.add(order);
				
			}
		}catch (Exception e) {
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
