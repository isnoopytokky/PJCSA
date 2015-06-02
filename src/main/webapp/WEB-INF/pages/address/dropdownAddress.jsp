<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/includes.jsp"%>
จังหวัด 
<select id="${provincesId }" ${disabled }>
	<option>เลือกจังหวัด</option>
	<c:forEach items="${provincesList}" var="province">
		<option value="${province.provinceId }" <c:if test="${provinceId == province.provinceId  }">selected</c:if>>${province.provinceName }</option>
	</c:forEach>
</select>
<br>อำเภอ 
<select id="${amphuresId }" ${disabled}>
<option>เลือกอำเภอ</option>
	<c:forEach items="${amphuresList}" var="amphure">
		<option value="${amphure.amphurId }"
			<c:if test="${amphurId == amphure.amphurId  }">selected</c:if>>${amphure.amphurName }</option>
	</c:forEach>
</select>
<br>
ตำบล 
<select id="${districtsId }" ${disabled }>
<option>เลือกตำบล</option>
	<c:forEach items="${districtsList}" var="district">
		<option value="${district.districtId }" <c:if test="${districtId == district.districtId  }">selected</c:if>>${district.districtName }</option>
	</c:forEach>
</select>
