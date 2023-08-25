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
import book.store.entity.Review;

public class ReviewService {

	public List<Review> showReview(int bookId) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList<Review>();
		Review review = null;
		try {
			conn = DBUtil.makeConnection();

			String query = "SELECT r.id, r.customer_id, r.date, r.title, r.description, c.userName FROM review r INNER JOIN customer c ON r.customer_id = c.id WHERE r.book_isbn =?";

			ps = conn.prepareStatement(query);
			ps.setInt(1, bookId);
			// execute and get result SET
			rs = ps.executeQuery();
			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int id = rs.getInt("id");
				int customerId = rs.getInt("customer_id");
				Date date = rs.getDate("date");
				String reviewTitle = rs.getString("title");
				String description = rs.getString("description");
				String userName = rs.getString("userName");

				review = new Review(id, bookId, customerId, date, reviewTitle, description, userName);
				list.add(review);
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

	public int checkDuplicateReview(Review review) throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int insertedId = 0;
		try {
			conn = DBUtil.makeConnection();

			// Check if the item already exists in the wishlist for the same customer
			String checkQuery = "SELECT id FROM review WHERE book_isbn = ? AND customer_id = ?";
			ps = conn.prepareStatement(checkQuery);
			ps.setInt(1, review.getBook_isbn());
			ps.setInt(2, review.getCustomer_id());
			rs = ps.executeQuery();

			if (rs.next()) {
				// Item already exists, do not add it again
				return -1;
			}
			// Insert the item into the wishlist
			String insertQuery = "INSERT INTO review (book_isbn, customer_id,title,description) VALUES (?, ?,?,?)";
			ps = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, review.getBook_isbn());
			ps.setInt(2, review.getCustomer_id());
			ps.setString(3, review.getReviewTitle());
			ps.setString(4, review.getDescription());
			ps.execute();

			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				insertedId = rs.getInt(1);
				return insertedId;
			}
		}

		catch (Exception e) {
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
}
