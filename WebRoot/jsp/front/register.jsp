<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>用户注册</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>			
		<script src="${pageContext.request.contextPath}/js/util.js"></script>
	</head>

	<script type="text/javascript">
	window.onload = function () {
	var registerFrom = document.getElementById('registerFrom');
	var registerbtn = document.getElementById('registerbtn');
	registerbtn.onclick = function(){
		var custName = $("#custName").val();
		
		var password = $("#custPassword").val();
		var password2 = $("#confirmpwd").val();
		
		 if(custName.length>0 && custName.length<20 && password!="" &&password == password2){
		 	registerFrom.submit();
		 }
		 else{
		 	if(custName == ""){
		alert("用户名为空！"); 
		}
		else if(custName.length>20){
			alert("用户名过长！");
		}
		if(password == ""){
		alert("未设置密码！");
		}
		else if(password != password2){
		 	alert("两次密码不一致！");
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
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">用户注册</strong> / <small>Customer&nbsp;register</small></div>
						</div>
						<hr/>

					

						<!--个人信息 -->
						<div class="info-main">
							<form id="registerFrom" class="am-form am-form-horizontal" 
							action="${pageContext.request.contextPath}/customer/register.do" 
							method="post"
							>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" id="custName" name="custName" placeholder="nickname">
                                          <small>昵称长度不能超过20个字符</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">登录密码</label>
									<div class="am-form-content">
										<input type="password" id="custPassword" name="custPassword" placeholder="password">
                                         
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">确认密码</label>
									<div class="am-form-content">
										<input type="password" id="confirmpwd" name="confirmpwd" placeholder="password">
                                         
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="gender" id="male" value="M" data-am-ucheck> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="gender" id="female" value="F" data-am-ucheck> 女
										</label>
									
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-email" class="am-form-label">生日</label>
									<div class="am-form-content am-datepicker-date" data-am-datepicker="{format: 'dd-mm-yyyy'}">
										<input type="text" class="am-form-field" id="birthdate" name="birthdate" placeholder="2017-04-13" data-am-datepicker readonly />

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="phoneNumber" name="phoneNumber" placeholder="phonenumber" type="tel">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="email" name="email" placeholder="Email" type="email">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">财富值</label>
									<div class="am-form-content">
								
											<input type="text" class="am-form-field" value="2000000.00" id="custCashes" name="custCashes" disabled="disabled">
									
								
								
									</div>
	
								</div>
								
							
								<div class="info-btn">
									<input id="registerbtn" type="button" class="am-btn am-btn-danger" value="注册"/>
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
						<a href="index.html"><i class="am-icon-user"></i>相关链接</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							
							<li> <a href="${pageContext.request.contextPath}/jsp/front/address.jsp">地址管理</a></li>
						</ul>
					</li>
				


					<li class="person">
						<p><i class="am-icon-qq"></i>在线客服</p>
						<ul>
							<li> <a href="#">商品咨询</a></li>
							<li> <a href="#">意见反馈</a></li>		
						</ul>
					</li>
				</ul>

			</aside>

		</div>

	</body>

</html>