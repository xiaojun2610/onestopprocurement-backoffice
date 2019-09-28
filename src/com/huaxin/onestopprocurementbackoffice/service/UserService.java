package com.huaxin.onestopprocurementbackoffice.service;

import com.huaxin.onestopprocurementbackoffice.po.User;
import com.huaxin.onestopprocurementbackoffice.po.UserCustom;

public interface UserService {
	//用户登录
  public  UserCustom login(User user) throws Exception;
  
   //用户注册
  public boolean register(UserCustom userCustom) throws Exception;
  
  //用户修改信息
  public boolean userUpdate(UserCustom userCustom) throws Exception;
  
  //检查用户是否存在
  public boolean usernameCheck(String username) throws Exception;
}
