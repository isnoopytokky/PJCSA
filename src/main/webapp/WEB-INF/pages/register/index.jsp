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

<body>
	
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
			<li style="font-size: 18px;"><a href="#" data-toggle="modal"
				data-target="#log"><i class="glyphicon glyphicon-log-in"></i>
					เข้าสู่ระบบ</a></li>

		</ul>
	</div>
</div>
</nav> </header>
 
		
		<h1><center>สมัครสมาชิก</center></h1>
		<hr>
	 <div class="row demo-row">
        <div class="col-xs-3"></div>
          <div class="col-xs-6">
	<form action="register.jsp" method="post">
  <div class="container">
		<form class="form-horizontal" role="form">
			
			<div class="form-group">
		<br>	<label class="control-label col-sm-2" for="user">ชื่อผู้ใช้</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="user" id="user" value="" placeholder="ชื่อผู้ใช้" required>
				</div>
			</div>
			
			<div class="form-group">
		<br>	<label class="control-label col-sm-2" for="pass1">รหัสผ่าน</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="pass1" id="pass1" value="" placeholder="รหัสผ่าน" required>
				</div>
			</div>
			
			<div class="form-group">
		<br>	<label class="control-label col-sm-2" for="pass2">ยืนยันรหัสผ่าน</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" name="pass2" id="pass2" value="" placeholder="ยืนยันรหัสผ่าน" required>
				</div>
			</div>
			
			<div class="form-group">
		<br>	<label class="control-label col-sm-2" for="email">อีเมลล์</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="email" id="email" value="" placeholder="อีเมล์" required>
				</div>
			</div>
			
			<div class="form-group">
		<br>	<label class="control-label col-sm-2" for="name">ชื่อ</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="name" id="name" value="" placeholder="ชื่อ" required>
				</div>
			</div>
			
			<div class="form-group">
		<br>	<label class="control-label col-sm-2" for="sername">นามสกุล</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="sername" id="sername" value="" placeholder="นามสกุล" required>
				</div>
			</div>
			
			<div class="form-group">
		<br>	<label class="control-label col-sm-2" for="address">ที่อยู่</label>
				<div class="col-sm-5">
					<textarea type="text" class="form-control" name="address" id="address" value="" placeholder="ที่อยู่" required></textarea>
				</div>
			</div>
			
			
			<div class="form-group">
		<br><br>	<label class="control-label col-sm-2" for="farm">ชื่อฟาร์ม</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="farm" id="farm" value="" placeholder="ชื่อฟาร์ม" class="form-control" rows="5" required>
				</div>
			</div>
			
			<div class="form-group">
		<br>	<label class="control-label col-sm-2" for="tel">เบอร์โทร</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="tel" id="tel" value="" placeholder="เบอร์โทร" required>
				</div>
			</div>
			<br>
			<div class="form-group">
				<br><div class="col-sm-offset-2 col-sm-10">
			<input type="submit" name="submit" id="submit" value="สมัคร" class="btn btn-info">
            </div></div> 
	
		</form>
	</div>
		
	</form>
	</div>
	</div>
	
<br><br><br>
	<footer class="footer">
	<div class="container">
		<p>
			<font color="white">© 2014-2015</font>
		</p>
		<p class="text-muted">
		
		</p>
	</div>
	</footer>
	
 <script src="js/jquery-2.1.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>