package com.Service;

import com.Model.Customer;

public interface CustomerService {

	public Customer getByCustName(String custName);
	public Customer getByCustId(int custId);
	public int register(Customer cust);
	public Customer login(String custName, String password);
	public boolean update(Customer cust);
	
}
