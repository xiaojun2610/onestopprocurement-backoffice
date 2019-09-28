package com.huaxin.onestopprocurementbackoffice.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.huaxin.onestopprocurementbackoffice.po.Item;
import com.huaxin.onestopprocurementbackoffice.po.ItemCustom;
import com.huaxin.onestopprocurementbackoffice.po.ItemExample;
import com.huaxin.onestopprocurementbackoffice.po.ItemQueryVo;

public interface ItemCustomMapper {
	//根据ID 查询商品
	public ItemCustom  selectByPrimaryKey(int itemId) throws Exception;
	//根据ID 删除商品
	public int deleteByPrimaryKey(int itemId) throws Exception;
	//添加商品
	public int insertSelective(Item item) throws Exception;
	//根据ID 更新商品部分信息
	public int updateByPrimaryKeySelective(Item item) throws Exception;
	//根据ID 更新商品
	public int updateByPrimaryKey(Item item) throws Exception;
	//查询商品数量
	public int queryItemCount(ItemQueryVo itemQueryVo) throws Exception;
	
	//获得所有商品名称
	public List<String> queryAllItemnames() throws Exception;
	//获有商品
	public List<ItemCustom> selectAllItems(ItemQueryVo itemQueryVo) throws Exception;
	//根据查询条件，获取商品
	public List<ItemCustom> selectItemsByCritera(ItemQueryVo itemQueryVo) throws Exception;
}