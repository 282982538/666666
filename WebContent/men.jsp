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
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
</head>
<body>
<div class="header_top">
	<div class="container">
		<div class="one-fifth column row_1">
			<span class="selection-box"><select class="domains valid" name="domains">
			   <option>中文</option>
		       <option>英语</option>
		       <option>法语</option>
		       <option>德语</option>
		    </select></span>
         </div>
         <div class="cssmenu">
			<ul>
			    <li class="active"><a href="login.jsp">
			    	<c:if test="${empty user}">
			    		登陆
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
			    <span>￥${totalprice}</span> (<span>${carsize}</span> 件)</p><img src="images/bag.png" alt=""/><div class="clearfix"> </div></h4>

			  </c:if>
		      </a></div>
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
<span  style="display:none" class="myuid">${user.uid}</span>
<div class="container">
<div class="women_main">
	<div class="col-md-9 w_content">
	    <div class="women">
			<a href="#"><h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">全部商品  - </font></font><span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${goods.size()}项</font></font></span> </h4></a>
			<ul class="w_nav">
						<li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">排序： </font></font></li>
		     			<li><a class="active" href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">流行</font></font></a></li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> |
		     			</font></font><li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">新 </font></font></a></li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> |
		     			</font></font><li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">折扣</font></font></a></li><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> |
		     			</font></font><li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">价格：低位 </font></font></a></li> 
		     			<div class="clear"></div>	
		     </ul>
		     <div class="clearfix"></div>	
		</div>
		<!-- grids_of_4 -->
		<div class="grids_of_4">
		<c:forEach var="good" items="${goods}" varStatus="status">
		  <div class="grid1_of_4 simpleCart_shelfItem">
				<div class="content_box"><a href="single.jsp">
				
				
			   	  </a><div class="view view-fifth"><a onclick="tosinglegoods('${good.gname}')">
			   	   	 <img src="${good.pics}" class="img-responsive" alt="">
				   	   	<div class="mask1">
	                        
			            </div>
				   	  </a>
				   </div>
				    <h5><a onclick="tosinglegoods('${good.gname}')"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${good.gname}</font></font></a></h5>
				    <h6><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"></font></font></h6>
				     <div class="size_1">
				     	<span class="item_price"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">￥ ${good.price}</font></font></span>
				       <select class="item_Size" name="size" id="">
				       <c:forEach var="size" items="${sizes}" varStatus="status">
						<option value="${size.size}" class="size${size.sid}">${size.size}</option>
						</c:forEach>
		      		    </select>
		      		    <div class="clearfix"></div>
		      		  </div>
		      		  <div class="size_2">
		      		    <div class="size_2-left"> 
					       <input type="text" class="item_quantity quantity_1" value="1" id="count${good.gno}" name="count">
					    </div>
			    	    <div class="size_2-right"><input type="submit" class="item_add add3" value="" onclick="addCar('${user.uid}','${good.gno}')"></div>
			    	    <div class="clearfix"> </div>
			    	 </div>
			    	 
			     </div>
			</div>
			</c:forEach>
			
			
			
			<div class="clearfix"></div>
		</div>
		<div class="pager">
					<ul class="clear">
						<li class="previous"><a href="javascript:void(0)" onclick="changePage(-1)">上一页></a></li>
						<li>
							<strong>
								<span class="mypage">${page}</span> /
								<span class="mypages">${pages}</span>
							</strong>
						</li>
						<li class="next"><a href="javascript:void(0)" onclick="changePage(1)">下一页></a></li>
					</ul>
				</div>
		
		<!-- end grids_of_4 -->
	</div>
	<!-- start sidebar -->
	<div class="col-md-3">
	  <div class="w_sidebar">
		<div class="w_nav1">
			<h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">所有</font></font></h4>
			<ul>
				<li><a href="women.html"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">妇女</font></font></a></li>
				<li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">新来的人</font></font></a></li>
				<li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">趋势</font></font></a></li>
				<li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">男孩</font></font></a></li>
				<li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">女孩</font></font></a></li>
				<li><a href="#"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">拍卖</font></font></a></li>
			</ul>	
		</div>
		<h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">过滤</font></font></h3>
		<section class="sky-form">
					<h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">catogories</font></font></h4>
						<div class="row1 scroll-pane jspScrollable" tabindex="0" style="overflow: hidden; padding: 0px; width: 253px;">
							
							
						<div class="jspContainer" style="width: 253px; height: 200px;"><div class="jspPane" style="padding: 0px; width: 284px; top: 0px;"><div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">kurtas</font></font></label>
							</div><div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">kutis</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">churidar kurta</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">salwar</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">印花纱丽</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">SHREE</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">阿努克</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">BIBA</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时尚纱丽</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时尚纱丽</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时尚纱丽</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时尚纱丽</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时尚纱丽</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时尚纱丽</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时尚纱丽</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">时尚纱丽</font></font></label>	
							</div></div><div class="jspVerticalBar"><div class="jspCap jspCapTop"></div><div class="jspTrack" style="height: 200px;"><div class="jspDrag" style="height: 76px;"><div class="jspDragTop"></div><div class="jspDragBottom"></div></div></div><div class="jspCap jspCapBottom"></div></div></div></div>
		</section>
		<section class="sky-form">
					<h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">牌</font></font></h4>
						<div class="row1 scroll-pane jspScrollable" tabindex="0" style="overflow: hidden; padding: 0px; width: 253px;">
							
							
						<div class="jspContainer" style="width: 253px; height: 200px;"><div class="jspPane" style="padding: 0px; width: 284px; top: 0px;"><div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">SHREE</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">阿努克</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">BIBA</font></font></label>
							</div><div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">vishud</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">あ</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">SHREE</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">阿努克</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">BIBA</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">SHREE</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">阿努克</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">BIBA</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">SHREE</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">阿努克</font></font></label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">BIBA</font></font></label>																								
							</div></div><div class="jspVerticalBar"><div class="jspCap jspCapTop"></div><div class="jspTrack" style="height: 200px;"><div class="jspDrag" style="height: 86px;"><div class="jspDragTop"></div><div class="jspDragBottom"></div></div></div><div class="jspCap jspCapBottom"></div></div></div></div>
		</section>
		<section class="sky-form">
			<h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">颜色</font></font></h4>
			<ul class="w_nav2">
				<li><a class="color1" href="#"></a></li>
				<li><a class="color2" href="#"></a></li>
				<li><a class="color3" href="#"></a></li>
				<li><a class="color4" href="#"></a></li>
				<li><a class="color5" href="#"></a></li>
				<li><a class="color6" href="#"></a></li>
				<li><a class="color7" href="#"></a></li>
				<li><a class="color8" href="#"></a></li>
				<li><a class="color9" href="#"></a></li>
				<li><a class="color10" href="#"></a></li>
				<li><a class="color12" href="#"></a></li>
				<li><a class="color13" href="#"></a></li>
				<li><a class="color14" href="#"></a></li>
				<li><a class="color15" href="#"></a></li>
				<li><a class="color5" href="#"></a></li>
				<li><a class="color6" href="#"></a></li>
				<li><a class="color7" href="#"></a></li>
				<li><a class="color8" href="#"></a></li>
				<li><a class="color9" href="#"></a></li>
				<li><a class="color10" href="#"></a></li>
			</ul>
		</section>
		<section class="sky-form">
						<h4><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">折扣</font></font></h4>
						<div class="row1 scroll-pane jspScrollable" tabindex="0" style="overflow: hidden; padding: 0px; width: 253px;">
							
							
						<div class="jspContainer" style="width: 253px; height: 200px;"><div class="jspPane" style="padding: 0px; width: 284px; top: 0px;"><div class="col col-4">
								<label class="radio"><input type="radio" name="radio" checked=""><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">60％及以上</font></font></label>
								<label class="radio"><input type="radio" name="radio"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">50％及以上</font></font></label>
								<label class="radio"><input type="radio" name="radio"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">40％以上</font></font></label>
							</div><div class="col col-4">
								<label class="radio"><input type="radio" name="radio"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">30％以上</font></font></label>
								<label class="radio"><input type="radio" name="radio"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">20％及以上</font></font></label>
								<label class="radio"><input type="radio" name="radio"><i></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">10％及以上</font></font></label>
							</div></div><div class="jspVerticalBar"><div class="jspCap jspCapTop"></div><div class="jspTrack" style="height: 200px;"><div class="jspDrag" style="height: 184px;"><div class="jspDragTop"></div><div class="jspDragBottom"></div></div></div><div class="jspCap jspCapBottom"></div></div></div></div>						
		</section>
	  </div>
   </div>
	<!-- start content -->
   <div class="clearfix"></div>
   <!-- end content -->
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
		<%
	String aa = request.getParameter("count");
%>
		<div class="footer_bottom">
			<div class="copy">
                <p>版权所有© 2015 Buy_shop. All Rights Reserved.<%=aa %><a href="http://w3layouts.com/" target="_blank">版权所有</a> </p>
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
	
	function tosinglegoods(gname){
		$.post("/shopping/goodsServlet",{
			op:'getgoods',
			gname:gname
				
		},function(data){
			location.href="single.jsp";
		})
	}
	

	function getSexGoods(tname) {

		$.post("/shopping/goodsServlet", {
			op : 'getSexGoods',
			tname : tname
		}, function(data) {
			location.href = "men.jsp";
		});
	}
	
	function changePage(num){
		var page = parseInt($(".mypage").html());
		var pages = parseInt($(".mypages").html());
		
		if( page+num <= 0 || page+num >pages){
			return;
		}
		$.post("/shopping/goodsServlet",{
			op:'changePage',
			page:page+num
			
		},function(data){
			location.reload();
		});
		
	}
	
	function addCar(uid,gno){
		var uid = $(".myuid").html();
		
		if(uid == null || uid== ""){
	      alert("请先登陆...");
	      location.href="login.jsp";	    				    	
		}else{
			
		var count =	$("#count"+gno+"").val();
		
		var price = $(".item_price").html();
		var sel = document.getElementsByName("size")[0];
		var size = sel.options[sel.options.selectedIndex].value;
		var uname = $(".name").html();
		console.log(size);
		console.log(count);
		$.post("/shopping/carServlet",{
			op:'addCar',
			count:count,
			price:price,
			size:size,
			uid:uid,
			uname:uname,
			gno:gno
		},function(data){
			if(data > 0){
				alert("添加成功！");
				location.reload();
			}
		});
		} 
	}
	
	
</script>
</body>
</html>		