package com.huaxin.onestopprocurementbackoffice.service;

import com.huaxin.onestopprocurementbackoffice.po.Admin;

public interface AdminService {
	
   public boolean adminLogin(Admin admin) throws Exception;
  
   public boolean adminUpdate(Admin admin) throws Exception;
  
   public boolean adminInsert(Admin admin) throws Exception;
}
