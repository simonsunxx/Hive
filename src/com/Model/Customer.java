package com.Model;


public class Customer {
	private int custId;
	private String custName;
	private String phoneNumber;
	private String email;
	private String birthdate;
	private String gender;
	private String custPassword;
	private float custCashes;
	private int custAddress;
	
	public Customer(){
		super();
	}
	
	public Customer(int custId,String custName,
			String phoneNumber,String email,String birthdate,String gender,String custPassword,
			float custCashes,int custAddress){
		this.custId = custId;
		this.custName = custName;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.birthdate = birthdate;
		this.gender = gender;
		this.custPassword = custPassword;
		this.custCashes = custCashes;
		this.custAddress = custAddress;
	}
	
	public void setCustId(int custId){
		this.custId = custId;
	}
	
	public int getCustId(){
		return custId;
	}
	
	public void setCustName(String custName){
		this.custName = custName;
	}
	
	public String getCustName(){
		return custName;
	}
	
	
	public void setPhoneNumber(String phoneNumber){
		this.phoneNumber = phoneNumber;
	}
	
	public String getPhoneNumber(){
		return phoneNumber;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getEmail(){
		return email;
	}

	public void setBirthdate(String birthdate){
		this.birthdate = birthdate;
	}
	
	public String getBirthdate(){
		return birthdate;
	}
	
	public void setGender(String gender){
		this.gender = gender;
	}
	
	public String getGender(){
		return gender;
	}
	
	public void setCustPassword(String custPassword){
		this.custPassword = custPassword;
	}
	
	public String getCustPassword(){
		return custPassword;
	}
	
	public void setCustCashes(float custCashes){
		this.custCashes = custCashes;
	}
	
	public float getCustCashes(){
		return custCashes;
	}
	
	public void setCustAddress(int custAddress){
		this.custAddress = custAddress;
	}
	
	public int getCustAddress(){
		return custAddress;
	}
	
	@Override
	public String toString() {
		return "Customer [custId=" + custId + ", custName=" + custName +", phoneNumber=" + phoneNumber + ", email=" + email
				+ ", birthdate=" + birthdate +  ", gender=" + gender +", custPassword=" + custPassword + 
				", custCashes=" + custCashes + ", custAddress=" + custAddress + "]";
	}
}
