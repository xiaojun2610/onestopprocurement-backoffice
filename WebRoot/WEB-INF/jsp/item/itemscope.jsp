<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="UTF-8">
		<title>商品信息</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="../css/intemDetails.css" />
		<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link rel="stylesheet" href="../css/adcommon.css" />
		<script src="../js/jquery.min.js"></script> 
		<style type="text/css">
			.navtext {
				color: #696969;
			}
			
			.menulist {
				color: white;
				margin-right: 50px;
				font: larger;
			}
			
			#InputAmount {
				width: 70px;
				text-align: center;
			}
			
			#addCartFrame {
				padding-left:5% ;
			}
			#addcart{
				margin-left: 10%;
			}
			.userCommmettbl{
				width: 80%;
				margin: 20px auto;
			}
			.intemclass{
			opacity:0.6;
			
			}
			.input-group-addon:hover{
			cursor:pointer;
			}
			
		</style>
		<script type="text/javascript">
		$(function(){
			$(".manlist").click(function(){
			     $(this).children(".intemclass").slideToggle("fast",function(){
			    	 });
			 })
			 $("#subnum").click(function(){
				 num= $("#InputAmount").val();
				 num = parseInt(num);
				 if(num>0){
				    	num=num-1;
				    	}
				 $("#InputAmount").val(num);
			 })
			 $("#addnum").click(function(){
				 num= $("#InputAmount").val();
				 num = parseInt(num);
				 num=num+1;
				 $("#InputAmount").val(num);
			 })
		})
		</script>
	</head>

	<body>
		<div class="nav navbar-default mynav">
				<p class="pull-left  navbar-text">
					<a class="navtext" href="index-home.html">欢迎来到美食达食材一体化采购系统</a> &nbsp;&nbsp;欢迎
					<a class="navtext" href="">xiaojun2610</a>
				</p>
				<p class="pull-right  navbar-text">
					<a class="navtext" href="">我的美食达</a> &nbsp;&nbsp;
					<a class="navtext" href="">购物车（0）</a>
				</p>
		</div>
		<div class="container-fluid">
			
			<div class="mycontainer">
				<div class="row" style="width: 100%;">
					<div class="col-sm-7 ">
						<img src="../img/logo1.png" alt="公司logo" />&nbsp;
						<span id="logoW"><p>您身边的美食搬运工</p></span>
					</div>
					<div class="col-sm-3 col-sm-offset-2 searchFrame">
						<form action="" method="post" style="display: inline;">
							<div class="input-group">

								<input class="form-control input-lg" type="text" name="" id="searchInput" value="" placeholder="搜索美食食材" />
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
							<a class="menulist">食材分类<span class="caret"></span></a>
							<ul class="intemclass pull-left"  id="itemclasslist">
								<li class="classlist">调理制品</li>
								<li class="classlist">原味菜品</li>
								<li class="classlist">冰冻禽肉类</li>
								<li class="classlist">冰冻肉类</li>
								<li class="classlist">冰冻果蔬</li>
								<li class="classlist">冰冻海河鲜</li>
								<li class="classlist">荞嫂子杂粮系列</li>
								<li class="classlist">特色腊味</li>
								<li class="classlist">开袋即食凉菜</li>
								<li class="classlist">调料干货</li>
								<li class="classlist">如意三煲</li>
							</ul>
						</li>
						<li>
							<a class="menulist" href="">新品推荐</a>
						</li>
						<li>
							<a class="menulist" href="">菜品展示</a>
						</li>
					</ul>
				</div>
			</nav>
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-10">
						<div class="container-fluid">
							<div class="row">
								<div class="col-sm-6">
									<img class="showImg img-rounded " src="/pic/${item.itemImg1}"  alt="${item.itemName }"  />
								</div>
								<div class="col-sm-6">
									<h3>${item.itemName }</h3>
									<p>${item.itemDesc }</p>
									<p class="saleInfo">价格：￥<span class="preprice">${item.itemPrice }</span></p>
									<p class="saleInfo">促销价：￥<span class="price">${item.itemPrice*item.itemDiscount}</span></p>
									<div class="saleDeTails">月销量<em>239</em></div>
									<div class="saleDeTails">累计评价<em>56</em></div>
									<div id="addCartFrame">
										<form class="form-inline">
											<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon" id="subnum">-</span>
													<input type="text" class="form-control" id="InputAmount" value="1">
													<span class="input-group-addon" id="addnum">+</span>
												</div>
											</div>
											<button id="addcart" type="submit" class="btn btn-warning">加入购物车</button>
										</form>
									</div>
								</div>
							</div>
							<div class="row-fluid">
						        <div class="widget-box">
						          <div class="widget-title">
						            <ul class="nav nav-tabs">
						              <li class="active"><a data-toggle="tab" href="#tab1">产品描述</a></li>
						              <li><a data-toggle="tab" href="#tab2">产品属性</a></li>
						              <li><a data-toggle="tab" href="#tab3">其他信息</a></li>
						              <li><a data-toggle="tab" href="#tab4">商品评价</a></li>
						            </ul>
						          </div>
						          <div class="widget-content tab-content">
						            <div id="tab1" class="tab-pane active">
						             <c:if test="${item.itemDescimg1!=null}">
								    	<img src="/pic/${item.itemDescimg1}" width="100%"/>
								     </c:if>
								     <c:if test="${item.itemDescimg2!=null}">
								    	<img src="/pic/${item.itemDescimg2}" width="100%"/>
								     </c:if>
								     <c:if test="${item.itemDescimg3!=null}">
								    	<img src="/pic/${item.itemDescimg3}" width="100%"/>
								     </c:if>
								     <c:if test="${item.itemDescimg4!=null}">
								    	<img src="/pic/${item.itemDescimg4}" width="100%"/>
								     </c:if>
								     <c:if test="${item.itemDescimg5!=null}">
								    	<img src="/pic/${item.itemDescimg5}" width="100%"/>
								     </c:if>
								     
						             </div>
						            <div id="tab2" class="tab-pane"> 
						             <table class="table">
						             <tr>
							             <td>产品名称：${item.itemName }
							             </td>
						             </tr>
						             <tr>
							             <td>规格：${item.itemNorm }
							             </td>
						             </tr>
						             <tr>
							             <td>生产产地：${item.itemAddress }
							             </td>
						             </tr>
						              <tr>
							             <td>生产日期：${item.itemCreatetime }
							             </td>
						             </tr>
						              <tr>
							             <td>保质期：${item.itemExpirtime }
							             </td>
						             </tr>
						             </table>
						          
						            </div>
						            <div id="tab3" class="tab-pane">
						              <p>And is full of waffle to It has multiple paragraphs and is full of waffle to pad out the comment. Usually, you just wish these sorts of comments would come to an end.multiple paragraphs and is full of waffle to pad out the comment. </p>
						              <img src="img/demo/demo-image3.jpg" alt="demo-image"/>
						            </div>
						              <div id="tab4" class="tab-pane">
										<table class="table userCommmettbl">
											<caption>客户评价</caption>
											<tr><td>用户一</td><td>美味佳肴，极品</td><td><i class="icon icon-star icon-white"></i><i class="icon icon-star"></i><i class="icon icon-star"></i></td></tr>
											<tr><td>用户二</td><td>价格实惠，物美价廉 </td><td><i class="icon icon-star icon-white"></i><i class="icon icon-star"></i><i class="icon icon-star"></i><i class="icon icon-star"></i></td></tr>
										</table>
						            </div>
						          </div>
						          
						        </div>
							</div>
							
						</div>
					</div>
					<div class="col-sm-2">
						<p class="hotItems">热门食材</p>
						<div class="row">
							<a href="#">
								<div class="thumbnail">
									<img src="img/图片2.png" alt="豆鼓金箭鱼">
									<div class="caption">
										<h3>豆鼓金箭鱼</h3>
										<p class="price">促销价：￥<span>35.00</span></p>
									</div>
								</div>
							</a>
						</div>
						<div class="row">
							<a href="#">
								<div class="thumbnail">
									<img src="img/图片2.png" alt="豆鼓金箭鱼">
									<div class="caption">
										<h3>豆鼓金箭鱼</h3>
										<p class="price">促销价：￥<span>35.00</span></p>
									</div>
								</div>
							</a>
						</div>
						<div class="row">
							<a href="#">
								<div class="thumbnail">
									<img src="img/图片2.png" alt="豆鼓金箭鱼">
									<div class="caption">
										<h3>豆鼓金箭鱼</h3>
										<p class="price">促销价：￥<span>35.00</span></p>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="../js/bootstrap.min.js"></script> 
	</body>
</html>