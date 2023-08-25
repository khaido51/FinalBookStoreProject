package book.store.dto;

import java.util.Map;

import book.store.entity.Book;

public class CartSession {
	private int customerId;
	private Map<Integer, Book> books;
	private double totalPrice;
	private int amount;
	
	
	
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public Map<Integer, Book> getBooks() {
		return books;
	}

	public void setBooks(Map<Integer, Book> books) {
		this.books = books;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
