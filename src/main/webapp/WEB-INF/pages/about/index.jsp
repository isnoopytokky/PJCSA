<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%@ include file="/WEB-INF/pages/external.jsp"%> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ระบบออกใบสูจิบัตรโคประกวดโคประมูล</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel='stylesheet' type='text/css' />
<link href="<c:url value="/resources/bootflat/css/bootflat.css"/>"
	rel='stylesheet' type='text/css' />
<link href="<c:url value="/resources/bootflat/css/homestyle.css"/>"
	rel='stylesheet' type='text/css' />
<!-- Bootstrap -->

</head>

<header class="header"> <nav
	class="navbar navbar-default navbar-fixed-top">
<div class="container-fluid">
	<div class="navbar-header">
		<a class="navbar-brand" href="#"><img
			src="<c:url value=  "resources/bootflat/img/b1.png"/> "
			height="40"></a>
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#myNavbar">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
	</div>
	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="nav navbar-nav">
		
			<li class="active"><a href="index">หน้าแรก</a></li>
			<li><a href="report">รายงานผล</a></li>
            <li><a href="news">ข่าวประกาศ</a></li>
            <li><a href="about">เกี่ยวกับเรา</a></li>
           
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li style="font-size: 18px;"><a href="register"><i class="glyphicon glyphicon-user"></i>
					สมัครสมาชิก</a></li>
			<li style="font-size: 18px;"><a href="login"><i class="glyphicon glyphicon-log-in"></i>
					เข้าสู่ระบบ</a></li>

		</ul>
	</div>
</div>
</nav> </header>
<body>
	<div class="section-bg">
		<div class="container">
			<img class="icon"
				src="<c:url value=  "resources/bootflat/img/b2.png"/> "
				height="100"> <br>
			<div>
				<h3 class="homepage-title">ระบบการจัดการฟาร์ม :
					ระบบออกใบสูจิบัตรโคประกวดโคประมูล</h3>
			</div>
			<div>
				<h3 class="homepage-subtitle">Farm Management System : Certificate of Cattle Shows and Auction System Phase 2</h3>
			</div>
		</div>
		<br> <br> <br> <br>
	</div>


	<div class="container">
		<!-- modal -->
		<div id="log" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"></button>
						<h3 class="modal-title">Login</h3>
					</div>
					<div class="modal-body">
						<div class="row form-group">
							<div class="col-md-offset-2 col-md-2">
								<h4>Username:</h4>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-offset-2 col-md-2">
								<h4>Password:</h4>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control">
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<!-- modal -->
	</div>

	<footer class="footer" role="cententinof">
	<div class="contrainer">
		<p style="color: white;">Copyright © 2014 - 2015</p>
		
	</div>
	</footer>
	<script src="<c:url value="/resources/js/jquery-2.1.3.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</body>
</html>