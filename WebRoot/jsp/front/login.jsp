<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>


<!DOCTYPE html>
<html>
  <head>
    
	<meta charset="UTF-8">
		<title>会员登录</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" />
		<link href="${pageContext.request.contextPath}/css/dlstyle.css" rel="stylesheet" type="text/css">

  </head>


<script language="javascript">
function checkEmpty(form){
if(form.elements.value==""){
alert("表单信息不能为空");
return false;
}
}
</script>
<script language="javascript"> 
var login = "<%=request.getParameter("login")%>";
window.onload=function(){ 
if(login=="notexist"){
	alert("不存在该用户，请重新登录！");
}
if(login=="wrongpwd"){
	alert("密码错误，请重新登录！");
	}
} 

</script> 
 <body>
	
		<div class="login-boxtitle">
			
		</div>

		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="${pageContext.request.contextPath}/images/big.jpg" /></div>
				<div class="login-box">
							<h3 class="title">登录商城</h3>

							<div class="clear"></div>
						
						<div class="login-form">
						  <form name="form" 
						  	action="${pageContext.request.contextPath}/customer/login.do" 
							method="post" 
							onSubmit="return checkEmpty(form)">
							   <div class="user-name">
								    <label for="user"><i class="am-icon-user"></i></label>
								    <input type="text" name="custName" id="custName" placeholder="用户名">
                 				</div>
                 				<div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="custPassword" id="custPassword" placeholder="请输入密码">
                 				</div>
                 				
								<a href="${pageContext.request.contextPath}/jsp/front/register.jsp" class="zcnext am-fr am-btn-default">注册</a>
            		</div>

					<div class="am-cf">
						<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
					</div>
              			</form>
           			</div>
			</div>
		</div>


		<div class="footer">
			<div class="footer-bd">
				<p  style="text-align:center">
					<em>© 2017 liling.com 版权所有</em>
				</p>
			</div>
		</div>
	</body>
</html>
