<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AZA : LOGIN</title>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript">
		
		//============= ȸ�������� ȭ���̵� =============
		$( function() {
			
			$("button.btn.btn-primary").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		

		
	</script>
	
</head>
<body>
	<h1>�α���</h1>
	<form action="/user/login">
	���̵� : <input type="text" name="userId"  id="userId"></input>
	��й�ȣ : <input type="text" name="password"  id="password"></input>
	
	<button type="submit">�α���</button>
	<button type="button" class="btn btn-primary">ȸ������</button>
	</form>
</body>
</html>