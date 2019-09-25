<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>购物屋</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
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
			    		欢迎您: <a class="name" href="user_center_info.jsp">${user.uname}</a>
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

	
	
	<h3 class="common_title">确认收货地址</h3>

	<div class="common_list_con clearfix">
		<dl>
			<dt>寄送到：</dt>
			<dd><input type="radio" name="" checked="">${user.address} （${user.rname} 收） ${user.email}</dd>
		</dl>
		<a href="user_center_site.jsp" class="edit_site">编辑收货地址</a>

	</div>
	
	<h3 class="common_title">支付方式</h3>	
	<div class="common_list_con clearfix">
		<div class="pay_style_con clearfix">
			<input type="radio" name="pay_style" checked>
			<label class="cash">货到付款</label>
			<input type="radio" name="pay_style">
			<label class="weixin">微信支付</label>
			<input type="radio" name="pay_style">
			<label class="zhifubao"></label>
			<input type="radio" name="pay_style">
			<label class="bank">银行卡支付</label>
		</div>
	</div>

	<h3 class="common_title">商品列表</h3>
	
	<div class="common_list_con clearfix">
		<ul class="goods_list_th clearfix">
			<li class="col01">商品名称</li>
			<li class="col02">尺寸大小</li>
			<li class="col03">商品价格</li>
			<li class="col04">数量</li>
			<li class="col05">小计</li>		
		</ul>
		<c:forEach var="c" items="${car}" varStatus="status">
		<ul class="goods_list_td clearfix">
			<li class="col01">${status.count}</li>			
			<li class="col02"><img src="${c.pics}"></li>
			<li class="col03">${c.gname}</li>
			<li class="col04">${c.size}</li>
			<li class="col05">${c.price}</li>
			<li class="col06">${c.num}</li>
			<li class="col07">${c.price*c.num}</li>	
		</ul>
		</c:forEach>
	</div>

	<h3 class="common_title">总金额结算</h3>

	<div class="common_list_con clearfix">
		<div class="settle_con">
			<div class="total_goods_count">共<em>${carsize}</em>件商品，总金额<b>${totalprice}元</b></div>
			<div class="transit">运费：<b>15元</b></div>
			<div class="total_pay">实付款：<b>${totalprice+15}元</b></div>
		</div>
	</div>

	<div class="order_submit clearfix">
		<a id="order_btn" onclick="clearCar('${orderoid}')">确认付款</a>
	</div>	

	<div class="footer">
		<div class="foot_link">
			<a href="#">关于我们</a>
			<span>|</span>
			<a href="#">联系我们</a>
			<span>|</span>
			<a href="#">招聘人才</a>
			<span>|</span>
			<a href="#">友情链接</a>		
		</div>
		
	</div>

	<div class="popup_con">
		<div class="popup">
			<p>订单提交成功！</p>
		</div>
		
		<div class="mask"></div>
	</div>
	<script type="text/javascript" src="js/jquery-1.12.2.js"></script>
	
	
	<script>
		function clearCar(oid){
			if( confirm("是否付款？")){
			
			console.log(oid);
			$.post("/shopping/orderServlet",{
				op:'clearorder',
				oid:oid
			},function(data){
				if(data > 0){
					alert("付款成功！");
					location.href="index.jsp";
				}
			});
			
			}
		}
	</script>
</body>
</html>