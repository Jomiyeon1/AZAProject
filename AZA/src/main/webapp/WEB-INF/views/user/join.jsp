<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	 <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet" />
        <!-- Roboto and Roboto Mono fonts from Google Fonts-->
     <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet" />
     <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet" />
        <!-- Load main stylesheet-->
     <link href="/resources//css/template.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        .id_ok{color:#6A82FB; display: none;}
        .id_already{color:red; display: none;}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
			
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/login">ȸ������</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">

	
	<select name = "role" id = "role">
		<option value ="teacher"> ������ </option>
		<option value ="student"> �л� </option>
		<option value ="parents"> �кθ� </option>
      </select>
		  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="���̵� �Է��ϼ���" oninput="checkDuplication()" />
		      <span class="id_ok">��� ������ ���̵��Դϴ�.</span>
		      <span class="id_already">������� ���̵� �Դϴ�.</span>
		    </div>
		  </div>		  
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="�̸�">
		    </div>
		  </div>

								<div class="form-group">
									<label for="phone">�޴���ȭ ('-' ���� ��ȣ�� �Է����ּ���) </label>
								</div>
		
								<div class="form-row">
									<div class="form-group col-md-8">
										<input type="text" class="form-control" id="phone" name="phone" placeholder="ex)01012345678" required>
										<div id="phoneCheck"></div>
									</div>
		
									<div class="form-group col-md-4">
										<button type="button" class="genric-btn danger radius" onclick="cert();">������ȣ �ޱ�</button>
									</div>
		
								</div>
								
								<div class="form-row">
									<div class="form-group col-md-8">
										<input type="text" class="form-control" id="certification"  placeholder="������ȣ�� �Է����ּ���" required>
										<div class="form-group" id="certCheck"></div>	
									</div>
		
									<div class="form-group col-md-4">
										<button type="button" class="genric-btn danger radius" id="sms_AuthBtn" onclick="smsAuthBtn();">Ȯ��</button>
									</div>
				
								
								</div>	
																
								<input type="hidden" id="randomVal" value=""/>	                 
                            
                            
         <div class = "student" style = "display:none;" id="student">
		    <label for="birth" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="birth" name="birth" placeholder="���ڸ� 8�ڸ�">
		    	<span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">ex) 20001010 </strong>
		      </span>
		    </div>
		  </div>
          
                            
         <div class = "student" style = "display:none;">
		    <label for="school" class="col-sm-offset-1 col-sm-3 control-label">�б�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="school" name="school" placeholder="�б� �̸�">
		    </div>
		  </div>
         
         <div class = "student" style = "display:none;">
		    <label for="grade" class="col-sm-offset-1 col-sm-3 control-label">�г�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="grade" name="grade" placeholder="���ڸ� �Է��ϼ���">
		    </div>
		  </div>
         
         <div class = "student" style = "display:none;">
		    <label for="parentsPhone" class="col-sm-offset-1 col-sm-4 control-label">�θ�� �ڵ�����ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="parentsPhone" name="parentsPhone" placeholder="���ڸ� �Է��ϼ���">
		    </div>
		  </div>
         
         <div class="parents" style = "display:none;">
		    <label for="studentId" class="col-sm-offset-1 col-sm-3 control-label">�ڳ���̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="studentId" name="studentId" placeholder="�ڳ� ���̵�">
		    </div>
		  </div>

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
	

        
		//���̵� üũ
		const checkDuplication = _.debounce(async (id) => {
			//var userId = $('#userId').val(); // id���� userId�� �η¶��� �� ����
			var id = $("#userId").val();
			
			
			var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
      		  if (!isID.test(id)) {
					alert("5~20���� ���� �ҹ���, ���ڸ� ��� �����մϴ�.");
					return false;
      		  }			
      		  
			
			$.ajax({
				url:'/user/rest/checkDuplication',
				type:'post',
				data:{id},
				success:function(cnt){ //��Ʈ�ѷ����� �Ѿ�� cnt�� �ޱ�
					if(cnt == 0) { //0�̸� ��밡�� ���̵�
						$('.id_ok').css("display","inline-block");
						$('.id_already').css("display", "none");
						}else{
						$('.id_ok').css("display","none");
						$('.id_already').css("display", "inline-block");
					}
				},
				error:function(){
					alert("�����Դϴ�");
				}
			});
		},1000);
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		

		$(function(){
			$('#password2').blur(function(){
				if($('#password').val() != $('#password2').val()){
					if($('#password2').val() != ''){
						alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է����ּ���");
						$('#password2').val('');
						$('#password2').focus();
					}
				}
			})
		});
		
	
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			var phone=$("input[name='phone']").val();
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
			
			if(phone == null || phone.length <1){
				alert("�ڵ��� ������ �ʼ��Դϴ�.");
				return;
			}
				
			
			
			$("form").attr("method" , "POST").attr("action" , "/user/rest/addUser").submit();
		}
		
		
			$('#role').on('change', function(){
				if($(this).val()=='teacher'){
				$('.student').hide();
				$('.parents').hide();
				} else if ($(this).val()=='student'){
				$('.student').show();
				$('.parents').hide();
				}else{
				$('.student').hide();
				$('.parents').show();

				
				}
			});
	
		
		
		
	   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	   //==> �ֹι�ȣ ��ȿ�� check �� ����������....
		function checkSsn() {
			var ssn1, ssn2; 
			var nByear, nTyear; 
			var today; 
	
			ssn = document.detailForm.ssn.value;
			// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
			if(!PortalJuminCheck(ssn)) {
				alert("�߸��� �ֹι�ȣ�Դϴ�.");
				return false;
			}
		}
	
		function PortalJuminCheck(fieldValue){
		    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
			var num = fieldValue;
		    if (!pattern.test(num)) return false; 
		    num = RegExp.$1 + RegExp.$2;
	
			var sum = 0;
			var last = num.charCodeAt(12) - 0x30;
			var bases = "23456789";
			for (var i=0; i<8; i++) {
				if (isNaN(num.substring(i,i+1))) return false;
				sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
			}
			var mod = sum % 11;
			return ((11 - mod) % 10 == last) ? true : false;
		}
	

		
		

	</script>
	
	<!--�޴��� ���� / SMS SENS API -->
<script type="text/javascript">
	function cert() {
		 var random = Math.floor(Math.random() * 1000000)+"";
		 var phone = $("#phone").val();	
		 alert("phone"+phone);
		 $('#randomVal').val(random);
			var obj = {
					"type" : "SMS",
					"contentType" : "COMM",
					"from" : "01032030796",
					"subject" : "�������� �����Դϴ�",
					"countryCode" : "82",
					"content" : random,
					"message" : [ {
						"to" : phone,
						"subject" : "���� ����",
						"content" : "������ȣ [" + random +"]�� �Է����ּ���."
					} ]
				};
			
			$.ajax({
				type : 'POST',
				url :'/user/rest/sendSMS/' + phone,
				dataType : "json",
				data :  JSON.stringify(obj),				
				contentType: "application/json",
				success : function(data) {
					if(data.statusName == "success"){
						$('#certCheck').text("���� ��ȣ�� ���۵Ǿ����ϴ�.");
						$('#certCheck').css('color','blue');
						$("#signup_btn").attr("disabled",true);
					}else {
						$('#certCheck').text("�Է��� ��ȣ�� �ٽ� Ȯ�����ּ���.");
						$('#certCheck').css('color','red');
						$("#signup_btn").attr("disabled",true);
					}
				}
			});
	}
	
	function smsAuthBtn() {
		
		var userVal = $('#certification').val();
		var certVal = $('#randomVal').val();
	
			if(userVal == certVal){
				$('#certCheck').text("������ �Ϸ�Ǿ����ϴ�.");
				$('#certCheck').css('color','blue');	
				$("#signup_btn").attr("disabled",false);
			}else{
				$('#certCheck').text("������ȣ�� �ٽ� Ȯ�����ּ���");
				$('#certCheck').css('color','red');
				$("#signup_btn").attr("disabled",true);
			}
		
	};
	
</script>
	
</body>

</html>



