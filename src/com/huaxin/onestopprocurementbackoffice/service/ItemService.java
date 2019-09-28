package com.huaxin.onestopprocurementbackoffice.service;

import java.util.List;

import com.huaxin.onestopprocurementbackoffice.po.Item;
import com.huaxin.onestopprocurementbackoffice.po.ItemCustom;
import com.huaxin.onestopprocurementbackoffice.po.ItemQueryVo;
import com.huaxin.onestopprocurementbackoffice.po.Itemclasses;

public interface ItemService {
	
  public boolean addItem(Item item) throws Exception;

  public boolean IsItemNameExist(String itemName) throws Exception;

	public List<ItemCustom> queryAllItems(ItemQueryVo itemQueryVo)throws Exception ;
	
	public List<Itemclasses> queryItemclasses() throws Exception;
	
	public boolean deleteItem(int id) throws  Exception;
	
	public ItemCustom queryItemById(int id) throws Exception;

	public boolean updateItem(ItemCustom itemCustom) throws Exception;

	public int queryItemCount(ItemQueryVo itemQueryVo) throws Exception;
	public List<ItemCustom> queryItemsByCriteria(ItemQueryVo itemQueryVo) throws Exception;


  
  
}
