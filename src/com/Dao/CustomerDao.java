package com.Dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCountCallbackHandler;
import org.springframework.stereotype.Service;

import com.Model.Customer;
import com.Service.CustomerService;
import com.Util.Constants;
import com.Util.DateUtil;
import com.Util.StringUtil;

@Service
public class CustomerDao implements CustomerService{
	@Resource
	private JdbcTemplate jdbcTemplate;
	@SuppressWarnings("all")
	
	/**
	 * @description:根据用户名查询用户信息
	 * @param  String custName
	 * @return Customer
	 * @author liling
	 * */
	@Override
	public Customer getByCustName(String custName) {
		String sql = "SELECT CUST_ID,CUST_NAME,PHONENUMBER,EMAIL,"
				+ "BIRTHDATE,GENDER,CUST_PASSWORD,CUST_CASHES,CUST_ADDRESS"
				+ " FROM CUSTOMERS WHERE CUST_NAME =?";
		try {
			List custList = this.getJdbcTemplate().queryForList(sql, new Object[]{custName});
			if(custList.isEmpty()){
				return null;
			}
			else{
				Iterator iterator = custList.iterator();
				Customer customer = new Customer();
				while(iterator.hasNext()){
					Map custMap = (Map) iterator.next();
					customer.setCustId(StringUtil.StringToInt(custMap.get("CUST_ID").toString()));
					customer.setCustName(custMap.get("CUST_NAME").toString());
					customer.setPhoneNumber(custMap.get("PHONENUMBER").toString());
					customer.setEmail(custMap.get("EMAIL").toString());
					customer.setBirthdate(custMap.get("BIRTHDATE").toString());
					customer.setGender(custMap.get("GENDER").toString());
					customer.setCustPassword(custMap.get("CUST_PASSWORD").toString());

					customer.setCustCashes(StringUtil.strToFloat(custMap.get("CUST_CASHES").toString()));
					if(custMap.get("CUST_ADDRESS")== null){
						customer.setCustAddress(Constants.NO_ADDRESS);
					}
					else
					customer.setCustAddress(StringUtil.StringToInt(custMap.get("CUST_ADDRESS").toString()));	
				}
				return customer;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	/**
	 * @description:根据用户ID查询用户信息
	 * @param  int custId
	 * @return Customer
	 * @author liling
	 * */
	@Override
	public Customer getByCustId(int custId) {
		String sql = "SELECT CUST_ID,CUST_NAME,PHONENUMBER,EMAIL,"
				+ "BIRTHDATE,GENDER,CUST_PASSWORD,CUST_CASHES,CUST_ADDRESS"
				+ " FROM CUSTOMERS WHERE CUST_ID =?";
		try {
			List custList = this.getJdbcTemplate().queryForList(sql, new Object[]{custId});
			SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd" );
			List<Customer> customerList = new ArrayList<Customer>();
			Iterator iterator = custList.iterator();
			Customer customer = new Customer();
			while(iterator.hasNext()){
				Map custMap = (Map) iterator.next();
				customer.setCustId(StringUtil.StringToInt(custMap.get("CUST_ID").toString()));
				customer.setCustName(custMap.get("CUST_NAME").toString());
				customer.setPhoneNumber(custMap.get("PHONENUMBER").toString());
				customer.setEmail(custMap.get("EMAIL").toString());
				customer.setBirthdate(custMap.get("BIRTHDATE").toString());
				customer.setGender(custMap.get("GENDER").toString());
				customer.setCustPassword(custMap.get("CUST_PASSWORD").toString());
				customer.setCustCashes(StringUtil.strToFloat(custMap.get("CUST_CASHES").toString()));
				if(custMap.get("CUST_ADDRESS")== null){
					customer.setCustAddress(Constants.NO_ADDRESS);
				}
				else
				customer.setCustAddress(StringUtil.StringToInt(custMap.get("CUST_ADDRESS").toString()));		
			}
			return customer;
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * @description:用户注册
	 * @param  Customer cust
	 * @return int custId
	 * @author liling
	 * */
	@Override
	public int register(Customer cust) {
	
			String sqlID = "SELECT MAX(CUST_ID) AS MAXID FROM CUSTOMERS ";
			Map IDmap = this.getJdbcTemplate().queryForMap(sqlID);
			int customerMaxID = StringUtil.StringToInt(IDmap.get("MAXID").toString());
			int custId = customerMaxID + 1;
			String sql = "INSERT INTO CUSTOMERS(CUST_ID, CUST_NAME,PHONENUMBER,EMAIL,"
					+ "BIRTHDATE,GENDER,CUST_PASSWORD,CUST_CASHES) VALUES(?,?,?,?,?,?,?,?)";
			int result = jdbcTemplate.update(
					sql,
					new Object[] { custId, cust.getCustName(),
							 cust.getPhoneNumber(),cust.getEmail(), 
							 cust.getBirthdate(),cust.getGender(), cust.getCustPassword(),
							cust.getCustCashes()});

			if (result > 0) {
				return custId;
			}
			return Constants.NO_CUSTID;
			
		
	}

	/**
	 * @description:用户登录
	 * @param  String custName, String password
	 * @return Customer
	 * @author liling
	 * */
	@Override
	public Customer login(String custName, String password) {
		Customer cust = this.getByCustName(custName);
		if (cust.getCustPassword().equals(password) ) {
			return cust;
		}
		return null;
	}

	/**
	 * @description:用户信息修改保存
	 * @param  Customer cust
	 * @return Boolean
	 * @author liling
	 * */
	@Override
	public boolean update(Customer cust) {
		String sql = "UPDATE CUSTOMERS SET PHONENUMBER = '" + cust.getPhoneNumber()+"' , EMAIL = '"+cust.getEmail()
				+ "', BIRTHDATE = '"+cust.getBirthdate()+"',  GENDER = '"+cust.getGender()
				+ "', CUST_PASSWORD = '"+cust.getCustPassword()+"', CUST_CASHES= "+cust.getCustCashes()
				+ " WHERE CUST_ID = "+cust.getCustId();
		int result = jdbcTemplate.update(sql);

		if (result > 0) {
			return true;
		}
		return false;
		
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
