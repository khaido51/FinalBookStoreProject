package book.store.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import book.store.db.util.DBUtil;
import book.store.entity.Wishlist;

public class WishlistService {
	public int addWishlistItem(Wishlist wishlist) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int insertedId = 0;
		try {
			conn = DBUtil.makeConnection();

			// Check if the item already exists in the wishlist for the same customer
			String checkQuery = "SELECT id FROM wishlist WHERE book_isbn = ? AND customer_id = ?";
			ps = conn.prepareStatement(checkQuery);
			ps.setInt(1, wishlist.getBook_isbn());
			ps.setInt(2, wishlist.getCustomer_id());
			rs = ps.executeQuery();

			if (rs.next()) {
				// Item already exists, do not add it again
				return -1;
			}

			// Insert the item into the wishlist
			String insertQuery = "INSERT INTO wishlist (book_isbn, customer_id) VALUES (?, ?)";
			ps = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, wishlist.getBook_isbn());
			ps.setInt(2, wishlist.getCustomer_id());
			ps.execute();

			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				insertedId = rs.getInt(1);
				return insertedId;
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
		System.out.println("Insert sucessfully");
		return 0;

	}

	public void deleteWishListItem(Integer bookId, Integer customerId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		System.out.println("delete roomId and student id" + customerId + bookId);

		try {
			// Make connection to MySQL
			conn = DBUtil.makeConnection();

			// Set SQL_SAFE_UPDATES to 0 to include the SAFE_UPDATES option
			PreparedStatement setSafeUpdates = conn.prepareStatement("SET SQL_SAFE_UPDATES = 0;");
			setSafeUpdates.execute();

			// Create the DELETE SQL query
			String deleteQuery = "DELETE FROM wishlist WHERE book_isbn = ? AND customer_id = ?;";
			ps = conn.prepareStatement(deleteQuery);

			// Bind parameters
			ps.setInt(1, bookId);
			ps.setInt(2, customerId);

			// Execute the delete query
			int rowsAffected = ps.executeUpdate();
			System.out.println("Deleted " + rowsAffected + " rows from wishlist");
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

			// Reset SQL_SAFE_UPDATES to 1 (enabled) after executing the query
			Connection resetConn = DBUtil.makeConnection();
			PreparedStatement resetSafeUpdates = resetConn.prepareStatement("SET SQL_SAFE_UPDATES = 1;");
			resetSafeUpdates.execute();
			resetConn.close();
		}
	}

	public List<Wishlist> showWishlist(int customerId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Wishlist> list = new ArrayList<Wishlist>();
		Wishlist wishlist = null;
		try {
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM wishlist where customer_id=?";

			ps = conn.prepareStatement(query);
			ps.setInt(1, customerId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int id = rs.getInt("id");
				int bookIsbn = rs.getInt("book_isbn");

				wishlist = new Wishlist(id, bookIsbn, customerId);
				list.add(wishlist);
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

	public int countWishlistItem(int customerId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int itemCount = 0; // Initialize the item count

		try {
			conn = DBUtil.makeConnection();

			// Query to count wishlist items for the given customer
			String countQuery = "SELECT COUNT(*) AS item_count FROM wishlist WHERE customer_id=?";
			ps = conn.prepareStatement(countQuery);
			ps.setInt(1, customerId);
			rs = ps.executeQuery();

			// Retrieve the item count from the result set
			if (rs.next()) {
				itemCount = rs.getInt("item_count");

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
		return itemCount;

	}
}
