<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>美食达食材一体化采购后台管理系统</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="../css/adcommon.css" />
		<link rel="stylesheet" href="../css/b.page.bootstraps.css" />
		
         <script type="text/javascript" src="../js/b.page.js" ></script>
		<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
		<style type="text/css">
			.myitemlist{
				margin: 10px 10px;
				text-align: center;
				
			}
			.myitemlist li:first-child{
				background: rgb(107,197,53);
				color: white;
				cursor: none;
				
			}
			.myitemlist li:first-child:hover{
				background: rgb(107,197,53);
				color: white;;
				cursor: none;
				
			}
			.myitemlist li:hover{
				cursor: pointer;
				background: gainsboro;
				
			}
			.short-input{
				width: 80px;
			}
			.criteriaTable{
				margin: 30px auto;
				width: 80%;
			}
		  #page a{
		  width: 23px; height: 23px; 
		  border: 1px solid #dce0e0;
		   text-align: center; margin: 0 4px;
		    cursor: pointer;
		     display: inline-block; 
		  }
         .current{
          background-color: #5ac3e7; 
          } 
		</style>
		 <script type="text/javascript">
		   var msg = "${msg}";
		   if(msg=="deletesuccess"){
			   alert("删除成功!");
		   }
		   if(msg=="deletefail"){
			   alert("删除失败!");
		   }
		   function deleteconfirm() { 
			   var msg = "您确定要删除吗？"; 
			   if (confirm(msg)==true){ 
			    return true; 
			   }else{ 
			    return false; 
			   } 
		    } 

		    $(document).ready(function(){
		    	var totalPage="${itemCustom.pagination.totalPage}";
		    	totalPage=parseInt(totalPage);
		    	var pageNo="${itemCustom.pagination.pageNo}";
		    	pageNo=parseInt(pageNo);
		    	$('#page').paging({pageNo:pageNo,totalPage:totalPage,callback:function(cur){
		    		$.ajax({
		    			 url:"${pageContext.request.contextPath}/item/itemqueryAjax.action",
		    		    data:"pageNo="+cur+"&"+$("#criateriaform").serialize(),
		    		 success:function(data){  
		    				 var itemCustom = eval('(' + data + ')'); 
		    				   var tb = $('#dataGridTableJson tbody'); 
			    			   $(tb).empty();
		    			   	if(itemCustom && itemCustom.itemCustomlist && itemCustom.itemCustomlist.length > 0){
		    			    		$.each(itemCustom.itemCustomlist,function(i,item){
		    			    			var itemStatus = "";
		    			    			if(item.itemStatus==1){
		    			    		    itemStatus ="在售";
		    			    			   
		    			    		   }
		    			    		   if(item.itemStatus==2){
			    			    		itemStatus ="推荐";
			    			    		   }
		    			    			var tr = $('<tr>');
		    			    			$(tr).append("<input type='checkbox' name='itemId' value='"+item.itemId+"'/></td>");
		    			    			$(tr).append('<td>'+item.itemName+'</td>');
		    			    			$(tr).append('<td>'+item.itemPrice+'</td>');
		    			    			$(tr).append('<td>'+item.className+'</td>');
		    			    			$(tr).append('<td>'+itemStatus+'</td>');
		    			    			$(tr).append("<td><a class='btn btn-info btn-xs' href='${pageContext.request.contextPath }/item/scopeItem.action?itemId="+item.itemId+"'>预览</a>&nbsp;<a class='btn btn-warning btn-xs' href='${pageContext.request.contextPath }/item/editItem.action?itemId="+item.itemId+"'>修改</a>&nbsp;<a id='itemdelete-btn' class='btn btn-danger btn-xs' onclick='return deleteconfirm()' href='${pageContext.request.contextPath }/item/deleteItem.action?itemId="+item.itemId+"'>删除</a></td>");
		    			    			$(tb).append(tr);
		    			    		});
		    			    	} 
		    			     }
		    		    }) 
		    	     }
		    		}); 
			    $(".manlist").click(function(){
			     $(this).children(".intemclass").slideToggle("fast",function(){
			    	 });
			    })
		    })
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
		<div class="container-fluid">
			    <ol class="breadcrumb" style="background:white">
				<li>
					<a href="${pageContext.request.contextPath }/admin/adminhome.action">首页</a>
				</li>
				<li><a href="${pageContext.request.contextPath }/item/itemquery.action">商品管理</a></li>
			    </ol>
			    <table class="table criteriaTable">
							<caption>按条件查找商品:</caption>
							<form id="criateriaform" mothed="POST" action="${pageContext.request.contextPath }/item/itemquerybycriteria.action">
								<td>商品名称：<input type="text" name="itemName" id="itemName" placeholder="商品名称" class="input" value="${itemCustom.itemName}"/></td> 
								<td>商品类型：
									<select name="itemClass" id="itemClass" value="${itemCustom.itemClass }">
									    <option value="">-请选择-</option>
									 <c:forEach items="${itemclasses}" var="itemclass">
							         <option  value="${itemclass.classId }" <c:if test="${itemclass.classId==itemCustom.itemClass }">selected</c:if>  >${itemclass.className }</option>
							       </c:forEach>
								  </select>
								</td>
							</tr>
							<tr>
							<td>
							          商品类型：
									<select name="itemStatus" id="itemStatus" value="${itemCustom.itemStatus }">
									    <option value="">-请选择-</option>
							            <option  value="1" <c:if test="${itemCustom.itemStatus ==1 }">selected</c:if>  >在售</option>
							            <option  value="2" <c:if test="${itemCustom.itemStatus ==2 }">selected</c:if>  >推荐</option>
								  </select>
								</td>
								<td>价格区间：大于<input type="text" name="minPrice" id="minPrice" class="short-input" value="${itemCustom.minPrice }"/>,小于<input type="text" name="maxPrice" id=maxPrice" class="short-input" value="${itemCustom.maxPrice }"/></td>
							</tr>
							<tr>
							    <td colspan="2"><input id="creteriaSubmit" type="submit" value="查询" class="btn btn-info btn-sm pull-right"/></td>
							</tr>
							</form>
				</table>
				<div class="row">
					<div class="col-sm-2">
					</div>
					<div class="col-sm-8">
						<table id="dataGridTableJson"  class="table table-bordered table-striped" style="text-align: center;" >
								<caption style="text-align: center;">商品列表</caption>
								<caption style="text-align: right;">一共  ${itemCustom.pagination.totalCount }条记录&nbsp;&nbsp;每页显示15条</caption> 
							<thead>
							<tr style="text-align: center;">
								<th style="text-align: center;">选择</th>
								<th style="text-align: center;">商品名称</th>
								<th style="text-align: center;">商品价格</th>
								<th style="text-align: center;">商品类型</th>
								<th style="text-align: center;">商品状态</th>
								<th style="text-align: center;">商品操作</th>
							</tr>
							</thead>
							<tbody>
						     <c:forEach items="${itemCustom.itemCustomlist }" var="item">
							<tr>
								<td><input type="checkbox" name="itemId" value="${item.itemId}"/></td>
								<td>${item.itemName }</td>
								<td>${item.itemPrice }</td>
								<td>${item.className }</td>
								<td>
								<c:if test="${item.itemStatus eq 1}">
								在售
								</c:if>
								<c:if test="${item.itemStatus eq 2}">
								推荐
								</c:if>
								</td>
								<td><a class="btn btn-info btn-xs" href="${pageContext.request.contextPath }/item/scopeItem.action?itemId=${item.itemId}">预览</a>&nbsp;<a class="btn btn-warning btn-xs" href="${pageContext.request.contextPath }/item/editItem.action?itemId=${item.itemId}">修改</a>&nbsp;<a id="itemdelete-btn" class="btn btn-danger btn-xs" onclick="return deleteconfirm()" href="${pageContext.request.contextPath }/item/deleteItem.action?itemId=${item.itemId}">删除</a></td>
							</tr>
						</c:forEach> 
					</tbody>
				   </table>
					<div id="page" style="margin-left:10%;margin-bottoM:50px"></div>
				</div>
					
					<div class="col-sm-2">
					</div>
				</div>
			</div>
		</div>	
	<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="../js/paging.js" type="text/javascript"></script>
	</body>
</html>