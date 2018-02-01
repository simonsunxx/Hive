<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>结算页面</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/css/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/address.js"></script>

	</head>

	<body>

		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						
							<span target="_top" class="h">欢迎，${customer.custName} </span>
							<span hidden>${customer.custId}</span>
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
					<a name="index_none_header_sysc" href="#"></a>
			
				</div>
			</div>

			<div class="clear"></div>
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger"><a href="${pageContext.request.contextPath}/jsp/front/address.jsp">使用新地址</a></div>
						</div>
						<div class="clear"></div>
						<ul>
							<div class="per-border"></div>
							<li class="user-addresslist defaultAddr">

								<div class="address-left">
									<div class="user DefaultAddr">

										<span class="buy-address-detail">   
                   <span class="buy-user">${customer.custName}</span>
										<span class="buy-phone">15888888888</span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
								   <span class="province">${address.province}</span>
										<span class="city">${address.city}</span>
										<span class="dist">${address.district}</span>
										<span class="street">${address.area}</span>
										</span>

										</span>
									</div>
									<ins class="deftip">默认地址</ins>
								</div>
							
								<div class="clear"></div>

								<div class="new-addr-btn">
									<a href="#">编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:void(0);" onclick="delClick(this);">删除</a>
								</div>

							</li>
							

						</ul>

						<div class="clear"></div>
					</div>
					<!--物流 -->
					<div class="logistics">
						<h3>选择物流方式</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
							<li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
							<li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
							<li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
							<li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--支付-->
					<div class="logistics">
						<h3>支付</h3>
							<div style="padding-left:10px;padding-top:10px;padding-bottom:5px;">
							<p><span>需支付：</span><span>￥</span><span>${order.orderTotal}</span></p>
							</div>
							<div style="padding-left:10px;padding-top:5px;padding-bottom:10px;">
							<p><span>您的财富值还有：</span><span>￥</span><span>${customer.custCashes}</span></p>
							</div>
							<form class="am-form" action="${pageContext.request.contextPath}/order/pay.do" method="post">
								<div class="am-u-sm-3">
								<div class="am-input-group">
									<input type="password" id="payPassword" name="payPassword" class="am-form-field" placeholder="支付密码">
									<input type="text" id="orderId" name="orderId" value="${order.orderId}" style="display:none">
									<input type="text" id="custId" name="custId" value="${customer.custId}" style="display:none">
									<input type="text" id="expense" name="expense" value="${order.orderTotal}" style="display:none">
									<span class="am-input-group-btn">
										<button class="am-btn am-btn-default" type="submit">确认支付</button>
									</span>
								</div>
								
								</div>
							</form>
						
					</div>
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
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="email">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div class="am-form-content address">
								<select data-am-selected>
									<option value="a">湖南省</option>
									<option value="b">湖北省</option>
								</select>
								<select data-am-selected>
									<option value="a">长沙市</option>
									<option value="b">武汉市</option>
								</select>
								<select data-am-selected>
									<option value="a">岳麓区</option>
									<option value="b">洪山区</option>
								</select>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<div class="am-btn am-btn-danger">保存</div>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
	</body>

</html>