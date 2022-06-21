<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>����������</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<!-- Load Material Icons from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet" />
<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet" />
    <link href="/resources/css/styles.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/message.css"/>
<style>

</style>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript">
		
	// �����߰� �����ϱ�
		//============= ȸ���������� Event  ó�� =============	
		 $(function(){
			 $( "button.btn.btn-primary" ).on("click" , function() {
				self.location="/user/updateUser?userId=${user.userId}"
			});
		});	
	
	//�л� ���̵� ��ȿ�� �˻�
			const checkStudent = _.debounce(async (id) => {
		    	
		    	var id = $("#firstStudentId").val();
		    	
		    	$.ajax({
		    		url:'/user/rest/checkStudent',
		    		type : "post",
		    		data:{id},
		    		success : function(cnt) {
		    			if(cnt == 1) {
		    				$('#certCheck2').text("Ȯ���� �Ϸ�Ǿ����ϴ�.");
		    				$('#certCheck2').css('color','blue');	
		    				
		    			}
		    			else {
		    				$('#certCheck2').text("Ȯ�ε��� ���� �����Դϴ�.");
		    				$('#certCheck2').css('color','red');
		    				
		    			}
		    		}
		    	});
		    },2000);
			
		// �ڳ� �߰� �̺�Ʈ
		$(function(){
			$("input[name=addStudentBtn]").click(function(){
				if ($(this).val()=="�ڳ��߰�"){
					$("#addStudentInput").show();
				}
		});
		
	});
		

		
			function addStudent(){
				document.findform.action="addRelation";
				document.findform.submit();
				
			}
	

	</script>
	

</head>
<body>
<!-- ---------- �������� ���� -------------->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">ȸ��������ȸ</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� �� ��</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${user.userName}</div>
		</div>
		
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��й�ȣ</strong></div>
			<div class="col-xs-8 col-md-4"></div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�޴���ȭ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${ !empty user.phone ? user.phone : ''}	</div>
		</div>
		
		<hr/>
		
		<c:if test="${user.role eq 'student'}">
			
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�б�</strong></div>
			<div class="col-xs-8 col-md-4">${user.school}</div>
		</div>
		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�г�</strong></div>
			<div class="col-xs-8 col-md-4">${user.grade}</div>
		</div>
		
		</c:if>
		
		
		<c:if test="${user.role eq 'parent'}">
			
	<input type="hidden" name="relationCode" value="${user.relationCode}">
	<input type="hidden" name="firstStudentId" value="${user.firstStudentId}">
			
			<select id="relationCode" name="relationCode" >

				<c:forEach var="user" items="${list}">
  
						<option align="center" value="${user.relationCode}">${user.firstStudentId}
	
				 </c:forEach>
			</select>
			

			<input type="button" name="addStudentBtn" class="btn btn-primary" value="�ڳ��߰�" onclick='addStudentBtn()' />
			
			
			<div></div>
							
			<div id="addStudentInput" style="display :none">
			<input type="hidden" id="userId" name="addRelation" value="${addRelation}">
			
			<input type="text" id="firstStudentId" name="firstStudentId" placeholder="�ڳ� ���̵�" oninput="checkStudent()" />
			<div class="form-group" id="certCheck2"></div>
			<input type="text" id="relationName" name="relationName" placeholder="�л����� ����" />
			<input type="submit" value="���" onclick="addStudent();"/>
			<input type="button" value="���" onclick="deleteInput();"/>
			</div>
			

			<hr/>
			
			<c:forEach var="studentsInfo" items="${studentsInfo}">
  
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ڳ� �̸�</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.userName}</div>
		</div>
			
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ڳ� �б�</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.school}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ڳ� �г�</strong></div>
			<div class="col-xs-8 col-md-4">${studentsInfo.grade}</div>
		</div>
	</c:forEach>
	<c:forEach var="user" items="${list}">
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�л����� ����</strong></div>
			<div class="col-xs-8 col-md-4">${user.relationName}</div>
		</div>
		</hr>
		
		 </c:forEach>
		</c:if>
		

		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">ȸ����������</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>        
</body>
</html>