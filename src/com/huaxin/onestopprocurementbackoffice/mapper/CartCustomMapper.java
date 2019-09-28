package com.huaxin.onestopprocurementbackoffice.mapper;

import com.huaxin.onestopprocurementbackoffice.po.CartCustom;
import com.huaxin.onestopprocurementbackoffice.po.UserCustom;

public interface CartCustomMapper {
	
	 public CartCustom queryCartByUserId(UserCustom userCustom) throws Exception;
	 
}
