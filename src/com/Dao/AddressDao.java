package com.Dao;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.Model.Address;
import com.Service.AddressService;
import com.Util.Constants;
import com.Util.StringUtil;

@Service
public class AddressDao implements AddressService{
	@Resource
	private JdbcTemplate jdbcTemplate;
	@SuppressWarnings("all")
	
	/**
	 * @description: 通过地址ID获取地址
	 * @author: liling
	 * @date:2017-04-15
	 * @param:int addressId
	 * @return:Address address
	 * */
	@Override
	public Address getAddressById(int addressId) {
		String sql = "SELECT ADDRESS_ID,PROVINCE,CITY,DISTRICT,AREA FROM ADDRESS WHERE ADDRESS_ID = ? ";
		try{
			Map addressMap = this.getJdbcTemplate().queryForMap(sql,addressId);
			if(addressMap.isEmpty()){
				return null;
			}
			else{
				Address address = new Address();
				address.setAddressId(StringUtil.StringToInt(addressMap.get("ADDRESS_ID").toString()));
				address.setProvince(addressMap.get("PROVINCE").toString());
				address.setCity(addressMap.get("CITY").toString());
				address.setDistrict(addressMap.get("DISTRICT").toString());
				address.setArea(addressMap.get("AREA").toString());
				return address;
			}
		}catch (Exception e){
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * @description: 添加地址信息
	 * @author: liling
	 * @date:2017-04-15
	 * @param:Address address
	 * @return:int addressId
	 * */
	@Override
	public int addAddress(Address address) {
		int addressID;
		String sqlID = "SELECT MAX(ADDRESS_ID) AS MAXID FROM ADDRESS";
		Map IDmap = this.jdbcTemplate.queryForMap(sqlID);
		if(IDmap.isEmpty()){
			addressID = Constants.ADDRESS_BEGINID;
		}
		else{
			int addressMaxID = StringUtil.StringToInt(IDmap.get("MAXID").toString());
			addressID = addressMaxID + 1;
		}
		
		String sql = "INSERT INTO ADDRESS(ADDRESS_ID,PROVINCE,CITY,DISTRICT,AREA) VALUES(?,?,?,?,?) ";
		int result = jdbcTemplate.update(
				sql,
				new Object[]{addressID,address.getProvince(),
						address.getCity(),address.getDistrict(),address.getArea()});
		if(result>0){
			return addressID;
		}
		return Constants.NO_ADDRESS;
	}

	/**
	 * @description: 更新地址信息
	 * @author: liling
	 * @date:2017-04-15
	 * @param:Address address
	 * @return:boolean
	 * */
	@Override
	public boolean updateAddress(Address address) {
		String sql = "UPDATE ADDRESS SET PROVINCE = '" + address.getProvince() + "',CITY = '" + address.getCity()
					+"',DISTRICT = '" + address.getDistrict()+ "', AREA = '" + address.getArea() + "' WHERE ADDRESS_ID = " + address.getAddressId();
		int result = jdbcTemplate.update(sql);
		if(result > 0){
			return true;
		}
		return false;
	}
	
	/**
	 * @description: 根据地址ID删除地址
	 * @author: liling
	 * @date:2017-04-16
	 * @param:int addressId
	 * @return:boolean
	 * */
	@Override
	public boolean deleteAddressById(int addressId) {
		String sql = "DELETE FROM ADDRESS WHERE  ADDRESS_ID = ?";
		int result = jdbcTemplate.update(sql, addressId);
		if(result > 0){
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
