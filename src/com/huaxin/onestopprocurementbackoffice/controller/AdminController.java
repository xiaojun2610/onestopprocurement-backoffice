package com.huaxin.onestopprocurementbackoffice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huaxin.onestopprocurementbackoffice.po.Admin;
import com.huaxin.onestopprocurementbackoffice.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@Autowired
	private AdminService adminService;
	
     @RequestMapping("/adminlogin.action")
	 public String adminLogin(Admin admin,HttpServletRequest request) throws Exception{
    	 boolean flag = adminService.adminLogin(admin);
    	 if(flag){
    		 HttpSession session = request.getSession();
    		session = request.getSession();
    		session.setAttribute("admin", admin);
    		 return "redirect:adminhome.action";
    	 }
    	 else{
    		 String msg = "fail";
    		 request.setAttribute("msg", msg);
    		 return "admin/login";
    	 }
     }
     
     @RequestMapping("/login.action")
     public String gotologin(){
    	 return "admin/login";
     }
     @RequestMapping("/adminhome.action")
     public String gotoadminhome(){
    	 return "admin/adminhome";
     }
     @RequestMapping("/logout.action")
     public String adminLogout(HttpSession session){
    	session.invalidate();
  	   return "redirect:login.action";
    	 
     }
}
