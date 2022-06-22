<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
<head>
<!-- Load Favicon-->
        <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet" />
<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet" />
<!-- Load main stylesheet-->
<link href="/resources/css/template.css" rel="stylesheet" />


<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">



<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta charset="EUC-KR">
<title>AZA : LOGIN</title>
<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->

<!--  �̰� �����ϱ� ���� �Ķ������� ���´� �Ѥ� -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
 -->




<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//============= ȸ�������� ȭ���̵� =============

	$( function() {
		$("button:contains('ȸ������')").on("click" , function() {
			self.location = "/user/addUser"
		});
	});
	
	$( function() {
		$("button:contains('���̵� ã��')").on("click" , function() {
			self.location = "/user/findId"
		});
	});
	
	$( function() {
		$("button:contains('��й�ȣ �缳��')").on("click" , function() {
			self.location = "/user/findPassword"
		});
	});
	


</script>

</head>
<body class="bg-primary">

	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">

			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xxl-4 col-xl-5 col-lg-6 col-md-8">
							<div class="card card-raised shadow-10 mt-5 mt-xl-10 mb-4">
								<div class="card-body p-5">
									<!-- Auth header with logo image-->
									<div class="text-center">


										<h1 class="display-5 mb-0">Login</h1>
										<div class="subheading-1 mb-5">AZA�� ���Ű� ȯ���մϴ�!</div>
									</div>
									<form name = "loginForm" >
										<div class="mb-4">
											<mwc-textfield class="w-100" label="userId" outlined>
											���̵� : <input type="text" name="userId" id="userId"></input> </mwc-textfield>

										</div>
										<div class="mb-4">
											<mwc-textfield class="w-100" label="Password" outlined
												icontrailing="visibility_off" type="password">
											��й�ȣ : <input type="password" name="password" id="password"></input>

											</mwc-textfield>
										</div>
									
										<mwc-tab-bar class="nav nav-tabs" role="tablist">
                                </mwc-tab-bar>
										
										 <div class="mb-2">
                                                <div class="btn-group" role="group">
                                                    <button class="btn btn-outline-primary" type="button" onclick="login()">�α���</button>
                                                    <c:if test="${msg=='nope'}">
                                                    <div style="color: red">
                                                    ���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.
                                                    </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                            
										 <div class="mb-1">
                                                <div class="btn-group" role="group">
                                           			<button class="btn btn-text-primary" type="button">���̵� ã��</button>
                                                    <button class="btn btn-text-primary" type="button">��й�ȣ �缳��</button>
                                                    <button class="btn btn-text-primary" type="button">ȸ������</button>
                                                </div>
                                            </div>
                                           

									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
<!-- <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script> -->
	<!-- Load global scripts-->
<!--	<script type="module" src="/resources/common/material.js"></script>
	<script src="/resources/common/scripts.js"></script>
	
	 -->	
	 
	 <script type="text/javascript">
	 
function login()	{
	
	var loginForm = document.loginForm;
	var userId = loginForm.userId.value;
	var password = loginForm.password.value;
	
	
	if(!userId || !password ){
		alert ("���̵�� ��й�ȣ�� ��� �Է����ּ���.");
	}else{
		$("form").attr("method" , "POST").attr("action" , "/user/login").submit();
	}
}

	 
	 </script>
</body>
</html>