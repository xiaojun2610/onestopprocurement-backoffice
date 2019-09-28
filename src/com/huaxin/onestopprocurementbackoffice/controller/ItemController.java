package com.huaxin.onestopprocurementbackoffice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.huaxin.onestopprocurementbackoffice.po.Item;
import com.huaxin.onestopprocurementbackoffice.po.ItemCustom;
import com.huaxin.onestopprocurementbackoffice.po.ItemQueryVo;
import com.huaxin.onestopprocurementbackoffice.po.Itemclasses;
import com.huaxin.onestopprocurementbackoffice.po.Pagination;
import com.huaxin.onestopprocurementbackoffice.service.ItemService;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/gotoadditem.action")
	public ModelAndView gotoAddItem() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		List<Itemclasses> itemclasses = itemService.queryItemclasses();
		modelAndView.addObject("itemclasses", itemclasses);
		modelAndView.setViewName("item/itemadd");
		return modelAndView;
	}
	
	@RequestMapping("/add.action")
	public ModelAndView addItem(
			ItemCustom itemCustom,
			HttpServletRequest request,
			MultipartFile items_pic1,
			MultipartFile items_pic2,
			MultipartFile items_pic3,
			MultipartFile items_pic4,
			MultipartFile items_pic5,
			MultipartFile items_pic6,
			MultipartFile items_pic7,
			MultipartFile items_pic8
			) throws Exception{
		itemCustom = addImg(itemCustom,items_pic1,items_pic2,items_pic3,items_pic4,items_pic5,items_pic6,items_pic7,items_pic8);
		 boolean flag = itemService.addItem(itemCustom);
		 ModelAndView modelAndView = new ModelAndView();
		 if(flag){
			 String msg = "success";
			 modelAndView.addObject("msg", msg);
		 }
		 else{
    		 String msg = "fail";
    		 modelAndView.addObject("msg", msg);
	     }
		 modelAndView.setViewName("forward:gotoadditem.action");
		 return modelAndView;
	}
	
	@RequestMapping("/ItemNameCheckJson.action")
	   public void itemnameCheck(HttpServletRequest request,HttpServletResponse response) throws Exception{
		   String msg=null;
		   String name=request.getParameter("itemName");
		   boolean flag = itemService.IsItemNameExist(name);
		   response.setContentType(" text/html;charset=UTF-8");
		   if(flag){
			   response.getWriter().write("<font>此商品名已存在</font>");
			}
		   else{
			   
			   response.getWriter().write("<font></font>");
		   }
	   }
	@RequestMapping("/itemquery.action")
	public ModelAndView gotoitemquery() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		ItemQueryVo itemQueryVo = new ItemQueryVo();
		 ItemCustom itemCustom = new ItemCustom();
		if (itemQueryVo.getItemCustom() == null) {  
			itemQueryVo.setItemCustom(new ItemCustom());  
        }
		List<Itemclasses> itemclasses = itemService.queryItemclasses();
	    int itemsCount  = itemService.queryItemCount(itemQueryVo);
	    Pagination page= new Pagination(itemsCount,1);
	    if (itemQueryVo.getPage() == null) {  
	    	itemQueryVo.setPage(page);  
	    }
	    List<ItemCustom> itemList = itemService.queryAllItems(itemQueryVo);
	    itemCustom.setItemCustomlist(itemList);
	    itemCustom.setPagination(page);
		modelAndView.addObject("itemclasses", itemclasses);
		modelAndView.addObject("itemCustom", itemCustom);
		modelAndView.setViewName("item/itemquery");
		return modelAndView;
		
	}
	
	@RequestMapping("/itemqueryAjax.action")
	public @ResponseBody ItemCustom itemqueryAjax(ItemCustom itemCustom) throws Exception{
		ItemQueryVo itemQueryVo = new ItemQueryVo();
		itemQueryVo.setItemCustom(itemCustom);
		int itemsCount  = itemService.queryItemCount(itemQueryVo);
	    Pagination page= new Pagination(itemsCount,itemCustom.getPageNo());
		itemQueryVo.setPage(page);
		List<ItemCustom> itemlist = itemService.queryAllItems(itemQueryVo);
		itemCustom.setItemCustomlist(itemlist);
		itemCustom.setPagination(page);
		return itemCustom;
		
	}
	
	@RequestMapping("/deleteItem.action")
	public ModelAndView deleteItem(int itemId,HttpServletResponse response) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		boolean flag = itemService.deleteItem(itemId);
		if(flag){
			String msg = "deletesuccess";
			modelAndView.addObject("msg", msg);	
		}else{
			String msg = "deletefail";
			modelAndView.addObject("msg", msg);	
		}
		modelAndView.setViewName("forward:itemquery.action");
		return modelAndView;
	}
	
	@RequestMapping("/editItem.action") 
	public ModelAndView editItem(int itemId) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		ItemCustom itemCustom =itemService.queryItemById(itemId);
		if(itemCustom==null){
		}
		else{
			List<Itemclasses> itemclasses = itemService.queryItemclasses();
			modelAndView.addObject("itemclasses", itemclasses);
			modelAndView.addObject("item", itemCustom);
		}
		modelAndView.setViewName("item/itemedit");
		return modelAndView;
	}
	@RequestMapping("/edititemsubmit.action") 
	public ModelAndView editSubmit(
			ItemCustom itemCustom,
			MultipartFile items_pic1,
			MultipartFile items_pic2,
			MultipartFile items_pic3,
			MultipartFile items_pic4,
			MultipartFile items_pic5,
			MultipartFile items_pic6,
			MultipartFile items_pic7,
			MultipartFile items_pic8
			) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		 //图片原始名称
		itemCustom=editImg(itemCustom,items_pic1,items_pic2,items_pic3,items_pic4,items_pic5,items_pic6,items_pic7,items_pic8);
		boolean tflag = itemService.updateItem(itemCustom);
		if(tflag){
			String msg = "editsuccess";
			modelAndView.addObject("msg", msg);	
			modelAndView.setViewName("forward:editItem.action");
		}else{
			String msg = "editfail";
			modelAndView.addObject("msg", msg);	
			modelAndView.setViewName("forward:editItem.action");
			
		}
		return modelAndView;
	}
	
	@RequestMapping("/itemquerybycriteriaAjax.action")
	public @ResponseBody ItemCustom queryItemsByCriteriaAjax(ItemCustom itemCustom) throws Exception{
		ItemQueryVo itemQueryVo = new ItemQueryVo();
		itemQueryVo.setItemCustom(itemCustom);
		int itemsCount  = itemService.queryItemCount(itemQueryVo);
	    Pagination page= new Pagination(itemsCount,itemCustom.getPageNo());
		itemQueryVo.setPage(page);
		List<ItemCustom> itemlist = itemService.queryItemsByCriteria(itemQueryVo);
		itemCustom.setItemCustomlist(itemlist);
		itemCustom.setPagination(page);
		return itemCustom;
	}
	 @RequestMapping("/itemquerybycriteria.action")
	 public ModelAndView queryItemsByCrteria(ItemCustom itemCustom) throws Exception{
		 ModelAndView modelAndView = new ModelAndView();
		 ItemQueryVo itemQueryVo = new ItemQueryVo();
		 itemQueryVo.setItemCustom(itemCustom);
			if(itemCustom.getItemClass()!=null){
				itemCustom.setClassName(itemCustom.getItemClass());
			}
			int itemsCount  = itemService.queryItemCount(itemQueryVo);
			 Pagination page= new Pagination(itemsCount,1);
			    if (itemQueryVo.getPage() == null) {  
			    	itemQueryVo.setPage(page);  
			    }
			if (itemQueryVo.getItemCustom() == null) {  
				itemQueryVo.setItemCustom(itemCustom);  
	        }
			List<ItemCustom> itemList = itemService.queryItemsByCriteria(itemQueryVo);
			List<Itemclasses> itemclasses = itemService.queryItemclasses();
			itemCustom.setItemCustomlist(itemList);
			itemCustom.setPagination(page);
			modelAndView.addObject("itemclasses", itemclasses);
			modelAndView.addObject("itemCustom", itemCustom);
			modelAndView.setViewName("item/itemquery");
		return modelAndView;
	 }
	
	@RequestMapping("/scopeItem.action")
	public ModelAndView scopeItem(int itemId) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		ItemCustom itemCustom = itemService.queryItemById(itemId);
		modelAndView.addObject("item", itemCustom);
		modelAndView.setViewName("item/itemscope");
		return modelAndView;
		
	}
	
	private ItemCustom addImg(
			ItemCustom itemCustom,
			MultipartFile items_pic1,
			MultipartFile items_pic2,
			MultipartFile items_pic3,
			MultipartFile items_pic4,
			MultipartFile items_pic5,
			MultipartFile items_pic6,
			MultipartFile items_pic7,
			MultipartFile items_pic8) throws Exception{
		 //图片原始名称
		String originalFilename1 = items_pic1.getOriginalFilename();
		//上传图片
		if(items_pic1!=null && originalFilename1!=null && originalFilename1.length()>0){
			//存储图片的物理路径
			String pic_path = "F:\\upload\\temp\\";
			String subpath=new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			//新的图片名称
			String newFileName =subpath+ UUID.randomUUID() + originalFilename1.substring(originalFilename1.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path+newFileName);
			
			//将内存中的数据写入磁盘
			items_pic1.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			itemCustom.setItemImg1(newFileName);
		}
       //图片原始名称
		String originalFilename2 = items_pic2.getOriginalFilename();
		//上传图片
		if(items_pic1!=null && originalFilename2!=null && originalFilename2.length()>0){
			
			//存储图片的物理路径
			String pic_path = "F:\\upload\\temp\\";
			String subpath=new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			//新的图片名称
			String newFileName = subpath+UUID.randomUUID() + originalFilename2.substring(originalFilename2.lastIndexOf("."));
			//新图片
		   System.out.println(newFileName);
			File newFile = new File(pic_path+newFileName);
			System.out.println(pic_path+newFileName);
			//将内存中的数据写入磁盘
			items_pic2.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			itemCustom.setItemImg2(newFileName);
		}
	    //图片原始名称
		String originalFilename3 = items_pic3.getOriginalFilename();
		//上传图片
		if(items_pic3!=null && originalFilename3!=null && originalFilename3.length()>0){
			
			//存储图片的物理路径
			String pic_path = "F:\\upload\\temp\\";
			String subpath=new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			//新的图片名称
			String newFileName = subpath+UUID.randomUUID() + originalFilename3.substring(originalFilename3.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path+newFileName);
			
			//将内存中的数据写入磁盘
			items_pic3.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			itemCustom.setItemImg3(newFileName);
		}
		String originalFilename4 = items_pic4.getOriginalFilename();
		//上传图片
		if(items_pic4!=null && originalFilename4!=null && originalFilename4.length()>0){
			
			//存储图片的物理路径
			String pic_path = "F:\\upload\\temp\\";
			String subpath=new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			//新的图片名称
			String newFileName = subpath+UUID.randomUUID() + originalFilename4.substring(originalFilename4.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path+newFileName);
			
			//将内存中的数据写入磁盘
			items_pic4.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			itemCustom.setItemDescimg1(newFileName);
		}
		String originalFilename5 = items_pic5.getOriginalFilename();
		//上传图片
		if(items_pic5!=null && originalFilename5!=null && originalFilename5.length()>0){
			
			//存储图片的物理路径
			String pic_path = "F:\\upload\\temp\\";
			String subpath=new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			//新的图片名称
			String newFileName = subpath+UUID.randomUUID() + originalFilename5.substring(originalFilename5.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path+newFileName);
			
			//将内存中的数据写入磁盘
			items_pic5.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			itemCustom.setItemDescimg2(newFileName);
		}
		String originalFilename6 = items_pic6.getOriginalFilename();
		//上传图片
		if(items_pic6!=null && originalFilename6!=null && originalFilename6.length()>0){
			
			//存储图片的物理路径
			String pic_path = "F:\\upload\\temp\\";
			String subpath=new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			//新的图片名称
			String newFileName = subpath+UUID.randomUUID() + originalFilename6.substring(originalFilename6.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path+newFileName);
			
			//将内存中的数据写入磁盘
			items_pic6.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			itemCustom.setItemDescimg3(newFileName);
		}
		String originalFilename7 = items_pic7.getOriginalFilename();
		//上传图片
		if(items_pic7!=null && originalFilename7!=null && originalFilename7.length()>0){
			
			//存储图片的物理路径
			String pic_path = "F:\\upload\\temp\\";
			String subpath=new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			//新的图片名称
			String newFileName = subpath+UUID.randomUUID() + originalFilename7.substring(originalFilename7.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path+newFileName);
			
			//将内存中的数据写入磁盘
			items_pic7.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			itemCustom.setItemDescimg4(newFileName);
		}
		String originalFilename8 = items_pic8.getOriginalFilename();
		//上传图片
		if(items_pic8!=null && originalFilename8!=null && originalFilename8.length()>0){
			
			//存储图片的物理路径
			String pic_path = "F:\\upload\\temp\\";
			String subpath=new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			//新的图片名称
			String newFileName = subpath+UUID.randomUUID() + originalFilename8.substring(originalFilename8.lastIndexOf("."));
			//新图片
			File newFile = new File(pic_path+newFileName);
			
			//将内存中的数据写入磁盘
			items_pic8.transferTo(newFile);
			
			//将新图片名称写到itemsCustom中
			itemCustom.setItemDescimg5(newFileName);
		}
		return itemCustom;
	}
	 private ItemCustom editImg(
			ItemCustom itemCustom,
			MultipartFile items_pic1,
			MultipartFile items_pic2,
			MultipartFile items_pic3,
			MultipartFile items_pic4,
			MultipartFile items_pic5,
			MultipartFile items_pic6,
			MultipartFile items_pic7,
			MultipartFile items_pic8
			 ) throws Exception{
			ItemCustom olditem = itemService.queryItemById(itemCustom.getItemId());
	    	String theprepath1=olditem.getItemImg1();
			String theprepath2=olditem.getItemImg2();
			String theprepath3=olditem.getItemImg3();
			String theprepath4=olditem.getItemDescimg1();
			String theprepath5=olditem.getItemDescimg2();
			String theprepath6=olditem.getItemDescimg3();
			String theprepath7=olditem.getItemDescimg4();
			String theprepath8=olditem.getItemDescimg5();
			String fold= "";
			boolean flag[] = new boolean[]{false,false,false,false,false,false,false,false};
			if(theprepath1!=null ){
				flag[0]=true;
				fold=theprepath1.substring(0, theprepath1.lastIndexOf("\\")+1);
			}
			if(theprepath2!=null  ){
				flag[1]=true;
				fold=theprepath2.substring(0, theprepath2.lastIndexOf("\\")+1);
			}
			if(theprepath3!=null  ){
				flag[2]=true;
				fold=theprepath3.substring(0, theprepath3.lastIndexOf("\\")+1);
			}
			if(theprepath4!=null  ){
				flag[3]=true;
				fold=theprepath4.substring(0, theprepath4.lastIndexOf("\\")+1);
			}
			if(theprepath5!=null  ){
				flag[4]=true;
				fold=theprepath5.substring(0, theprepath5.lastIndexOf("\\")+1);
			}
			if(theprepath6!=null ){
				flag[5]=true;
				fold=theprepath3.substring(0, theprepath6.lastIndexOf("\\")+1);
			}if(theprepath7!=null  ){
				flag[6]=true;
				fold=theprepath3.substring(0, theprepath7.lastIndexOf("\\")+1);
			}
			if(theprepath8!=null ){
				flag[7]=true;
				fold=theprepath3.substring(0, theprepath8.lastIndexOf("\\")+1);
			}
			if(fold==null ||fold == ""){
				fold = new SimpleDateFormat("yyyyMMdd").format(new Date())+"\\";
			}
			String originalFilename1 = items_pic1.getOriginalFilename();
			//上传图片
			if(items_pic1!=null && originalFilename1!=null && originalFilename1.length()>0){
				//存储图片的物理路径
				String pic_path = "F:\\upload\\temp\\";
				//新的图片名称
				String imgName = null;
				if(flag[0]){
					File File = new File(pic_path+theprepath1);
					File.delete();
					imgName=UUID.randomUUID()+"";
					
				}else{
					imgName=UUID.randomUUID()+"";
				}
				String newFileName = fold+imgName+ originalFilename1.substring(originalFilename1.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic1.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				itemCustom.setItemImg1(newFileName);
			}
	       //图片原始名称
			String originalFilename2 = items_pic2.getOriginalFilename();
			//上传图片
			if(items_pic1!=null && originalFilename2!=null && originalFilename2.length()>0){
				
				//存储图片的物理路径
				String pic_path = "F:\\upload\\temp\\";
				String imgName = null;
				if(flag[1]){
					imgName = theprepath2.substring(theprepath2.lastIndexOf("\\")+1, theprepath2.lastIndexOf("."));
				}else{
					imgName=UUID.randomUUID()+"";
				}
				String newFileName = fold+imgName+ originalFilename2.substring(originalFilename2.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic2.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				itemCustom.setItemImg2(newFileName);
			}
		    //图片原始名称
			String originalFilename3 = items_pic3.getOriginalFilename();
			//上传图片
			if(items_pic3!=null && originalFilename3!=null && originalFilename3.length()>0){
				
				//存储图片的物理路径
				String pic_path = "F:\\upload\\temp\\";
				//新的图片名称
				String imgName = null;
				if(flag[2]){
					imgName = theprepath3.substring(theprepath3.lastIndexOf("\\")+1, theprepath3.lastIndexOf("."));
				}else{
					imgName=UUID.randomUUID()+"";
				}
				String newFileName = fold+imgName+ originalFilename3.substring(originalFilename3.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic3.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				itemCustom.setItemImg3(newFileName);
			}
			String originalFilename4 = items_pic4.getOriginalFilename();
			//上传图片
			if(items_pic4!=null && originalFilename4!=null && originalFilename4.length()>0){
				
				//存储图片的物理路径
				String pic_path = "F:\\upload\\temp\\";
				//新的图片名称
				String imgName = null;
				if(flag[3]){
					imgName = theprepath4.substring(theprepath4.lastIndexOf("\\")+1, theprepath4.lastIndexOf("."));
				}else{
					imgName=UUID.randomUUID()+"";
				}
				String newFileName = fold+imgName+ originalFilename4.substring(originalFilename4.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic4.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				itemCustom.setItemDescimg1(newFileName);
			}
			String originalFilename5 = items_pic5.getOriginalFilename();
			//上传图片
			if(items_pic5!=null && originalFilename5!=null && originalFilename5.length()>0){
				
				//存储图片的物理路径
				String pic_path = "F:\\upload\\temp\\";
				//新的图片名称
				String imgName = null;
				if(flag[4]){
					imgName = theprepath5.substring(theprepath5.lastIndexOf("\\")+1, theprepath5.lastIndexOf("."));
				}else{
					imgName=UUID.randomUUID()+"";
				}
				String newFileName = fold+imgName+ originalFilename5.substring(originalFilename5.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic5.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				itemCustom.setItemDescimg2(newFileName);
			}
			String originalFilename6 = items_pic6.getOriginalFilename();
			//上传图片
			if(items_pic6!=null && originalFilename6!=null && originalFilename6.length()>0){
				
				//存储图片的物理路径
				String pic_path = "F:\\upload\\temp\\";
				//新的图片名称
				String imgName = null;
				if(flag[5]){
					imgName = theprepath6.substring(theprepath6.lastIndexOf("\\")+1, theprepath6.lastIndexOf("."));
				}else{
					imgName=UUID.randomUUID()+"";
				}
				String newFileName = fold+imgName+ originalFilename6.substring(originalFilename6.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic6.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				itemCustom.setItemDescimg3(newFileName);
			}
			String originalFilename7 = items_pic7.getOriginalFilename();
			//上传图片
			if(items_pic7!=null && originalFilename7!=null && originalFilename7.length()>0){
				
				//存储图片的物理路径
				String pic_path = "F:\\upload\\temp\\";
				//新的图片名称
				String imgName = null;
				if(flag[6]){
					imgName = theprepath7.substring(theprepath7.lastIndexOf("\\")+1, theprepath7.lastIndexOf("."));
				}else{
					imgName=UUID.randomUUID()+"";
				}
				String newFileName = fold+imgName+ originalFilename7.substring(originalFilename7.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic7.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				itemCustom.setItemDescimg4(newFileName);
			}
			String originalFilename8 = items_pic8.getOriginalFilename();
			//上传图片
			if(items_pic8!=null && originalFilename8!=null && originalFilename8.length()>0){
				
				//存储图片的物理路径
				String pic_path = "F:\\upload\\temp\\";
				//新的图片名称
				String imgName = null;
				if(flag[7]){
					imgName = theprepath8.substring(theprepath8.lastIndexOf("\\")+1, theprepath8.lastIndexOf("."));
				}else{
					imgName=UUID.randomUUID()+"";
				}
				String newFileName = fold+imgName+ originalFilename8.substring(originalFilename8.lastIndexOf("."));
				//新图片
				File newFile = new File(pic_path+newFileName);
				
				//将内存中的数据写入磁盘
				items_pic8.transferTo(newFile);
				
				//将新图片名称写到itemsCustom中
				itemCustom.setItemDescimg5(newFileName);
			}
			return itemCustom;
	 }
	
	

}
