package book.store.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import book.store.db.util.DBUtil;
import book.store.entity.Customer;

public class CustomerService {

	public boolean registerAccount(Customer customer) throws SQLException {
		// Connection
		Connection conn = null;
		// PreparedStatement addressStatement = null;
		PreparedStatement customerStatement = null;

		try {
			conn = DBUtil.makeConnection();

			// String addressQuery = "INSERT INTO `address` (`streetNo`, `streetName`,
			// `suburb`, `postcode`, `state`) VALUES (?, ?, ?, ?, ?)";
			String customerQuery = "INSERT INTO `customer` (`first_name`, `last_name`, `email`, `phone_no`, `username`, `password`) VALUES (?,?,?,?,?,?)";

//		        addressStatement = conn.prepareStatement(addressQuery, Statement.RETURN_GENERATED_KEYS);
//		        addressStatement.setInt(1, address.getStreetNo());
//		        addressStatement.setString(2, address.getStreetName());
//		        addressStatement.setString(3, address.getSuburb());
//		        addressStatement.setInt(4, address.getPostcode());
//		        addressStatement.setString(5, address.getState());
//		        addressStatement.execute();

			// customer.setAddressId(addressId);

			customerStatement = conn.prepareStatement(customerQuery);
			customerStatement.setString(1, customer.getFirstName());
			customerStatement.setString(2, customer.getLastName());
			customerStatement.setString(3, customer.getEmail());
			customerStatement.setInt(4, customer.getPhoneNo());
			customerStatement.setString(5, customer.getUserName());
			customerStatement.setString(6, customer.getPassword());

			customerStatement.execute();

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {

			if (customerStatement != null) {
				customerStatement.close();

			}
			if (conn != null) {
				conn.close();
			}
		}
		return true;
	}

	public Customer getUsernameAndPassword(String userName, String password) throws SQLException {

		// Connection
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Customer customer = null;

		try {
			//make connection to mySQL
			conn = DBUtil.makeConnection();
			
			String query = "SELECT * FROM customer where username = ? AND password = ?";
			
			ps = conn.prepareStatement(query);
			ps.setString(1, userName);
			ps.setString(2, password);
			
			//execute 
			rs = ps.executeQuery();
			
			//check for existing account
			if(rs.next()) {
				int customerId = rs.getInt("id");
				customer = new Customer(userName, password);
				customer.setId(customerId);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return customer;
	}
	
	
	
}
