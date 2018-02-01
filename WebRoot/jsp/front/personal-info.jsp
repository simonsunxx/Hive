<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人资料</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="${pageContext.request.contextPath}/js/util.js"></script>			
	</head>
<script language="javascript"> 
var update = "<%=request.getParameter("update")%>";
window.onload=function(){ 
if (update=="success"){
	alert("信息修改成功");
}
if (update=="fail"){
	alert("信息失败");
}
var modifyFrom = document.getElementById('modifyFrom');
var modifybtn = document.getElementById('modifybtn');

	modifybtn.onclick = function(){
		
		
		var password = $("#custPassword").val();
		var password2 = $("#confirmpwd").val();
		var custCashes =$('#custCashes').val();
		 if(password!="" &&password == password2 && (!(isNaN(custCashes)))&&Number(custCashes)>=0){
		 	modifyFrom.submit();
		 }
		 else{
		 	if(password != password2){
		 		alert("两次密码不一致！");
		 	}
		 	
		 	if(isNaN(custCashes)){
		 		alert("充值框不是数字！");
		 	}
		 	else if(Number(custCashes)<0){
		 		alert("充值必须大于等于0！");
		 	}
		 	else{
		 		alert(custCashes.isNaN());
		 		alert(Number(custCashes)<0);
		 	}
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

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button class="am-btn am-btn-default" onclick="modifyCustInfo()">修改信息</button>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail" src="${pageContext.request.contextPath}/images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${customer.custName}</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">会员专享</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form id="modifyFrom" class="am-form am-form-horizontal" 
							action="${pageContext.request.contextPath}/customer/update.do" 
							method="post">

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" id="custName" name="custName" value="${customer.custName}" readonly>
										
										<input type="text" id="custId" name="custId" value="${customer.custId}" style="display:none">
                                         
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">登录密码</label>
									<div class="am-form-content">
										<input type="password" id="custPassword" name="custPassword" value="${customer.custPassword}" disabled="true">
                                         
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">确认密码</label>
									<div class="am-form-content">
										<input type="password" id="confirmpwd" name="confirmpwd" value="${customer.custPassword}" disabled="true">
                                         
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<c:if test="${customer.gender.equals('M')}">
											<label class="am-radio-inline">
											<input type="radio" name="gender" id="male" value="M" data-am-ucheck disabled="true" checked> 男
											</label>
											<label class="am-radio-inline">
											<input type="radio" name="gender" id="female" value="F" data-am-ucheck disabled="true"> 女
											</label>
										</c:if>
										<c:if test="${customer.gender.equals('F')}">
											<label class="am-radio-inline">
											<input type="radio" name="gender" id="male" value="M" data-am-ucheck disabled="true"> 男
											</label>
											<label class="am-radio-inline">
											<input type="radio" name="gender" id="female" value="F" data-am-ucheck disabled="true" checked> 女
											</label>
										</c:if>
										
										
									
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-email" class="am-form-label">生日</label>
									<div class="am-form-content am-datepicker-date" data-am-datepicker="{format: 'dd-mm-yyyy'}">
										<input type="text" class="am-form-field" id="birthdate" name="birthdate" value="${customer.birthdate}" data-am-datepicker readonly disabled="true"/>

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="phoneNumber" name="phoneNumber" value="${customer.phoneNumber}" type="tel" disabled="true">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="email" name="email" value="${customer.email}" type="email" disabled="true">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">财富值</label>
									<div class="am-form-content">
									<div>
										<div class="am-input-group">
											<input type="text" class="am-form-field" value="${customer.custCashes}" id="custCashes" name="custCashes" disabled="disabled">
												<input type="text" id="precustCashes" name="precustCashes" value="${customer.custCashes}" style="display:none">
											<span class="am-input-group-btn">
												<button id="recharge" class="am-btn am-btn-primary"  type="button" disabled="true" onclick="charge()">充值</button>
											</span>
										</div>
								
									</div>
									</div>
	
								</div>
								
							
								<div class="info-btn">
									
									<input id="modifybtn" type="button" class="am-btn am-btn-danger" value="保存修改"/>
								</div>
								
							
							<c:if test="${param.register.equals('exist')}">
								<div >该用户已存在</div>
							</c:if>
							<c:if test="${param.register.equals('fail')}">
								<div>注册失败！</div>
							</c:if>

							</form>
						</div>

					</div>

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
							<li> <a href="personal-info.jsp">个人信息</a></li>
							
							<li> <a href="${pageContext.request.contextPath}/jsp/front/address.jsp">地址管理</a></li>
							<li> <a href="#">快捷支付</a></li>
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
							
							<li> <a href="#">我的消息</a></li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>