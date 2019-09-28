<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>美食达食材一体化采购后台管理系统——管理员登录</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="../css/adcommon.css" />
		<script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="../text/javascript" src="js/jquery-1.11.1.js"></script>
	</head>
	<style type="text/css">
		#loginform {
			width: 90%;
		}
		
		@media only screen and (min-width: 1200px) {
			#loginform {
				width: 80%;
			}
		}
	</style>
	 <script type="text/javascript">
     var msg="${msg}";
     if(msg=="fail"){
    	 alert("用户名或密码错误!");
    	 
     }
     
   </script>

	<body>
		<div class="nav navbar-default mynav">
			<p class="pull-left  navbar-text">
				<span  class="navtext" >欢迎来到美食达食材一体化采购后台管理系统</span> &nbsp;&nbsp;
			</p>
			</div>
		<div class="container-fluid">
			
			<div class="container" style="margin: 30px 50px;">
				<div class="row">
					<div class="col-sm-7 ">
						<img src="../img/logo1.png" alt="公司logo" />&nbsp;&nbsp;&nbsp;
						<span id="logoW"><p>您身边的美食搬运工</p></span>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-7"><img src="../img/01.jpg" width="100%" height="300px" />
					</div>
					<div class="col-sm-5">
						<div id="loginform">
							<form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/admin/adminlogin.action">
								<h4 align="center" style="margin-bottom: 60px;">管理员登录</h4>
								<div class="form-group" style="height:60px">
									<label for="firstname" class="col-sm-3 control-label">用户:</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="adminName" id="adminName" placeholder="用户名、手机、邮箱" />
									</div>
								</div>
								<div class="form-group" style="height:60px">
									<label for="password" class="col-sm-3 control-label">密码:</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" name="adminPassword" id="adminPassword" placeholder="密码" />
									</div>
								</div>
								<div class="form-actions">
									<span class="pull-left" style="margin-left: 50px;"><a href="#" class="flip-link btn btn-info" id="to-recover">忘记密码?</a></span>
									<span class="pull-right"><input type="submit" class="btn btn-success" value="&nbsp; &nbsp; 登录  &nbsp; &nbsp;  " /> </span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
     <script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	</body>

</html>