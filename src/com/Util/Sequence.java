package com.Util;

public class Sequence {
	static int  customerID = 100300;
	public static int getCutomerID(){
		return customerID++;
	}
	static int productID = 3600;
	public static int getProductID(){
		return productID++;
	}
	static int addreddID = 11111;
	public static int getAddressID(){
		return addreddID++;
	}
	static int orderID = 2600;
	public static int getOrderID(){
		return orderID++;
	}
	static int orderItemID = 11000;
	public static int getOrderItemID(){
		return orderItemID++;
	}

}
