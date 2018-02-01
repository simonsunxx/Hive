<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>

	</head>
	<script type="text/javascript">
	var removeCart = "<%=request.getParameter("removeCart")%>";
	
	window.onload=function(){ 
	if(removeCart=="fail"){
		alert("移除购物车失败！");
	}
} 
	</script>

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
					<!-- <a name="index_none_header_sysc" href="#"></a>
					<form action="">
						<input id="custId" name="custId" value="${customer.custId}" style="display:none;"/>
						<input id="searchInput" name="searchInput" type="text" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
					</form>
					-->
				</div>
				 
			</div>

			<div class="clear"></div>

			<!--购物车 -->
			<div class="concent">
			<c:choose>
				<c:when test ="${emptyCart=='false'}">
				<form action="${pageContext.request.contextPath}/cart/cartPay.do" method="post"> 
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
								<div class="td-inner">操作</div>
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
							
							<c:forEach items="${carts}" var="cart">
								<ul class="item-content clearfix">
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="${cart.cartId}" name="cartIds" value="${cart.cartId}" type="checkbox">
											<input id="custId" name="custId" type="text" value="${customer.custId}" style="display:none;" />
											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										
										<div class="item-pic">
											<a href="${pageContext.request.contextPath}/product/getProductById/${cart.productId}.do" target="_blank" data-title="商品名字" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="${cart.picSmall}" class="itempic J_ItemImg" style="width:80px;height:80px;"></a>
										</div>
										
										<div class="item-info">
											<div class="item-basic-info">
												<a href="${pageContext.request.contextPath}/product/getProductById/${cart.productId}.do" target="_blank" title="商品名字" class="item-title J_MakePoint" data-point="tbcart.8.11">${cart.productName}</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">
											${cart.productDescription}
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${cart.originalPrice}</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">${cart.unitPrice}</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="min am-btn" name="" type="button" value="-" />
													<input class="text_box" name="quantity" type="text" value="${cart.quantity}" style="width:30px;" />
													<input class="add am-btn" name="" type="button" value="+" />
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${cart.totalExpense}</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<a title="移出购物车" class="btn-fav" href="${pageContext.request.contextPath}/cart/removeCart/${cart.cartId}.do">
                  							移出购物车</a>
											
										</div>
									</li>
								</ul>
								</c:forEach>
								
							</div>
						</div>
					</tr>
					<div class="clear"></div>
				</div>
				
				<div class="clear"></div>

				<div class="float-bar-wrapper">
					<div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" id="checkAll" name="checkAll" value="false" type="checkbox" onclick="selectAll()">
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span>全选</span>
					</div>
					<div class="operations">
						
						<a href="#" hidefocus="true" class="J_BatchFav" onclick="removeCarts()"> 移出购物车</a>
					</div>
					<div class="float-bar-right">
						<!-- <div class="amount-sum">
							<span class="txt">已选商品</span>
							<em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="J_Total">0.00</em></strong>
						</div>
						 -->
						<div class="btn-area">
							<!--  <button type="submit" id="J_Go" class="submit-btn submit-btn-disabled" onclick="cartPay()">
								结&nbsp;算</button>-->
								<button class="am-btn am-btn-warning am-btn-xl" style="height:100%;width:100%;float:left">
 									 <i class="am-icon-shopping-cart"></i>
  										<font size="3">结&nbsp;算</font>
									</button>
						</div>
					</div>

				</div>
				</form> 
				</c:when>
				<c:otherwise>
				<div style = "margin:20px;padding:20px;font-size:14px;text-align:center">
				<p>购物车空空如也~ &nbsp;&nbsp; 快去选购吧！</p>
				</div>
				
				</c:otherwise>
				
				</c:choose>
				<div class="footer">
					<div class="footer-bd">
						<p style="text-align:center">
							<em>© 2017 liling 版权所有</em>
						</p>
					</div>
				</div>

			</div>

		
				</div>
	<script type="text/javascript">
		function selectAll() {
		//alert("checkAll");
		var checkAll = $("#checkAll");
		//var checkbox = document.form[0].all
		var code_Values = document.all["cartIds"];  
		if(checkAll.val() == "false"){//全选

 		if (code_Values.length) {  
   	 		for ( var i = 0; i < code_Values.length; i++) {  
      			code_Values[i].checked = true;  
    		}  
  		} 
  		else {  
   			code_Values.checked = true;  
  			}
  		 checkAll.val("true");
		}
		else{//全不选
  
  			if (code_Values.length) {  
    		for ( var i = 0; i < code_Values.length; i++) {  
      			code_Values[i].checked = false;  
    			}  
  			} else {  
    			code_Values.checked = false;  
  			} 
  			checkAll.val("false"); 
		}
		}
	   function removeCarts(){
	   //alert("removeCarts");
		var cartIds = [];
		//var custId = $("#custId").val();
		$('input:checkbox:checked').each(function() {  
                cartIds.push($(this).val());  
            });  
		 $.ajax({
          url: "${pageContext.request.contextPath}/cart/removeCarts.do",
          cache:false,
          traditional:true,//序列化
          type: "POST",
          dataType: "json",
          data: {
            "cartIds":cartIds
          },
          success: function(data) {
          	
          	if(data.deleteCarts=="success"){
          		alert("已成功移除");
          	}
          	else {
          		alert("删除失败");
          	}
            
            },
          error: function() {
            alert("error！");
          }
        });
        window.location.reload();
	}

	</script>
		
	</body>

</html>