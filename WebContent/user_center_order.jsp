<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-用户中心</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
	 
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
	

		<div class="col-xs-2 logo">
					<h1><a href="index.jsp"><span>我的</span>小店</a></h1>
				</div>		

	<span  style="display:none" class="myuid">${user.uid}</span>
		
		
		

	<div class="main_con clearfix">
		<div class="left_menu_con clearfix">
			<h3>用户中心</h3>
			<ul>
				<li><a href="user_center_info.jsp">· 个人信息</a></li>
				<li><a href="user_center_order.jsp" class="active">· 全部订单</a></li>
				<li><a href="user_center_site.jsp">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">全部订单</h3>
				
				<c:forEach var="order" items="${order1}" varStatus="status">
				<ul class="order_list_th w978 clearfix">
					<li class="col01"></li>
					
					<li class="col02 stress">
					<c:if test="${order.cis==1}">
						未支付
					</c:if>
					<c:if test="${order.cis==2}">
						已支付
					</c:if>
					</li>		
				</ul>

				<table class="order_list_table w980">
					<tbody>
						<tr>
							<td width="55%">
							${order.time}
							</td>
							<td width="15%">订单号：${order.oid}</td>
							<td width="15%">
							<c:if test="${order.cis==1}">
								待付款
							</c:if>
							<c:if test="${order.cis==2}">
								已付款
							</c:if>
							</td>
							
							<c:if test="${order.cis==1}">
							<td width="15%"><a class="oper_btn" onclick="toorder('${order.oid}')">
								去付款
							</c:if>
							<c:if test="${order.cis==2}">
							<td width="15%"><a href="#" class="oper_btn">
								已支付
							</c:if>
							</a></td>
						</tr>
					</tbody>
				</table>
				</c:forEach>
				
				
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
		</div>
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
<script>
	function toorder(oid){
		console.log(oid);
		$.post("/shopping/orderServlet",{
			op:'getorder',
			oid:oid
		},function(data){
			location.href="place_order.jsp";
		})
	}
	
	function changePage(num){
		var page = parseInt($(".mypage").html());
		var pages = parseInt($(".mypages").html());
		var uid = $(".myuid").html();
		if( page+num <= 0 || page+num >pages){
			return;
		}
		$.post("/shopping/orderServlet",{
			op:'changePage',
			page:page+num,
			uid:uid
		},function(data){
			location.reload();
		});
		
	}
</script>
</body>
</html>