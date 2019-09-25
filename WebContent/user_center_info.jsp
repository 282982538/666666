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

	<div class="main_con clearfix">
		<div class="left_menu_con clearfix">
			<h3>用户中心</h3>
			<ul>
				<li><a href="user_center_info.jsp" class="active">· 个人信息</a></li>
				<li><a onclick="toorder('${user.uid}')">· 全部订单</a></li>
				<li><a href="user_center_site.jsp">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<div class="info_con clearfix">
				<h3 class="common_title2">基本信息</h3>
						<ul class="user_info_list">
							<li><span>用户名：</span>${user.rname}</li>
							<li><span>联系方式：</span>${user.email}</li>
							<li><span>联系地址：</span>${user.address}</li>			
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
		<p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
		<p>电话：010-****888    京ICP备*******8号</p>
	</div>
<script>
	function toorder(uid){
		$.post("/shopping/orderServlet",{
			op:'getorderbyuid',
			uid:uid
		},function(data){
			location.href="user_center_order.jsp";
		});
	}
</script>
</body>
</html>