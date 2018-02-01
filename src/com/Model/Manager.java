package com.Model;

public class Manager {
	private int managerId;
	private String managerName;
	private String managerPassword;
	
	public Manager(){
		super();
	}

	public Manager(int managerId,String managerName,String managerPassword){
		this.managerId = managerId;
		this.managerName = managerName;
		this.managerPassword = managerPassword;
	}
	
	public void setManagerId(int managerId){
		this.managerId = managerId;
	}
	
	public int getManagerId(){
		return managerId;
	}
	
	public void setManagerName(String managerName){
		this.managerName = managerName;
	}
	
	public String getManagerName(){
		return managerName;
	}
	
	public void setManagerPassword(String managerPassword){
		this.managerPassword = managerPassword;
	}
	
	public String getManagerPassword(){
		return managerPassword;
	}
	
	@Override
	public String toString() {
		return "Manger [managerId=" + managerId + ", managerName=" + managerName + ", managerPassword="
				+ managerPassword + "]";
	}
}
