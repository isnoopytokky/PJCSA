<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%@ include file="/WEB-INF/pages/external.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring Demo</title>

</head>
<body>
	<div class="container-fluid" style="margin-top: 50px;">
		<div class="row">
			<div class="col-md-2">
				<div class="panel panel-default">
					<div class="panel-heading">Menu</div>
					<ul class="list-group">
						<a href="geography" class="list-group-item">geography</a>
						<a href="provinces" class="list-group-item">provinces</a>
						<a href="zipcodes" class="list-group-item">zipcodes</a>
						<a href="amphures" class="list-group-item">amphures</a>
						<a href="districts" class="list-group-item">districts</a>
					</ul>
				</div>
			</div>
			<div class="col-md-10">
				<h1 class="text-center">Member Page</h1>
				<div class="container-fluid">
					<div class="row">

						<div class="panel panel-default table-responsive">
							<div class="panel-heading">Manage Member</div>
							<div class="panel-body ">
								<form:form action="member/create" method="POST" id="members"
									modelAttribute="members" commandName="member">
									<table class="table table-bordered">
										<thead>
											<tr>
												<td><input type="checkbox" name="noAll"></td>
												<td>No.</td>
												<td>user</td>
												<td>pass</td>
												<td>name</td>
												<td>created</td>
												<td>address</td>
												<td>district</td>
												<td colspan="3">Manage</td>
											</tr>

											<tr>
												<td></td>
												<td></td>
												<td><input type="text" id="Suser"></td>
												<td><input type="text" id="Spass"></td>
												<td><input type="text" id="Sname"></td>
												<td><input type="text" id="Screated"></td>
												<td><input type="text" id="Saddress"></td>
												<td><c:import var="web" url="/address/DropDown"></c:import>${web }</td>
												<td colspan="3">Manage</td>
											</tr>

										</thead>
										<tbody id="contents">
											<%
												int i = 1;
											%>
											<c:forEach items="${members}" var="member">
												<tr class="row<%=i%>">
													<td><input type="checkbox" name="no"></td>
													<td><span class="no"><%=i++%></span><input name="id"
														id="id" type="text" value="${member.id }" class="hide"></td>
													<td><input name="user" type="text" id="user"
														value="${member.user }" readonly></td>
													<td><input name="pass" type="text" id="pass"
														value="${member.pass }" readonly></td>
													<td><input name="name" type="text" id="name"
														value="${member.name }" readonly></td>
													<td><input name="created" type="text" id="created"
														value="${member.created }" readonly></td>
													<td><input name="address" type="text" id="address"
														value="${member.address }" readonly></td>
													<td><input name="districtId" type="hidden"
														id="districtId" value="${member.districts.districtId }">
														<input name="amphurId" type="hidden" id="amphurId"
														value="${member.districts.amphures.amphurId }"> <input
														name="provinceId" type="hidden" id="provinceId"
														value="${member.districts.amphures.provinces.provinceId }">
														<div id="districtDropdown">
															<c:import var="web" url="/address/DropDown">
																<c:param name="districtId"
																	value="${member.districts.districtId }"></c:param>
																<c:param name="amphurId"
																	value="${member.districts.amphures.amphurId }"></c:param>
																<c:param name="provinceId"
																	value="${member.districts.amphures.provinces.provinceId}"></c:param>
																<c:param name="disabled" value="disabled"></c:param>
															</c:import>
															${web }
														</div></td>
													<td><input type="submit" name="action" value="Edit"
														id="edit" /> <br> <input type="submit" name="action"
														value="Cancel" id="cancel" class="hide" /> <br> <input
														type="submit" name="action" value="Delete" id="delete" />
														<input type="submit" name="action" value="Add" id="add"
														class="hide" /></td>
												</tr>
											</c:forEach>
									</tbody>
									<tbody id="newcell">
									
									</tbody>
									<tbody>
											<tr id="row1" class="hide">
												<td></td>
												<td><span class="no"></span></td>
												<td><input type="text" id="user" name="members[0].user" /></td>
												<td><input type="text" id="pass" name="members[0].pass" /></td>
												<td><input type="text" id="name" name="members[0].name" /></td>
												<td></td>
												<td><input type="text" id="address"
													name="members[0].address" /></td>

												<td><form:select path="districts.amphures.provinces"
														id="provinces" items="${provincesList }" /><br> <select
													id="amphures" name="members[0].districts.amphures"></select><br>
													<select id="districts"
													name="members[0].districts.districtId"></select></td>
												<td><input type="submit" name="action" value="Edit"
													id="edit" class="hide" /> <br> <input type="submit"
													name="action" value="Cancel" id="cancel" class="hide" /> <br>
													<input type="submit" name="action" value="Delete"
													id="delete" class="hide" /> <input type="submit"
													name="action" value="Add" id="add" /></td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" id="tr_id" value="<%=i%>">
									<button id="p10">+10</button>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	var tr_id = $("#tr_id").val();
</script>
<script src="<c:url value="/resources/js/indexExcel.js" />"></script>
</html>