<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��� ��ȸ</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<meta charset="EUC-KR">

</head>
<body>
	<h1>Hello world!!!!!!!</h1>
	<table border="1" cellspacing = "0" cellpadding = "10px">
		<thead>
			<tr>
				<td class="ct_list_b" width="100">number</td>
				
				<td class="ct_list_b" width="100">������</td>
				
				<th class="ct_list_b" width="100">������ �̸�</th>
				
				<th class="ct_list_b" width="150">��������</th>
				
				<th class="ct_list_b" width="150">�������۽ð�</th>
				
				<th class="ct_list_b" width="150">��������ð�</th>
				
				<th class="ct_list_b" width="150">�������</th>
				
				<th class="ct_list_b" width="150">�����</th>
				
				<th class="ct_list_b" width="150">�����ڵ�</th>
				
				<c:if test="${param.menu eq 'student'}">
				    <th class="ct_list_b" width="150">proposal</th>
				</c:if>
			</tr>
		</thead>
		
		<tbody>
			<c:set var="i" value="0"/>			
			<c:forEach var="lesson" items="${list}">			
				<c:set var="i" value="${i+1}" />
				<tr class="ct_list_pop">
					<td align="center">${i}</td>
					
					<td align="left">${lesson.lessonName}</td>
					
					<td align="left">${lesson.teacherName.getUserName()}</td>
					
					<td align="left">${lesson.lessonDay}</td>
					
					<td align="left">${lesson.lessonStartTime}</td>
					
					<td align="left">${lesson.lessonEndTime}</td>
					
					<td align="left">${lesson.lessonPlace}</td>
					
					<td align="left">${lesson.subject}</td>
					
					<td align="left">${lesson.lessonCode}</td>
					
					<c:if test="${param.menu eq 'student'}">
				    	<td class="left">hello</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</html>