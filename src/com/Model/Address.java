package com.Model;

public class Address {
	private int addressId;
	private String province;
	private String city;
	private String district;
	private String area;
	
	public Address(){
		super();
	}
	
	public Address(int addressId,String province,String city,String district,String area){
		this.addressId = addressId;
		this.province = province;
		this.city = city;
		this.district = district;
		this.area = area;
	}
	
	public void setAddressId(int addressId){
		this.addressId = addressId;
	}
	
	public int getAddressId(){
		return addressId;
	}
	
	public void setProvince(String province){
		this.province = province;
	}
	
	public String getProvince(){
		return province;
	}
	
	public void setCity(String city){
		this.city = city;
	}
	
	public String getCity(){
		return city;
	}
	
	public void setDistrict(String district){
		this.district = district;
	}
	
	public String getDistrict(){
		return district;
	}
	
	public void setArea(String area){
		this.area = area;
	}
	
	public String getArea(){
		return area;
	}
	
	@Override
	public String toString() {
		return "Address [addressId=" + addressId + ", province=" + province + ", city="
				+ city + ", area=" + area + "]";
	}
}
