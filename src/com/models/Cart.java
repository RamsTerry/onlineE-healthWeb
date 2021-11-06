package com.models;

public class Cart {

	private int CartNo;
	private int itemId;
	private String itemName;
	private String customerId;
	private String numberofmedicine;
	private int quantity;
	private double price;
	
	public int getCartNo() {
		return CartNo;
	}
	public void setCartNo(int cartNo) {
		CartNo = cartNo;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getNumberofmedicine() {
		return numberofmedicine;
	}
	public void setNumberofmedicine(String numberofmedicine) {
		this.numberofmedicine = numberofmedicine;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	
}
