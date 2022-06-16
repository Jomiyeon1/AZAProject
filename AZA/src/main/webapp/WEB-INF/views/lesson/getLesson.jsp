<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<title>���� �� ��ȸ</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
		$(function(){
			$("td.ct_btn01:contains('����')").on("click",function(){
				self.location="/lesson/updateLessonView?lessonCode=${lesson.lessonCode}"
			});
		});
</script>

</head>
<body>
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="93%" class="ct_ttl01">���� �� ��ȸ</td>
				<td width="20%" align="right">&nbsp;</td>
			</tr>
		</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���Ǹ� </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${lesson.lessonName}
					</td>
					<td>	</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">����������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonDay}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">���� ���۽ð�/����ð�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonStartTime} / ${lesson.lessonEndTime}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���� ���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonPlace}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���� ������ </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonCreateAt}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.subject}</td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�����ڵ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonCode}</td>
	</tr>
	
<%-- 		<tr>
		<td width="104" class="ct_write">������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.fees}</td>
	</tr> --%>
	
		<tr>
		<td width="104" class="ct_write">������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.fees}</td>
	</tr>
	
		<tr>
		<td width="104" class="ct_write">Ŀ��ŧ��</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${lesson.lessonContent}</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<c:choose>
						<c:when test="${user.role eq 'teacher'}">
							<tr>
								<td class="ct_btn01">���� &nbsp;&nbsp;</td>
								<td>����</td>
							</tr>	
						</c:when>					
						<c:otherwise>
							����						
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>