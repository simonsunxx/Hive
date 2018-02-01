package com.Service;

import com.Model.Address;

public interface AddressService {
	public Address getAddressById(int addressId);
	public int addAddress(Address address);
	public boolean updateAddress(Address address);
	public boolean deleteAddressById(int addressId);
}
