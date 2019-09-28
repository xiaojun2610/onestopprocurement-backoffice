package com.huaxin.onestopprocurementbackoffice.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.huaxin.onestopprocurementbackoffice.po.Admin;
public interface AdminMapper {
	public Admin selectByAdminName(String adminName) throws Exception;
	public int insertSelective(Admin admin) throws Exception;
	public int updateByAdminName(Admin admin) throws Exception;

}