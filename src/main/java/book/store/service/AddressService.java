package book.store.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import book.store.db.util.DBUtil;
import book.store.entity.Address;


public class AddressService {
	
	public Address getAddressDetailOfCustomer(int customerId) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Address address = null;
		
		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM address where customer_id = ?";

			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);

			ps.setInt(1, customerId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			if (rs.next()) {
				int id = rs.getInt("id");
				int streetNo = rs.getInt("street_no");
				String streetName = rs.getString("street_name");
				String suburb = rs.getString("suburb");
				int postcode = rs.getInt("postcode");
				String state = rs.getString("state");
				customerId = rs.getInt("customer_id");
				
				address = new Address(id, streetNo, streetName, suburb, postcode, state, customerId);
				
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

		return address;
	}
	
	public boolean insertAddress (Address address) throws SQLException {
		Connection conn = null;
		PreparedStatement addressStatement = null;
		
	
		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "INSERT INTO `address` (`street_no`, `street_name`, `suburb`, `postcode`, `state`, `customer_id`) VALUES (?,?,?,?,?,?)";

			addressStatement = conn.prepareStatement(query);
			addressStatement.setInt(1, address.getStreetNo());
			addressStatement.setString(2, address.getStreetName());
			addressStatement.setString(3, address.getSuburb());
			addressStatement.setInt(4, address.getPostcode());
			addressStatement.setString(5, address.getState());
			addressStatement.setInt(6, address.getCustomerId());
			
			addressStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(addressStatement != null) {
				addressStatement.close();
			}
			
			if (conn != null) {
				conn.close();
			}
		}

		return true;
	}
	
	public boolean hasShippingAddress(int customerId) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM address where customer_id = ?";

			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);

			ps.setInt(1, customerId);
			// execute and get result SET
			rs = ps.executeQuery();

			 // Check if there is any result in the ResultSet
	        if (rs.next()) {
	            // If there is a result, it means the customer has a shipping address
	            return true;
	        } else {
	            // If there is no result, the customer doesn't have a shipping address
	            return false;
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
		return false;
	}
}