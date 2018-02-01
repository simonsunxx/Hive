<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>


<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>欢迎</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/css/hmstyle.css" rel="stylesheet" type="text/css" />
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/util.js"></script>

	</head>
	

	<body>


		<div class="hmtop">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
						<c:choose>
							<c:when test="${login=='success'}">
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
							<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top" onclick="notLogin()"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
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
						<form action="${pageContext.request.contextPath}/product/searchProduct.do">
							<input id="searchInput" name="searchInput" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
					<c:if  test="${queryProduct=='false'}">
        	<p style="text-align:center">没有商品信息！</p>
        </c:if>
				</div>

				<div class="clear"></div>
			</div>
             <b class="line"></b>
			<div class="shopNav">
				<div class="slideall" style="height: auto;">
			        
					   <div class="long-title"><span class="all-goods">目录</span></div>
				
                
			    <div class="bannerTwo">
                      <!--轮播 -->
						<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
							<ul class="am-slides">
								<li class="banner1"><a href="introduction.html"><img src="${pageContext.request.contextPath}/images/add_1.png" /></a></li>
								<li class="banner2"><a><img src="${pageContext.request.contextPath}/images/add_2.png" /></a></li>
								<li class="banner3"><a><img src="${pageContext.request.contextPath}/images/add_3.png" /></a></li>
								<li class="banner4"><a><img src="${pageContext.request.contextPath}/images/add_4.png" /></a></li>
								<li class="banner4"><a><img src="${pageContext.request.contextPath}/images/add_5.png" /></a></li>
							</ul>
						</div>
						<div class="clear"></div>	
			    </div>

						<!--侧边导航 -->
						<div id="nav" class="navfull" style="position: static;">
							<div class="area clearfix">
								<div class="category-content" id="guide_2">
									
									<div class="category" style="box-shadow:none ;margin-top: 2px;">
										<ul class="category-list navTwo" id="js_climit_li">
										<c:forEach items="${categories}" var="category" begin="0" end="8">
										
											<li>
												<div class="category-info">
													
													<h3 class="category-name b-category-name"><i><img src="${pageContext.request.contextPath}/images/menu.png"></i>
														<a class="ml-22" title="${category.categoryName}" 
															href="${pageContext.request.contextPath}/product/getProductsByCategory/${category.categoryId}.do">
															${category.categoryName}
														</a>
													</h3>
													<em>&gt;</em></div>
												<!--  <div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span title="电脑">电脑</span></dt>
																		<dd><a title="联想" href="#"><span>联想</span></a></dd>
																		<dd><a title="苹果" href="#"><span>苹果</span></a></dd>
																		<dd><a title="戴尔" href="#"><span>戴尔</span></a></dd>
																		<dd><a title="华硕" href="#"><span>华硕</span></a></dd>
																		<dd><a title="惠普" href="#"><span>惠普</span></a></dd>
																	
																	</dl>
																	<dl class="dl-sort">
																		<dt><span title="硬盘">硬盘</span></dt>
																		<dd><a title="100G" href="#"><span>100G</span></a></dd>
																		<dd><a title="200G" href="#"><span>200G</span></a></dd>
																		<dd><a title="300G" href="#"><span>300G</span></a></dd>
																		<dd><a title="400G" href="#"><span>400G</span></a></dd>
																		<dd><a title="500G" href="#"><span>500G</span></a></dd>
																		
																	</dl>

																</div>
															</div>
														</div>
													</div>
												</div>
												-->
											<b class="arrow"></b>	
											</li>
											</c:forEach>
											<li>
												<div class="category-info">
													
													<h3 class="category-name b-category-name"><i><img src="${pageContext.request.contextPath}/images/menu.png"></i>
														<a class="ml-22" title="MORE" 
															href="${pageContext.request.contextPath}/product/getAllCategories.do">
															MORE >>
														</a>
													</h3>
													<em>&gt;</em></div>
												<!-- <div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	<dl class="dl-sort">
																		<dt><span title="电脑">电脑</span></dt>
																		<dd><a title="联想" href="#"><span>联想</span></a></dd>
																		<dd><a title="苹果" href="#"><span>苹果</span></a></dd>
																		<dd><a title="戴尔" href="#"><span>戴尔</span></a></dd>
																		<dd><a title="华硕" href="#"><span>华硕</span></a></dd>
																		<dd><a title="惠普" href="#"><span>惠普</span></a></dd>
																	
																	</dl>
																	<dl class="dl-sort">
																		<dt><span title="硬盘">硬盘</span></dt>
																		<dd><a title="100G" href="#"><span>100G</span></a></dd>
																		<dd><a title="200G" href="#"><span>200G</span></a></dd>
																		<dd><a title="300G" href="#"><span>300G</span></a></dd>
																		<dd><a title="400G" href="#"><span>400G</span></a></dd>
																		<dd><a title="500G" href="#"><span>500G</span></a></dd>
																		
																	</dl>

																</div>
															</div>
														</div>
													</div>
												</div>
												 -->
											<b class="arrow"></b>	
											</li>	
										</ul>
									</div>
								</div>

							</div>
						</div>
						<!--导航 -->
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>
					
			
				<div class="clear"></div>	
					<!--走马灯 -->

					<div class="marqueenTwo">
						<span class="marqueen-title"><i class="am-icon-volume-up am-icon-fw"></i>商城头条<em class="am-icon-angle-double-right"></em></span>
						<div class="demo">

							<ul>
								<li class="title-first"><a target="_blank" href="#">
									<span>[特惠]</span>洋河年末大促，低至两件五折							
								</a></li>
								<li class="title-first"><a target="_blank" href="#">
									<span>[公告]</span>商城与广州市签署战略合作协议
								     
							    </a></li>																    							    
								<li><a target="_blank" href="#"><span>[特惠]</span>女生节商城爆品1分秒	</a></li>
								<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
								<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券 买1送1！</a></li>
								<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
								<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
						
							</ul>
                       
						</div>
					</div>
					<div class="clear"></div>
				
				</div>
				
				
							
				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">
				<div class="am-container" style="margin-bottom:20px">
					 <div class="am-g am-g-fixed ">
					 	<c:if test="${param.moreCategories == 'true'}">
					 		<c:forEach items="${categories}" var="category">
					 		<a class="am-btn am-btn-default am-btn-xs" style="margin:5px;"
					 		href="${pageContext.request.contextPath}/product/getProductsByCategory/${category.categoryId}.do">
					 		${category.categoryName}
					 		</a>
					 		</c:forEach>
					 	</c:if>
					 </div>
				</div>

					<!--今日推荐 -->

					<div class="am-container" style="margin-bottom:20px">
					
                     <div class="sale-mt">
		                <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
							<h3 class="am-titlebar-title ">
								今日推荐
							</h3>
						</div>
						  
		                   <em class="sale-title">今日推荐</em>
	                  </div>
					  

					
					  <div class="am-g am-g-fixed sale">
					  <c:forEach items="${dailyRecommends}" var="dailyRecommend">
						<div class="am-u-sm-3 sale-item">
							<div class="s-img">
								<a href="${pageContext.request.contextPath}/product/getProductById/${dailyRecommend.productId}.do">
								 <img src="${dailyRecommend.picSmall}" /></a>
							</div>
                           <div class="s-info">
                           	   <a href="${pageContext.request.contextPath}/product/getProductById/${dailyRecommend.productId}.do"><p class="s-title">${dailyRecommend.productName}</p></a>
                           	   <div class="s-price">￥<b>${dailyRecommend.presentPrice}</b>
                           	   	  <a class="s-buy" href="${pageContext.request.contextPath}/product/getProductById/${dailyRecommend.productId}.do">购买</a>
                           	   </div>                          	  
                           </div>								
						</div>
						</c:forEach>
												
					  </div>
                   </div>
					<div class="clear "></div>
            <div class="am-g am-g-fixed ">
      <div class="am-u-sm-12">
      
      <c:if test="${queryProduct=='true'}">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
          <thead style="font-weight:bold">
          <tr>
            <th>商品名</th><th>现价</th><th>原价</th><th>保修期</th><th>描述</th><th></th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${products}" var="product">
          <tr>
			<td><a href="${pageContext.request.contextPath}/product/getProductById/${product.productId}.do">${product.productName}</a></td>
			<td>${product.presentPrice}</td>
			<td>${product.originalPrice}</td> 
			<td>${product.warrantyPeriod}年</td>
			<td style="max-width:400px;">${product.productDescription}</td>
            <td>
                <button class="am-btn am-btn-success am-btn-xs"><a href="${pageContext.request.contextPath}/product/getProductById/${product.productId}.do">点击购买</a></button>
            </td>
			
          </tr>
          </c:forEach> 
          </tbody>
        </table>

        </c:if>
        	
        
      </div>
    </div>  
                    					
            
            
					<div class="footer ">
						<div class="footer-bd ">
							<p style="text-align:center">
								<em>© 2017 liling版权所有</em>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<!--引导 -->
		<div class="navCir">
			<li class="active"><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
		<!--菜单 -->
		<div class=tip>
			<div id="sidebar">
				<div id="wrap">
					<div id="prof" class="item ">
						<a href="# ">
							<span class="setting "></span>
						</a>
						<div class="ibar_login_box status_login ">
							<div class="avatar_box ">
								<p class="avatar_imgbox "><img src="${pageContext.request.contextPath}/images/no-img_mid_.jpg " /></p>
								<ul class="user_info ">
									<li>用户名：sl1903</li>
									<li>级&nbsp;别：普通会员</li>
								</ul>
							</div>
							<div class="login_btnbox ">
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
							<i class="icon_arrow_white "></i>
						</div>

					</div>
					<div id="shopCart " class="item ">
						<a href="# ">
							<span class="message "></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num ">0</p>
					</div>
					<div id="asset " class="item ">
						<a href="# ">
							<span class="view "></span>
						</a>
						<div class="mp_tooltip ">
							我的资产
							<i class="icon_arrow_right_black "></i>
						</div>
					</div>

					<div class="quick_toggle ">
						<li class="qtitem ">
							<a href="# "><span class="kfzx "></span></a>
							<div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
						</li>
						<!--二维码 -->
						<li class="qtitem ">
							<a href="#none "><span class="mpbtn_qrcode "></span></a>
							<div class="mp_qrcode " style="display:none; "><img src="${pageContext.request.contextPath}/images/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>
						</li>
						<li class="qtitem ">
							<a href="#top " class="return_top "><span class="top "></span></a>
						</li>
					</div>

					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>

				</div>

			</div>
			<div id="prof-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					我
				</div>
			</div>
			<div id="shopCart-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					购物车
				</div>
			</div>
			<div id="asset-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					资产
				</div>

				<div class="ia-head-list ">
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">优惠券</div>
					</a>
					<a href="# " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">红包</div>
					</a>
					<a href="# " target="_blank " class="pl money ">
						<div class="num ">￥0</div>
						<div class="text ">余额</div>
					</a>
				</div>

			</div>


		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="basic/js/quick_links.js "></script>
	</body>

</html>