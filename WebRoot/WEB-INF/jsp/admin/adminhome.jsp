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

		<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
		<link rel="stylesheet" href="../css/adcommon.css" />
		 <script type="text/javascript">
		    $(document).ready(function(){
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
			<div class="container" style="margin-top: 50px;">
				<div class="table-responsive">
				  <table class="table table-hover table-striped order-table">
				  	<caption   >客户订单实时列表</caption>
				   <thead><tr><th>客户名</th><th>订单号</th><th>订单生成时间</th><th>订单详情</th></tr>
				  </thead>
				  </table>
				</div>
			</div>
		</div>	
	<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	</body>
</html>