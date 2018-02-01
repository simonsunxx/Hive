<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"/>
<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/basic/js/jquery-1.7.min.js"></script>

</head>

<script type="text/javascript">
var pay = "<%=request.getParameter("pay")%>";
var cashes = "<%=request.getParameter("cash")%>";
window.onload=function(){ 
if(pay=="success"){
	alert("支付成功！,您财富值还有：【" + cashes +"】");
}
} 
</script>

<body>


<!--顶部导航条 -->
<div class="am-container header">
  <ul class="message-l">
    <div class="topMessage">
     <div class="menu-hd">
       <span target="_top" class="h">您好!&nbsp;&nbsp;${customer.custName}</span>
       
     </div></div>
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



<div class="clear"></div>



<div class="take-delivery">
 <div class="status">
   <h2>您已成功付款</h2>
   <div class="successInfo">
     <ul>
       <li>付款金额<em>${order.orderTotal}</em></li>
       <div class="user-info">
         <p>收货人：${customer.custName}</p>
         <p>联系电话：${customer.phoneNumber}</p>
         <p>收货地址：${address.province}&nbsp;${address.city}&nbsp;${address.district}&nbsp;${address.area}</p>
       </div>
             <p>请认真核对您的收货信息，如有错误请联系客服</p>
             <p>剩余财富值<em>${cash}</em></p>   
                               
     </ul>
   
    </div>
  </div>
</div>


<div class="footer" >
 <div class="footer-bd">
 <p style="text-align:center">
 <em>© 2017 liling 版权所有</em>
 </p>
 </div>
</div>


</body>
</html>
