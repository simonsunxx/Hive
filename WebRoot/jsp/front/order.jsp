<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>订单页面</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

	</head>

	<body>

		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<span target="_top" class="h">欢迎，${customer.custName} </span>
						&nbsp; &nbsp;&nbsp;&nbsp;
							<a href="${pageContext.request.contextPath}/jsp/front/login.jsp" target="_top">重新登录</a>
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
					<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/jsp/front/personal-info.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/cart/getCartBycustId/${customer.custId}.do" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd"><a href="${pageContext.request.contextPath}/order/getOrderBycustId/${customer.custId}.do" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>我的订单</span></a></div>	
				</div>
				
			</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">

				 <div class="search-bar pr">
					<!--<a name="index_none_header_sysc" href="#"></a>
					<form>
						<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
					</form>
					-->
				</div>
				 
			</div>

			<div class="clear"></div>

		
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">状态</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="bundle-hd">
								
							</div>
							<div class="clear"></div>
							<div class="bundle-main">
							<c:forEach items="${totalOrders}" var="totalOrder">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="J_CheckBox_170037950254" name="items[]" value="170037950254" type="checkbox">
											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										 <div class="item-pic">
											<a href="${pageContext.request.contextPath}/product/getProductById/${totalOrder.productId}.do" target="_blank" data-title="商品名字" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="${totalOrder.picSmall}" class="itempic J_ItemImg" style="width:80px;height:80;"></a>
										</div>
										
										<div class="item-info">
											<div class="item-basic-info">
												<a href="${pageContext.request.contextPath}/product/getProductById/${totalOrder.productId}.do" target="_blank" title="商品名字" class="item-title J_MakePoint" data-point="tbcart.8.11">${totalOrder.productName}</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											${totalOrder.productDescription}
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${totalOrder.originalPrice}</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">${totalOrder.unitPrice}</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													
													<em class="text_box" name="" style="width:50px;">${totalOrder.quantity}</em>
													
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${totalOrder.orderTotal}</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${totalOrder.orderStatus}</em>
											<c:if test="${totalOrder.orderStatus=='未支付'}">
											<br/><a href="${pageContext.request.contextPath}/order/payOrder/${totalOrder.orderId}.do"><u>去支付</u></a>
											</c:if>
										</div>
											
										</div>
									</li>
								</ul>
							</c:forEach>
								
								
								
							
													
								
								
								
							</div>
						</div>
					</tr>
					<div class="clear"></div>
				</div>
		

				<div class="footer">
					<div class="footer-bd">
						<p style="text-align:center">
							<em>© 2017 liling 版权所有</em>
						</p>
					</div>
				</div>

			</div>

			
		
	</body>

</html>