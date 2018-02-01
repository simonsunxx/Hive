<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>地址管理</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="${pageContext.request.contextPath}/js/address.js"></script>

	</head>
	
<script language="javascript"> 
var register = "<%=request.getParameter("register")%>";
var addAddress = "<%=request.getParameter("addAddress")%>";
var modifyAddress = "<%=request.getParameter("modifyAddress")%>";
window.onload=function(){ 
	if(register != null){
		if(register=="success"){
			alert("注册成功！请添加收货地址！");
		}
	}
	if(addAddress != null){
		if(addAddress=="success"){
			alert("保存成功！");
		}
		else if(address=="bindfail"){
			alert("地址绑定失败！请重新添加");
		}
		else{
			alert("地址添加失败！");
		}
	}
	if(modifyAddress!=null){
		if(modifyAddress=="success"){
			alert("地址修改成功！");
		}
		else{
			alert("地址修改失败！");
		}
	}
	
	
} 

</script> 

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						
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

					
					</div>
				</div>
			</article>
		</header>

		
		

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-address">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
						<c:if test="${address!=null}">
						<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails" style="margin-left:20px;">

							<li class="user-addresslist">
								<span class="new-option-r"><i class="am-icon-check-circle"></i>当前地址</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">${customer.custName}</span>
									<span class="new-txt-rd2">${customer.phoneNumber}</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span>
										<span class="province">${address.province}</span>
										<span class="city">${address.city}</span>
										<span class="dist">${address.district}</span>
										<span class="street">${address.area}</span></p>
								</div>

							</li>
	
						</ul>
						</c:if>
						<div class="clear"></div>
						
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								
								<div class="am-cf am-padding">
								<c:if test="${address==null}">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">添加地址</strong> / <small>Add&nbsp;address</small></div>
								</c:if>
								<c:if test="${address!=null}">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改地址</strong> / <small>Modify&nbsp;address</small></div>
								</c:if>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal"
									action="${pageContext.request.contextPath}/customer/dealAddress.do" 
									method="post">

										
										<div class="am-form-group">
											<label for="user-address" class="am-form-label">所在地</label>
											<div class="am-form-content address">
												<select id="province" name="province"></select>  
                        						<select id="city" name="city"></select>  
                        						<select id="district" name="district"></select>  
               									<script type="text/javascript">  
                    								addressInit('province', 'city', 'district');  
               									</script> 
											</div>
										</div>

										<div class="am-form-group">
											<label for="user-intro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="area" name="area" placeholder="输入详细地址"></textarea>
												<small>50字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-6">
												<button class="am-btn am-btn-danger">保存</button>
												<a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											</div>
										</div>
										<input type="text" id="custId" name="custId" value="${customer.custId}" style="display:none"/>
										<input type="text" id="custAddress" name="custAddress" value="${customer.custAddress}" style="display:none"/>
										<input type="text" id="addressId" name="addressId" value="${address.addressId}" style="display:none"/>
									</form>
								</div>

							</div>

						</div>

					</div>

					<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
							
						})
					</script>

					<div class="clear"></div>

				</div>
				<!--底部-->
				<div class="footer">
					
					<div class="footer-bd">
						<p style="text-align:center;">
						
							<em>© 2017 liling 版权所有</em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="information.html">个人信息</a></li>
							
							<li> <a href="address.html">地址管理</a></li>
							<li> <a href="cardlist.html">快捷支付</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="order.html">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
							<li> <a href="comment.html">评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>							
							<li> <a href="walletlist.html">账户余额</a></li>
							<li> <a href="bill.html">账单明细</a></li>
						</ul>
					</li>


					<li class="person">
						<p><i class="am-icon-qq"></i>在线客服</p>
						<ul>
							<li> <a href="consultation.html">商品咨询</a></li>
							<li> <a href="suggest.html">意见反馈</a></li>							
							
							<li> <a href="news.html">我的消息</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>