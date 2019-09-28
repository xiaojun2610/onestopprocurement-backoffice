<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>修改商品信息</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
		<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
		<link rel="stylesheet" href="../css/adcommon.css" />
		<style type="text/css">
			#formTable{
				width: 90%;
			}
			#formTable tr td{
				padding-left: 30px;
				padding-right: 30px;
			}
		</style>
			 <script type="text/javascript">
			     var msg="${msg}";
			     if(msg=="editfail"){
			    	 alert("修改失败!");
			     }
			     if(msg=="editsuccess"){
			    	 alert("修改成功!");
			     }


			     $(window).ready(function(){
			    	 $("#itemName").blur(function(){
				    	 var name=this.value.trim();
				    	 if(name==null||name==""){
				    		 $("#itemNameWarn").text("商品名称不能为空");
				    	 }
				    	 else{
				    		 $("#itemNameWarn").text("");
				    		 var url = "${pageContext.request.contextPath}/item/ItemNameCheckJson.action";
				    	     $.post(
				    			url,
				    			{itemName:this.value},
				    			function(data) {
				    				$("#itemNameWarn").html(data);
				    			}
				    		);
				    	 }
				     })
				     $("#itemClass").blur(function(){
				    	 var name=this.value.trim();
				    	 if(name==null||name==""){
				    		 $("#itemClassWarn").text("商品类型不能为空");
				    	 }
				    	 else{
				    		 $("#itemClassWarn").text("");
				    	 }
				     })
				     $("#itemPrice").blur(function(){
				    	 var name=this.value.trim();
				    	 if(name==null||name==""){
				    		 $("#itemPriceWarn").text("商品价格不能为空");
				    	 }
				    	 else{
				    		 $("#itemPriceWarn").text("");
				    	 }
				     })
				        $(".manlist").click(function(){
					     $(this).children(".intemclass").slideToggle("fast",function(){
					    	 });
					    	})
			     })
	function mycheck(){
				var itemName = document.getElementById("itemName").value.trim();
				var itemClass = document.getElementById("itemClass").value.trim();
				var itemPrice = document.getElementById("itemPrice").value.trim();
				
				if(itemName == null || itemName == ""){
					document.getElementById("itemNameWarn").innerText = "请输入商品名";
					document.getElementById("itemName").focus();
					return false;
				} 
				if(itemClass == null || itemClass == ""){
					document.getElementById("").innerText = "";
					document.getElementById("itemClassWarn").innerText = "请输入商品类型";
					document.getElementById("itemClass").focus();
					return false;
				}
				if(itemPrice == null || itemPrice == ""){
					document.getElementById("itemClassWarn").innerText ="";
					document.getElementById("itemPriceWarn").innerText = "请输入商品价格";
					document.getElementById("itemPrice").focus();
					return false;
				} 
			
				 
			}
			     
			   </script>
	</head>
	<body>
	<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <p class="pull-left  navbar-text">
				<a class="navtext" href="${pageContext.request.contextPath }/admin/adminhome.action">欢迎进入美食达食材一体化采购后台管理系统</a> &nbsp;&nbsp;欢迎
				<a class="navtext" href="#">${admin.adminName }</a>
			  </p>
		    </div>
		
		  
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="http://127.0.0.1:8088/onestopprocurement/item/home.action">进入前台</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理设置 <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="#">管理员信息</a></li>
		            <li><a href="#">修改密码</a></li>
		            <li><a href="#">添加管理员</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="${pageContext.request.contextPath }/admin/logout.action">退出登录</a></li>
		          </ul>
		        </li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	<div class="container-fluid">
		<div class="mycontainer">
			<div class="row" style="width: 100%;">
				<div class="col-sm-7 ">
					<img src="../img/logo1.png" alt="公司logo" />&nbsp;&nbsp;&nbsp;
					<span id="logoW"><p>您身边的美食搬运工</p></span>
				</div>
					<div class="col-sm-3 col-sm-offset-2 searchFrame">
						<form action="" method="post" style="display: inline;">
							<div class="input-group">

								<input class="form-control" type="text" name="" id="searchInput" value="" placeholder="搜索商品" />
								<span class="input-group-addon"><input class="searchButton" type="submit" value="搜索"/></span>

							</div>
						</form>
					</div>
			</div>
		</div>
		<nav class="navbar-inverse mymenu">
				<div class="mycontainer">
					<ul class="nav navbar-nav">
						<li class="manlist">
							<a class="menulist">商品管理<span class="caret"></span></a>
							<ul class="intemclass pull-left">
							<a href="${pageContext.request.contextPath }/item/gotoadditem.action"><li class="classlist">添加商品</li></a>
							<a href="${pageContext.request.contextPath }/item/itemquery.action"><li class="classlist">商品管理</li></a>
						    </ul>
						</li>
						<li class="manlist">
							<a class="menulist" >订单管理<span class="caret"></span></a>
							<ul class="intemclass pull-left">
							<li class="classlist">查看订单</li>
							<li class="classlist">修改订单状态</li>
	
						    </ul>
						</li>
						<li class="manlist">
							<a class="menulist">客户管理<span class="caret"></span></a>
							<ul class="intemclass pull-left">
							<li class="classlist">查看客户信息</li>
							<li class="classlist">与客户回话</li>
						    </ul>
						</li>
					</ul>
				</div>
			</nav>
		<div class="container">
		   <ol class="breadcrumb" style="background:white">
				<li>
					<a href="${pageContext.request.contextPath }/admin/adminhome.action">首页</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/item/itemquery.action">商品管理</a></li>
				<li class="active">修改商品信息</li>
			</ol>
		<!-- 	<div class="container" style="margin: 30px 50px;">
				<div class="row">
					<div class="col-sm-7 ">
						<img src="../img/logo1.png" alt="公司logo" />&nbsp;&nbsp;&nbsp;
						<span id="logoW"><p>您身边的美食搬运工</p></span>
					</div>
				</div>
			</div> -->
			<form onsubmit="return mycheck()" action="${pageContext.request.contextPath }/item/edititemsubmit.action" enctype="multipart/form-data" method="post">
			   <input type="hidden" name="itemId" value="${item.itemId }"/>
				<div class="table-responsive">
				    <table border="0px" cellspacing="10" id="formTable">
					 <caption style="text-align:center">修改商品信息</caption>
					<tr>
						<td>
							 <div class="form-group">
							    <label for="itemName"><font color="red">*</font>商品名称：</label><span class=" pull-right warn" id="itemNameWarn" ></span>
							    <input type="text" class="form-control" id="itemName" name="itemName" placeholder="商品名称" value="${item.itemName }">
							 </div>
					    </td>
					    <td>
					    	<div class="form-group">
							    <label for="itemClass"><font color="red">*</font>商品类型：</label><span class=" pull-right warn" id="itemClassWarn" ></span>
							    <select name="itemClass" class="form-control" id="itemClass" value="${item.itemClass }">
							       <option value="">-请选择-</option>
							       <c:forEach items="${itemclasses}" var="itemclass">
							         <option  value="${itemclass.classId }" <c:if test="${itemclass.classId==item.itemClass }">selected</c:if>  >${itemclass.className }</option>
							       </c:forEach>
							        <!-- <option value="" >-请选择-</option>
									<option value="1" >调理制品</option>
									<option value="2">原味菜品</option>
									<option value="3" selected>冰冻禽肉类</option>
									<option value="4">冰冻肉类</option>
									<option value="5">冰冻果蔬</option>
									<option value="6">冰冻海河鲜</option>
									<option value="7">荞嫂子杂粮系列</option>
									<option value="8">特色腊味</option>
									<option value="9">开袋即食凉菜</option>
									<option value="10">调料干货</option>
									<option value="11">如意三煲</option>
									<option value="12">半汤菜</option>
									<option value="13">主食点心</option> -->
								</select>
							</div>
					    </td>
					    
					</tr>
					<tr>
					    <td>
					    	<div class="form-group">
							    <label for="itemPrice"><font color="red">*</font>价格:</label><span class=" pull-right warn" id="itemPriceWarn" ></span>
							    <div class="input-group">
							      <div class="input-group-addon" style="background: gainsboro;">￥</div>
							      <input type="text" class="form-control" id="itemPrice" name="itemPrice" placeholder="价格" value="${item.itemPrice }">
							      <div class="input-group-addon" style="background: gainsboro;">元</div>
							    </div>
							 </div>
					    </td>
					    <td>
					    	<div class="form-group">
							    <label for="itemDisCount">折扣：</label>
							    <input type="text" class="form-control" id="itemDiscount" name="itemDiscount" placeholder="0~1之间的小数,默认为1" value="${item.itemDiscount }">
							 </div>
					    </td>
					</tr>
					<tr>
						<td>
					    	<div class="form-group">
							    <label for="itemDesc">商品描述：</label>
							    <textarea  class="form-control" id="itemDesc" name="itemDesc" rows="10" placeholder="400个字符以内" >${item.itemDesc }</textarea>
							 </div>
					    </td>
					    <td>
					    	<div class="form-group">
							    <label for="itemImg1">商品图片</label>
							    <br/>
							    <c:if test="${item.itemImg1!=null}">
									<img src="/pic/${item.itemImg1}" width=100 height=100/>
								</c:if>
							    <input type="file" id="items_pic1" name="items_pic1">
							     <c:if test="${item.itemImg2!=null}">
									<img src="/pic/${item.itemImg2}" width=100 height=100/>
								</c:if>
							    <input type="file" id="items_pic2" name="items_pic2">
							     <c:if test="${item.itemImg3!=null}">
									<img src="/pic/${item.itemImg3}" width=100 height=100/>
								</c:if>
							    <input type="file" id="items_pic3" name="items_pic3">
							    <p class="help-block">请上传三张商品图片.格式jpg 、jpeg、png <br/>每张图片的最大尺寸为5MB,宽高比为5:4</p>
						    </div>
					    </td>
					</tr>
					<tr>
					   <td>
					    	<div class="form-group">
							    <label for="itemAddress">商品生产地：</label>
							    <input  class="form-control" id="itemAddress" name="itemAddress" value="${item.itemAddress} "></input>
							 </div>
							 <div class="form-group">
							    <label for="itemCreatetime">生产日期：</label>
							    <input  class="form-control" id="iitemCreatetime" name="itemCreatetime" value="${item.itemCreatetime }"></input>
							 </div>
							  <div class="form-group">
							    <label for="itemExpirtime">商品有效期：</label>
							    <input  class="form-control" id="itemExpirtime" name="itemExpirtime" value="${item.itemExpirtime }"></input>
							 </div>
							 <div class="form-group">
							    <label for="itemNorm">商品规格：</label>
							    <input type="text" class="form-control" id="itemNorm" name="itemNorm"  value="${item.itemNorm }">
							 </div>
							 <div class="form-group">
							    <label for="itemCount">现库存：</label>
							    <input type="text" class="form-control" id="itemCount" name="itemCount" placeholder="库存数量，默认为充足" value="${item.itemCount }">
							 </div>
							 <div class="form-group">
							    <label for="itemStatus">商品状态：</label><span class=" pull-right warn" id="itemClassWarn" ></span>
							    <select name="itemStatus" id="itemStatus" value="${itemCustom.itemStatus }">
							            <option  value="1" <c:if test="${item.itemStatus eq 1 }">selected</c:if>  >在售</option>
							            <option  value="2" <c:if test="${item.itemStatus eq 2 }">selected</c:if>  >推荐</option>
								  </select>
							</div>
					    </td>
					    <td>
					    	<div class="form-group">
							    <label for="items_pic4">商品介绍图片</label>
							    <br/>
							    <c:if test="${item.itemDescimg1!=null}">
									<img src="/pic/${item.itemDescimg1}" width=100 height=100/>
								</c:if>
							    <input type="file" id="items_pic4" name="items_pic4">
							    <c:if test="${item.itemDescimg2!=null}">
									<img src="/pic/${item.itemDescimg2}" width=100 height=100/>
								</c:if>
							    <input type="file" id="items_pic5" name="items_pic5">
							    <c:if test="${item.itemDescimg3!=null}">
									<img src="/pic/${item.itemDescimg3}" width=100 height=100/>
								</c:if>
							    <input type="file" id="items_pic6" name="items_pic6">
							    <c:if test="${item.itemDescimg4!=null}">
									<img src="/pic/${item.itemDescimg4}" width=100 height=100/>
								</c:if>
							    <input type="file" id="items_pic7" name="items_pic7">
							    <c:if test="${item.itemDescimg5!=null}">
									<img src="/pic/${item.itemDescimg5}" width=100 height=100/>
								</c:if>
							    <input type="file" id="items_pic8" name="items_pic8">
							    <p class="help-block">上传最多5张商品图片.格式jpg 、jpeg、png<br/>每张图片的最大尺寸为5MB</p>
						    </div>
					    </td>
					</tr>
					<tr>
						<td colspan="2" >
							<input type="submit"  class="btn btn-info pull-right" style="width: 90px;" value="修改">
						</td>
					</tr>
				  </table>
			</div>
			</form>
	    </div> 
	<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>
