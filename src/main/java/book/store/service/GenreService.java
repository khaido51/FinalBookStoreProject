package book.store.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import book.store.db.util.DBUtil;
import book.store.entity.Genre;

public class GenreService {

	// get all Genres to display on the home page
	public List<Genre> getAllGenres() throws SQLException {

		// Connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Genre genre = null;
		List<Genre> list = new ArrayList<Genre>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();

			// Query to select all genre to display on the menu bar
			String query = "Select * from genre";

			// run query from table genre to get the data to displau
			ps = conn.prepareStatement(query);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				// set the result from db to the class properties
				int id = rs.getInt("id");
				String name = rs.getString("name");
				// passing the data by value to the new genre object
				genre = new Genre(id, name);
				// add the object the Genre List
				list.add(genre);

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
	
	public List<Genre> getNonFictionGenres() throws SQLException {

		// Connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Genre genre = null;
		List<Genre> list = new ArrayList<Genre>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();

			// Query to select all genre to display on the menu bar
			String query = "Select * from genre limit 0,6";

			// run query from table genre to get the data to displau
			ps = conn.prepareStatement(query);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				// set the result from db to the class properties
				int id = rs.getInt("id");
				String name = rs.getString("name");
				// passing the data by value to the new genre object
				genre = new Genre(id, name);
				// add the object the Genre List
				list.add(genre);

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
	public List<Genre> getFictionGenres() throws SQLException {

		// Connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Genre genre = null;
		List<Genre> list = new ArrayList<Genre>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();

			// Query to select all genre to display on the menu bar
			String query = "Select * from genre limit 6,7";

			// run query from table genre to get the data to displau
			ps = conn.prepareStatement(query);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				// set the result from db to the class properties
				int id = rs.getInt("id");
				String name = rs.getString("name");
				// passing the data by value to the new genre object
				genre = new Genre(id, name);
				// add the object the Genre List
				list.add(genre);

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
	public List<Genre> getChildrenGenres() throws SQLException {

		// Connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Genre genre = null;
		List<Genre> list = new ArrayList<Genre>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();

			// Query to select all genre to display on the menu bar
			String query = "Select * from genre limit 13,4";

			// run query from table genre to get the data to displau
			ps = conn.prepareStatement(query);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				// set the result from db to the class properties
				int id = rs.getInt("id");
				String name = rs.getString("name");
				// passing the data by value to the new genre object
				genre = new Genre(id, name);
				// add the object the Genre List
				list.add(genre);

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
