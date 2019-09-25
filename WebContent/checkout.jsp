<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>购物屋</title>
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
			    <li class="active"><a href="login.jsp" class="login">
			    	<c:if test="${empty user}">
			    	<script>

						alert("请先登录");
						location.href="login.jsp";

					</script>
			    	</c:if>
			    	<c:if test="${not empty user}">
			    		欢迎您:<a class="name">${user.uname}</a>
			    	</c:if>
			    </a></li> 
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
				<li><a class="color5" href="404.html">博客</a></li>
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
			    <span>￥${totalprice}</span> (<span>${carsize}</span> 件)</p><img src="images/bag.png" alt=""/><div class="clearfix"> </div></h4>

			  </c:if>			      </a></div>
	          <p class="empty"><a href="javascript:;" class="simpleCart_empty"></a></p>
	          <div class="clearfix"> </div>
	        </div>
	        
	         <div class="clearfix"></div>
       </div>
        <div class="clearfix"></div>
	 </div>
</div>
<div class="container">
	<div class="check">	 
		<div class="col-md-9 cart-items">
			 <h1><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">我的购物袋（${carsize}）</font></font></h1>
				
			   <c:forEach var="c" items="${car}" varStatus="status">
			 <div class="cart-header">
				 <div class="close1" onclick="deletecar('${c.cno}')"> </div>
				 <div class="cart-sec simpleCart_shelfItem">
				 <span  style="display:none" class="mygno">${c.gno}</span>
				 <span  style="display:none" id="myuid">${user.uid}</span>
				 <span  style="display:none" class="mysize">${c.size}</span>
				 <span  style="display:none" id="mycount">${carsize}</span>
				 <span  style="display:none" class="mynum">${c.num}</span>
						<div class="cart-item cyc">
						
							 <img src="${c.pics}" class="img-responsive" alt="">
						</div>
					   <div class="cart-item-info">
						<h3><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${c.gname}</font></font></a><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">型号：3578</font></font></span></h3>
						<ul class="qty">
							<li><p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">尺寸：${c.size}</font></font></p></li>
							<li><p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">数量：${c.num}</font></font></p></li>
						</ul>
						<div class="delivery">
							 <p><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">单价：${c.price}</font></font></p>
							 <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">总价:${c.price*c.num}</font></font></span>
							 <div class="clearfix"></div>
				        </div>	
					   </div>
					   <div class="clearfix"></div>
											
				  </div>
			 </div>
			 </c:forEach>
			 <script>$(document).ready(function(c) {
					$('.close2').on('click', function(c){
							$('.cart-header2').fadeOut('slow', function(c){
						$('.cart-header2').remove();
					});
					});	  
					});
			 </script>
			 
		 </div>
		 <div class="col-md-3 cart-total">
			 <a class="continue" href="index.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">继续购物</font></font></a>
			 <div class="price-details">
				 <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">价格细节</font></font></h3>
				 <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">总计</font></font></span>
				 <span class="total1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${totalprice}</font></font></span>
				 <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">折扣</font></font></span>
				 <span class="total1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">--- </font></font></span>
				 <span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">运费</font></font></span>
				 <span class="total1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">15.00</font></font></span>
				 <div class="clearfix"></div>				 
			 </div>	
			 <ul class="total_price">
			   <li class="last_price"> <h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">总价：</font></font></h4></li>	
			   <li class="last_price"><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${totalprice+15}</font></font></span></li>
			   <div class="clearfix"> </div>
			 </ul>
			
			 
			 <div class="clearfix"></div>
			 <a class="order" onclick="toOrder('${user.uid}')"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">下订单</font></font></a>
			 <div class="total-item">
				 <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">OPTIONS</font></font></h3>
				 <h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">优惠券</font></font></h4>
				 <a class="cpns" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;" onclick="a()">申请优惠券</font></font></a>
				 <p><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></a><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></p>
			 </div>
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
function togoods(ttname){
	
	$.post("/shopping/goodsServlet",{
		op:'togoods',
		ttname:ttname
	},function(data){
		
		location.href="men.jsp";
	});
}
function a(){
	alert("抱歉！暂时没有优惠券...");
}

function getSexGoods(tname){
	
	$.post("/shopping/goodsServlet",{
		op:'getSexGoods',
		tname:tname
	},function(data){
		location.href="men.jsp";
	});
}

function deletecar(cno){
	var uname = $(".name").html();
	if(confirm("是否删除该商品？")){
		$.post("/shopping/carServlet",{
			op:'deletecar',
			cno:cno,
			uname:uname
		},function(data){
			alert("删除成功！");
			location.reload();
		});
	}
	
}

function toOrder(uid){
	
	
	$.post("/shopping/carServlet",{
		op:'getorder',
		uid:uid
		
	},function(data){
		if(data > 0){
			var oid = data;
			addordergoods(oid);
			alert("提交订单成功！");
			location.href="place_order.jsp";
			
			
		}else{
			alert("提交订单失败！");
		}
	});
}
function addordergoods(oid){
	var mycount = $("#mycount").html();
	for(var i = 0; i<mycount ;i++){
		var gno = $(".mygno").eq(i).html();
		var uid = $("#myuid").html();
		var size = $(".mysize").eq(i).html();
		var num = $(".mynum").eq(i).html();
		addorderinfo(oid,gno,uid,size,num);
	}
}
function addorderinfo(oid,gno,uid,size,num){
	$.post("/shopping/orderServlet",{
		op:'addorderinfo',
		oid:oid,
		gno:gno,
		uid:uid,
		size:size,
		num:num
	},function(data){
		
	});
}
</script>
</body>
</html>		