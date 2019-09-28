package com.huaxin.onestopprocurementbackoffice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.huaxin.onestopprocurementbackoffice.mapper.AdminMapper;
import com.huaxin.onestopprocurementbackoffice.po.Admin;
import com.huaxin.onestopprocurementbackoffice.service.AdminService;

public class AdminServiceImpl implements AdminService {
   
	@Autowired
	 private AdminMapper adminMapper;
    
	@Override
	public boolean adminLogin(Admin admin) throws Exception {
		boolean flag=false;
		Admin adminback = adminMapper.selectByAdminName(admin.getAdminName());
		if(adminback!=null){
			if(adminback.getAdminPassword().equals(admin.getAdminPassword())){
				flag=true;
			}
		}
		
		return flag;
	}

	@Override
	public boolean adminUpdate(Admin admin) throws Exception {
		boolean flag =false;
		int f = adminMapper.updateByAdminName(admin);
		if(f>0){
			flag=true;
		}
		return flag;
	} 

	@Override
	public boolean adminInsert(Admin admin) throws Exception {
		boolean flag =false;
		int f = adminMapper.insertSelective(admin);
		if(f>0){
			flag=true;
		}
		return flag;
	}

}
