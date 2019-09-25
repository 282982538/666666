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
				<li><a href="user_center_info.jsp">· 个人信息</a></li>
				<li><a onclick="toorder('${user.uid}')">· 全部订单</a></li>
				<li><a href="user_center_site.jsp" class="active">· 收货地址</a></li>
			</ul>
		</div>
		<div class="right_content clearfix">
				<h3 class="common_title2">收货地址</h3>
				<div class="site_con">
					<dl>
						<dt>当前地址：</dt>
						<dd>${user.address} （${user.rname} 收） ${user.email}</dd>
					</dl>					
				</div>
				<h3 class="common_title2">编辑地址</h3>
				<div class="site_con">
					<form>
						<div class="form_group">
							<label>收件人：</label>
							<input type="text" value="${user.rname}" class="rname">
						</div>
						<div class="form_group form_group2">
							<label>详细地址：</label>
							<textarea type="text" class="site_area" value="${user.address}" id="myaddress"></textarea>
						</div>
						<div class="form_group">
							<label>邮编：</label>
							<input type="text" name="">
						</div>
						<div class="form_group">
							<label>手机：</label>
							<input type="text" value="${user.email}" class="email">
						</div>

						<input type="button" value="提交" class="info_submit" onclick="setaddress('${user.uid}')">
					</form>
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
	function setaddress(uid){
		var address = $("#myaddress").val();
		console.log(address);
		var rname = $(".rname").val();
		var email = $(".email").val();
		$.post("/shopping/userServlet",{
			op:'seraddress',
			address:address,
			rname:rname,
			email:email,
			uid:uid
		},function(data){
			if(data > 0){
				alert("设置成功！");
				location.href="user_center_info.jsp";
			}
		});
	}
	
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