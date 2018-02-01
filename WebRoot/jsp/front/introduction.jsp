<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品页面</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="${pageContext.request.contextPath}/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/basic/js/quick_links.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/list.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/util.js"></script>
		
	<script type="text/javascript">
	var addOrder = "<%= request.getParameter("addOrder")%>";
	window.onload=function(){ 
		if(addOrder == "NotLogin"){
			alert("未登录，请先登录！");
		}
		else if(addOrder == "fail"){
			alert("购买失败!");
		}
		
	};
	</script>
	</head>
	
	
	<body>


		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:choose>
							<c:when test="${sessionScope.login.equals('success')}">
							<span target="_top" class="h">欢迎，${customer.custName} </span>
							<span hidden>${customer.custId}</span>
							&nbsp; &nbsp;&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/jsp/front/login.jsp" target="_top">重新登录</a>
							</c:when>
							<c:otherwise>
							<a href="${pageContext.request.contextPath}/jsp/front/login.jsp" target="_top" class="h">亲，请登录</a>
							</c:otherwise>
						</c:choose>
							&nbsp; &nbsp;&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/jsp/front/register.jsp" target="_top">免费注册</a>
							
						</div>
				</div>
			</ul>
			<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}/jsp/front/welcome.jsp" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<c:choose>
							<c:when test="${login=='success'}">
							<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/jsp/front/personal-info.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</c:when>
							<c:otherwise>
							<div class="menu-hd MyShangcheng"><a href="#" target="_top" onclick="notLogin()"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="topMessage mini-cart">
					<c:choose>
						<c:when test="${login=='success'}">
							<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/cart/getCartBycustId/${customer.custId}.do" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
						</c:when>
						<c:otherwise>
							<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top" onclick="notLogin()"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
						</c:otherwise>
					</c:choose>
					</div>
					<div class="topMessage favorite">
					<c:choose>
						<c:when test="${login=='success'}">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}/order/getOrderBycustId/${customer.custId}.do" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>我的订单</span></a></div>
						</c:when>
						<c:otherwise>
							<div class="menu-hd"><a href="" target="_top" onclick="notLogin()"><i class="am-icon-heart am-icon-fw"></i><span>我的订单</span></a></div>
						</c:otherwise>
					</c:choose>
					</div>
					
				</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
				
				<div class="search-bar pr">
					<a name="index_none_header_sysc" href="#"></a>
					
				</div>
			</div>

			<div class="clear"></div>
            <b class="line"></b>
			<div class="listMain">

				<!--分类-->
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">商品信息</span></div>
					
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="#">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
								<li>
									<img src="${pageContext.request.contextPath}/images/01.jpg" title="pic" />
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/images/02.jpg" />
								</li>
								<li>
									<img src="${pageContext.request.contextPath}/images/03.jpg" />
								</li>
							</ul>
						</div>
					</section>
				</div>

				

				<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							

							<div class="tb-booth tb-pic tb-s310">
								<img src="${product.picBig}" style="width:380px;height:380px;" class="jqzoom" />
							</div>
						
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">
						
						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>	
								${product.productName}
							</h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
							<li>
								<p style="margin-bottom:5px;">
								${product.productDescription}
								</p>
								</li>
								<li class="price iteminfo_price">
									<dt>现价</dt>
									<dd><em>¥</em><b class="sys_item_price">${product.presentPrice}</b>  </dd>                                 
								</li>
								<li class="price iteminfo_mktprice">
									<dt>原价</dt>
									<dd><em>¥</em><b class="sys_item_mktprice">${product.originalPrice}</b></dd>									
								</li>
								<li class="price iteminfo_mktprice">
									<dt>保修期</dt>
									<dd><b>${product.warrantyPeriod}年</b></dd>									
								</li>
								
								<div class="clear"></div>
							</div>

						

							

							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="${pageContext.request.contextPath}/product/purchase.do" method="post">

												<div class="theme-signin-left">

													
													
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input type="text" id="productId" name="productId" value="${product.productId}" style="display:none"/>
															<input type="text" id="custId" name="custId" value="${customer.custId}" style="display:none"/>
															<input type="text" id="unitPrice" name="unitPrice" value="${product.presentPrice}" style="display:none"/>
															<input type="text" id="maxquantity" name="maxquantity" value="${product.quantity}" style="display:none"/>
															<input id="min" class="am-btn am-btn-default" name="min" type="button" value="-" />
															<input id="quantity" name="quantity" type="text" value="1" style="width:30px;" />
															<input id="add" class="am-btn am-btn-default" name="add" type="button" value="+" />
															
															<span id="Stock" class="tb-hidden">库存<span class="stock">${product.quantity}</span>件</span>
														</dd>

													</div>
													<div class="clear"></div>

													<div class="pay">

							<li>
								 <div class="clearfix tb-btn tb-btn-buy theme-login">
								 	
						<c:choose>
							<c:when test="${login=='success'}">
							<button type="submit" class="am-btn am-btn-danger">立即购买</button>
							</c:when>
							<c:otherwise>
							<button class="am-btn am-btn-danger" disabled="true">立即购买</button>
							</c:otherwise>
						</c:choose>
									
								</div>
								 
								 
								 
							
								 
								 
								 
								 
								
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<button type="button" class="am-btn am-btn-warning" onclick="addToCart()">加入购物车</button>
								</div>
								
							</li>
						</div>
											</form>
										</div>
									</div>

								</dd>
							</dl>
							
						</div>

						

					</div>

					<div class="clear"></div>

				</div>

				<!--商品推荐-->
				<div class="match">
					<div class="match-title">购买该商品的人还购买了：</div>
					<div class="match-comment">
						<ul class="like_list">
						<c:forEach items="${assoProducts}" var="assoProduct">
							<li>
								<div class="s_picBox">
									<a class="s_pic" href="${pageContext.request.contextPath}/product/getProductById/${assoProduct.productId}.do"><img src="${assoProduct.picSmall}"></a>
								</div> <a class="txt" target="_blank" href="${pageContext.request.contextPath}/product/getProductById/${assoProduct.productId}.do">${assoProduct.productName}</a>
								<div class="info-box"> <span class="info-box-price">¥ ${assoProduct.presentPrice}</span> <span class="info-original-price">￥ ${assoProduct.originalPrice}</span> </div>
							</li>
						</c:forEach>						
						</ul>
					</div>
				</div>
				<div class="clear"></div>

						<div class="footer">
							
							<div class="footer-bd">
								<p style="text-align:center">	
									<em>© 2017 liling 版权所有</em>
								</p>
							</div>
						</div>
					

				
			</div>
			<!--菜单 -->
			<div class=tip>
				<div id="sidebar">
					<div id="wrap">
						<div id="prof" class="item">
							<a href="#">
								<span class="setting"></span>
							</a>
							<div class="ibar_login_box status_login">
								<div class="avatar_box">
									<p class="avatar_imgbox"><img src="${pageContext.request.contextPath}/images/no-img_mid_.jpg" /></p>
									<ul class="user_info">
										<li>用户名：${customer.custName}</li>
										<li>级&nbsp;别：普通会员</li>
									</ul>
								</div>
								<div class="login_btnbox">
									<c:choose>
										<c:when test="${customer != null}">
											<a href="${pageContext.request.contextPath}/order/getOrderByCustId/${customer.custId}.do" class="login_order ">我的订单</a>
											<a href="# " class="login_favorite ">我的收藏</a>
										</c:when>
										<c:otherwise>
											<a href="#" class="login_order " onclick = "notLogin()">我的订单</a>
											<a href="#" class="login_favorite " onclick = "notLogin()">我的收藏</a>
										</c:otherwise>
									</c:choose>
								</div>
								<i class="icon_arrow_white"></i>
							</div>

						</div>
						<div id="shopCart" class="item">
							<a href="#">
								<span class="message"></span>
							</a>
							<p>
								购物车
							</p>
							<p class="cart_num">0</p>
						</div>
						<div id="asset" class="item">
							<a href="#">
								<span class="view"></span>
							</a>
							<div class="mp_tooltip">
								我的资产
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="foot" class="item">
							<a href="#">
								<span class="zuji"></span>
							</a>
							<div class="mp_tooltip">
								我的足迹
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="brand" class="item">
							<a href="#">
								<span class="wdsc"><img src="${pageContext.request.contextPath}/images/wdsc.png" /></span>
							</a>
							<div class="mp_tooltip">
								我的收藏
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="broadcast" class="item">
							<a href="#">
								<span class="chongzhi"><img src="${pageContext.request.contextPath}/images/chongzhi.png" /></span>
							</a>
							<div class="mp_tooltip">
								我要充值
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div class="quick_toggle">
							<li class="qtitem">
								<a href="#"><span class="kfzx"></span></a>
								<div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
							</li>
							<!--二维码 -->
							<li class="qtitem">
								<a href="#none"><span class="mpbtn_qrcode"></span></a>
								<div class="mp_qrcode" style="display:none;"><img src="${pageContext.request.contextPath}/images/weixin_code_145.png" /><i class="icon_arrow_white"></i></div>
							</li>
							<li class="qtitem">
								<a href="#top" class="return_top"><span class="top"></span></a>
							</li>
						</div>

						<!--回到顶部 -->
						<div id="quick_links_pop" class="quick_links_pop hide"></div>

					</div>

				</div>
				<div id="prof-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						我
					</div>
				</div>
				<div id="shopCart-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						购物车
					</div>
				</div>
				<div id="asset-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						资产
					</div>

					<div class="ia-head-list">
						<a href="#" target="_blank" class="pl">
							<div class="num">0</div>
							<div class="text">优惠券</div>
						</a>
						<a href="#" target="_blank" class="pl">
							<div class="num">0</div>
							<div class="text">红包</div>
						</a>
						<a href="#" target="_blank" class="pl money">
							<div class="num">￥0</div>
							<div class="text">余额</div>
						</a>
					</div>

				</div>
				<div id="foot-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						足迹
					</div>
				</div>
				<div id="brand-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						收藏
					</div>
				</div>
				<div id="broadcast-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						充值
					</div>
				</div>
			</div>
	<script>
	
	   function addToCart(){
	
		var productId = $('#productId').val();
		var custId = $('#custId').val();
		var unitPrice =$('#unitPrice').val();
		var quantity = $('#quantity').val();
		 $.ajax({
          url: "${pageContext.request.contextPath}/product/addToCart.do",
          type: "POST",
          dataType: "json",
          data: {
            "productId": productId,
            "custId": custId,
            "unitPrice": unitPrice,
            "quantity":quantity
          },
          success: function(data) {
          	if(data.addToCart=="NotLogin"){
          		alert("未登录，请先登录！");
          	}
          	else if(data.addToCart=="success"){
          		alert("已经成功添加到购物车！");
          	}
          	else{
          		alert("添加失败！");
          	}
            
            },
          error: function() {
            alert("error！");
          }
        });
	}
	</script>

	</body>

</html>