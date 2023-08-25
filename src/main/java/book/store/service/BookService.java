package book.store.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import book.store.entity.Author;
import book.store.entity.Book;
import book.store.entity.OrderDetails;
import book.store.db.util.*;

public class BookService {

	// Create a function to get all Books by ID
	public List<Book> getBooksByGenreId(int genreId) throws SQLException {

		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT b.isbn, b.title, b.price, b.edition, b.stock, b.description FROM book b join books_genre bg on b.isbn = bg.book_isbn join genre g on bg.genre_id =g.id where g.id =?";
			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);
			ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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

	public List<Book> getBooksByName(String bookName) throws SQLException {

		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book where title like ?";

			ps = conn.prepareStatement(query);
			ps.setString(1, "%" + bookName + "%");
			// ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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

	public Book getBookDetails(int bookId) throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book where isbn = ?";

			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);

			ps.setInt(1, bookId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			if (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String publisher = rs.getString("publisher");
				String subtitle = rs.getString("subtitle");
				String dimension = rs.getString("dimension");
				String language = rs.getString("language");
				String description = rs.getString("description");
				String series = rs.getString("series");
				String format = rs.getString("format");
				String publicdate = rs.getString("publicdate");
				int page = rs.getInt("page");
				String imglink = rs.getString("imglink");

				book = new Book(isbn, title, price, edition, stock, publisher, subtitle, dimension, language, series,
						format, publicdate, description, page, imglink);

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

		return book;
	}

	public Author getAuthorOnBookDetails(int bookId) throws SQLException {

		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		Author author = null;

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT a.id, a.name FROM book b join book_author ba on b.isbn = ba.isbn join author a on ba.author_id = a.id where b.isbn = ?";
			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);
			ps.setInt(1, bookId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS

			if (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");

				author = new Author(id, name);

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

		return author;

	}

	public List<Book> getAllBooks() throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book";

			ps = conn.prepareStatement(query);
			// ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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

	public int getTotalPage() throws SQLException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "select count(*) as total_page from book";

			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			if (rs.next()) {
				int totalBook = rs.getInt("total_page");
				return (int) Math.ceil((double) totalBook / 7);
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

		return 0;
	}
	
	public int getTotalPageFromGenre(int genreId) throws SQLException{
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "select count(*) as total_page from book \r\n"
					+ "join books_genre bg on book.isbn = bg.book_isbn\r\n"
					+ "join genre g on bg.genre_id = g.id \r\n"
					+ "where g.id = ?;";

			ps = conn.prepareStatement(query);
			ps.setInt(1, genreId);
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int totalBook = rs.getInt("total_page");
				return (int) Math.ceil((double) totalBook / 7);
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

		
		
		return 0;
	}
	
	

	public List<Book> getBooksByPage(int page) throws SQLException {

		// Connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();

			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement("SELECT * FROM book LIMIT ?,?");
			ps.setInt(1, (page - 1) * 7);
			ps.setInt(2, 7);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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
	
	public List<Book> getBooksByPageBelongToGenre(int page, int genreId) throws SQLException {

		// Connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();

			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement("select * from book "
				    + "join books_genre bg on book.isbn = bg.book_isbn "
				    + "join genre g on bg.genre_id = g.id "
				    + "where g.id = ? LIMIT ?, ?");
				ps.setInt(1, genreId);
				ps.setInt(2, (page - 1) * 7);
				ps.setInt(3, 7);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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

	public int getBookISBNFromName(String bookName) throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int isbn = -1;
		Book book = null;

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT isbn FROM book where book.title = ?";
			ps = conn.prepareStatement(query);
			ps.setString(1, bookName);

			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			if (rs.next()) {
				if (rs.next()) {
					isbn = rs.getInt("isbn");
				}

				book = new Book(isbn);

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

		return isbn;
	}

	public List<Book> getThreeBooks() throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book order by rand() limit 3";

			ps = conn.prepareStatement(query);
			// ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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

	public List<Book> getFeaturedBook() throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book order by rand() limit 10";

			ps = conn.prepareStatement(query);
			// ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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

	public List<Book> getSmallBookList(int bookId) throws SQLException {

		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT b.isbn, b.title,b.price FROM book b JOIN books_genre bg ON b.isbn = bg.book_isbn WHERE bg.genre_id IN (\r\n"
					+ "    SELECT genre_id\r\n" + "    FROM books_genre\r\n" + "    WHERE book_isbn = ?) limit 0,8";
			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);
			ps.setInt(1, bookId);
			// execute and get result SET
			rs = ps.executeQuery();
			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");

				book = new Book(isbn, title, price);
				list.add(book);
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

	public List<Book> getBooksSameAuthors(int bookId) throws SQLException {

		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT b.isbn, b.title,b.price FROM book b JOIN book_author ba ON b.isbn = ba.isbn WHERE ba.author_id IN (  SELECT author_id FROM book_author WHERE book_author.isbn = ?) limit 0,3";
			// String query = "SELECT * FROM book where category_id = ?";
			// -> table Category
			// Run query "Select * from category"
			ps = conn.prepareStatement(query);
			ps.setInt(1, bookId);
			// execute and get result SET
			rs = ps.executeQuery();
			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");

				book = new Book(isbn, title, price);
				list.add(book);
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

	public List<Book> getMonthlyDisplay() throws SQLException {
        // connect to DB
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Book book = null;
        List<Book> list = new ArrayList<Book>();

        try {
            // make connection to mysql
            conn = DBUtil.makeConnection();
            String query = "SELECT * FROM book where monthlydis=true order by rand() limit 0,2";

            ps = conn.prepareStatement(query);
            // ps.setInt(1, genreId);
            // execute and get result SET
            rs = ps.executeQuery();

            // mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
            while (rs.next()) {
                int isbn = rs.getInt("isbn");
                String title = rs.getString("title");
                double price = rs.getDouble("price");
                int edition = rs.getInt("edition");
                int stock = rs.getInt("stock");
                String description = rs.getString("description");

                book = new Book(isbn, title, price, edition, stock, description);
                list.add(book);
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

	public List<Book> getNewBook() throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "SELECT * FROM book where newarrival=true";

			ps = conn.prepareStatement(query);
			// ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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

	public List<Book> getSkillBooks(int genreId) throws SQLException {
		// connect to DB
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book = null;
		List<Book> list = new ArrayList<Book>();

		try {
			// make connection to mysql
			conn = DBUtil.makeConnection();
			String query = "select * from book join books_genre on book.isbn=books_genre.book_isbn where genre_id="
					+ genreId + " limit 2,3";

			ps = conn.prepareStatement(query);
			// ps.setInt(1, genreId);
			// execute and get result SET
			rs = ps.executeQuery();

			// mapping data in result set (IF RESULT SET HAS DATA) into ENTITY CLASS
			while (rs.next()) {
				int isbn = rs.getInt("isbn");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				int edition = rs.getInt("edition");
				int stock = rs.getInt("stock");
				String description = rs.getString("description");

				book = new Book(isbn, title, price, edition, stock, description);
				list.add(book);
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
