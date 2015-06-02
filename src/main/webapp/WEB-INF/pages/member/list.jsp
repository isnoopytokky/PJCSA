<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
<%
	int i = 1;
%>
<c:forEach items="${members}" var="member">
	<tr class="row<%=i%>">
		<td><input type="checkbox" name="no"></td>
		
		<td><span class="no"><%=i++%></span><input name="id" id="id"
			type="text" value="${member.id }" class="hide"></td>
			
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
			
		<td><input name="districtId" type="hidden" id="districtId"
			value="${member.districts.districtId }"> 
			<input name="amphurId" type="hidden" id="amphurId" value="${member.districts.amphures.amphurId }"> 
			<input name="provinceId" type="hidden" id="provinceId" value="${member.districts.amphures.provinces.provinceId }">
			<div id="districtDropdown">
				<c:import var="web" url="/address/DropDown">
					<c:param name="districtId" value="${member.districts.districtId }"></c:param>
					<c:param name="amphurId"
						value="${member.districts.amphures.amphurId }"></c:param>
					<c:param name="provinceId"
						value="${member.districts.amphures.provinces.provinceId}"></c:param>
					<c:param name="disabled" value="disabled"></c:param>
				</c:import>
				${web }
			</div>
		</td>
			
		<td><input type="submit" name="action" value="Edit" id="edit" />
			<br> <input type="submit" name="action" value="Cancel"
			id="cancel" class="hide" /> <br> <input type="submit"
			name="action" value="Delete" id="delete" /> <input type="submit"
			name="action" value="Add" id="add" class="hide" /></td>
	</tr>
</c:forEach>

<script>
	$("button").addClass("btn btn-default");
	$("input[type=submit]").addClass("btn btn-default");
</script>
