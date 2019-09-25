<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>登陆界面</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Buy_shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script src="js/simpleCart.min.js"> </script>
<!-- Custom Theme files -->
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
</head>
<body>
<div class="header_top">
	<div class="container">
		<div class="one-fifth column row_1">
			<span class="selection-box"><select class="domains valid" name="domains">
		       <option>中文</option>
		       <option>法语</option>
		       <option>德语</option>
		    </select></span>
         </div>
         <div class="cssmenu">
			<ul>
			    <li class="active"><a href="">我的账户</a></li> 
			</ul>
		 </div>
	</div>
</div>	
<div class="wrap-box"></div>
<div class="header_bottom">
	    <div class="container">
			<div class="col-xs-8 header-bottom-left">
				<div class="col-xs-2 logo">
					<h1><a href="index.jsp"><span>我的</span>小店</a></h1>
				</div>
				<div class="col-xs-6 menu">
		            <ul class="megamenu skyblue">
				      <li class="active grid"><a class="color1" onclick="getSexGoods('男士')">男士</a><div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<ul>
										<c:forEach var="mentype" items="${Mentypes}" varStatus="status">
										<li><a onclick="togoods('${mentype.ttname}')"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${mentype.ttname}</font></font></a></li>
										</c:forEach>
									</ul>	
								</div>							
							</div>
							
						  </div>
						</div>
					</li>
				    <li class="grid"><a class="color2" onclick="getSexGoods('女士')">女士</a>
					  <div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
								<ul>
										<c:forEach var="womentype" items="${Womentypes}" varStatus="status">
										<li><a onclick="togoods('${womentype.ttname}')"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${womentype.ttname}</font></font></a></li>
										</c:forEach>
									</ul>
								</div>							
							</div>
							
						  </div>
						</div>
			        </li>
				<li><a class="color4" href="about.html">关于</a></li>				
				<li><a class="color5" href="user_center_info.jsp">个人中心</a></li>
				<li><a class="color6" href="contact.html">支持</a></li>
			  </ul> 
			</div>
		</div>
	    <div class="col-xs-4 header-bottom-right">
	       <div class="box_1-cart">
		     <div class="box_11"><a href="checkout.jsp">
			<c:if test="${empty user}">
		      <h4><p>购物车: 
		      			    				    	
		      	<span>￥0</span> (<span>0</span> 件)</p><img src="images/bag.png" alt=""/><div class="clearfix"> </div></h4>
		      </c:if>
		      <c:if test="${not empty user}">
		        <h4><p>购物车: 
			    <span>￥0</span> (<span>0</span> 件)</p><img src="images/bag.png" alt=""/><div class="clearfix"> </div></h4>

			  </c:if>		      </a></div>
	          <p class="empty"><a href="javascript:;" class="simpleCart_empty"></a></p>
	          <div class="clearfix"> </div>
	        </div>
	        <div class="search">	  
				<input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
				<input type="submit" value="Subscribe" id="submit" name="submit">
				<div id="response"> </div>
		     </div>
	         <div class="clearfix"></div>
       </div>
        <div class="clearfix"></div>
	 </div>
</div>
<div class="single_top">
	 <div class="container"> 
	    <div class="register">
			  <div class="col-md-6 login-right">
			  	<h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">用户登录</font></font></h3>
				<p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">如果您没有我们的帐户，请注册。</font></font></p>
				<form>
				  <div>
					<span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">账号</font></font><label><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></label></span>
					<input type="text" id="uname"> 
				  </div>
				  <div>
					<span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">密码</font></font><label><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">*</font></font></label></span>
					<input type="password" id="pwd"> 
				  </div>
				  <a class="forgot" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">忘记密码</font></font></a>
				  <font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><input type="button" value="登录" class="btn btn-primary" onclick="login()"></font></font>
				  <div class="clearfix1"> </div>
			    </form>
			   </div>
			    <div class="col-md-6 login-left">
			  	 <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">新客户</font></font></h3>
				 <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">通过在我们的商店中创建帐户，您可以更快地完成结帐流程，存储多个送货地址，查看和跟踪您帐户中的订单等。</font></font></p>
				 <a class="acount-btn" href="register.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">创建一个帐户</font></font></a>
			   </div>	
			   <div class="clearfix"> </div>
		</div>
     </div>
</div>        
<div class="footer">
	<div class="container">
	   <div class="footer_top">
		<div class="col-md-4 box_3">
			<h3>我们的商店</h3>
			<address class="address">
              <p>9870 St Vincent Place, <br>Glasgow, DC 45 Fr 45.</p>
              <dl>
                 <dt></dt>
                 <dd>免费电话:<span> +1 800 254 2478</span></dd>
                 <dd>电话:<span> +1 800 547 5478</span></dd>
                 <dd>传真: <span>+1 800 658 5784</span></dd>
                 <dd>邮件:&nbsp; <a href="mailto@example.com">info(at)buyshop.com</a></dd>
              </dl>
           </address>
           <ul class="footer_social">
			  <li><a href=""> <i class="fb"> </i> </a></li>
			  <li><a href=""><i class="tw"> </i> </a></li>
			  <li><a href=""><i class="google"> </i> </a></li>
			  <li><a href=""><i class="instagram"> </i> </a></li>
		   </ul>
		</div>
		<div class="col-md-4 box_3">
			<h3>博客帖子</h3>
			<h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
			<p>自16世纪以来使用的标准大块Lorem Ipsum被复制</p>
			<h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
			<p>自16世纪以来使用的标准大块Lorem Ipsum被复制</p>
			<h4><a href="#">Sed ut perspiciatis unde omnis</a></h4>
			<p>自16世纪以来使用的标准大块Lorem Ipsum被复制</p>
		</div>
		<div class="col-md-4 box_3">
			<h3>支持</h3>
			<ul class="list_1">
				<li><a href="#">条款和条件</a></li>
				<li><a href="#">常问问题</a></li>
				<li><a href="#">付款</a></li>
				<li><a href="#">退款</a></li>
				<li><a href="#">跟踪订单</a></li>
				<li><a href="#">服务</a></li>
			</ul>
			<ul class="list_1">
				<li><a href="#">服务</a></li>
				<li><a href="#">按</a></li>
				<li><a href="#">博客</a></li>
				<li><a href="#">关于我们</a></li>
				<li><a href="#">联系我们</a></li>
			</ul>
			<div class="clearfix"> </div>
		</div>
		<div class="clearfix"> </div>
		</div>
		<div class="footer_bottom">
			<div class="copy">
                <p>版权所有© 2015 Buy_shop. All Rights Reserved.<a href="http://w3layouts.com/" target="_blank">版权所有</a> </p>
	        </div>
	    </div>
	</div>
</div>
<script>
	function login(){
		var uname = $("#uname").val();
		var pwd = $("#pwd").val();
		if( uname == "" || pwd == ""){
			$(".clearfix1").html("登陆信息不能为空...");
		}else{
			$.post("/shopping/userServlet",{
				op:'login',
				uname:uname,
				pwd:pwd
			},function(data){
				if( data == 1){
					$(".clearfix1").html("登陆成功，即将跳转页面...");
					setTimeout(function(){
						location.href="index.jsp";
					},1500);
				}else{
					$(".clearfix1").html("账号或者密码错误...");
				}
				
			});
		}
	}
	
function togoods(ttname){
		
		$.post("/shopping/goodsServlet",{
			op:'togoods',
			ttname:ttname
		},function(data){
			
			location.href="men.jsp";
		});
	}
	
	
function getSexGoods(tname){
		
		$.post("/shopping/goodsServlet",{
			op:'getSexGoods',
			tname:tname
		},function(data){
			location.href="men.jsp";
		});
	}
</script>
</body>
</html>		