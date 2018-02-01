package com.Service;

import java.util.List;

import com.Model.Cart;

public interface CartService {
	public int addCart(Cart cart);
	public boolean deleteCart(Cart cart);
	public Cart getCartById(int cartId);
	public  List<Cart>  getCartsByCustId(int custId);
	public  List<Cart>  searchCart(String searchInput);

}
