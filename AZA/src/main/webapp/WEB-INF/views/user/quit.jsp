<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form>
	<div class="text-center">
		<h1 class="display-5 mb-0">���� Ż���Ͻðڽ��ϱ�?</h1>
		<div class="subheading-1 mb-5">���̵�/��й�ȣ�� �Է����ּ���</div>
	</div>

	<div class="mb-4">
		���̵� : <input type="text" name="userId" id="userId" value="${userId}"></input>

	</div>
	<div class="mb-4">

		��й�ȣ : <input type="password" name="password" id="password" value="${password}"></input>

	</div>
	<div class="mb-1">
		<div class="btn-group" role="group">
			<button class="btn btn-text-primary" type="button" onclick='deleteUser()'>Ż��</button>
			<button class="btn btn-text-primary" type="button">���</button>
		</div>
	</div>
	</form>
	
		<div>
			<c:if test="${msg == false}">
				��й�ȣ�� ���� �ʽ��ϴ�.
			</c:if>
		</div>

	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">


function deleteUser() {
	
		if($("#password").val()==""){
			alert("��й�ȣ�� �Է����ּ���.");
			$("#password").focus();
			return false;
		}	

	$("form").attr("method" , "POST").attr("action" , "/login").submit();
};

// �����ϰ� ������
function updatePassword(){
	if(document.findform.password.value==""){
		alert("��й�ȣ�� �Է����ּ���.");
		document.findform.password.focus();
	} else if(document.findform.password.value != document.findform.confirmpwd.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		document.findform.confirmpwd.focus();
	} else {
		document.findform.action="update_password";
		document.findform.submit();
		 alert("��й�ȣ�� ����Ǿ����ϴ�. �α��� ȭ������ �̵��մϴ�.");
		 self.close();
		 self.location = "http://127.0.0.1:8080/"
	}
	
}

$( function() {
	$("button:contains('���')").on("click" , function() {
		history.go(-1);
	});
});


</script>
</body>
</html>