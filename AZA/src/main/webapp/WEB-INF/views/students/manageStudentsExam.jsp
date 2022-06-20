<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ REST�̴�.</title>
<!--  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b209e29beb.js" crossorigin="anonymous"></script>
    <link href="/resources/css/message.css" rel="stylesheet">
    <!-- Load Favicon-->
    <link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <!-- Load Material Icons from Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet">
    <!-- Load Simple DataTables Stylesheet-->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet">
    <!-- Roboto and Roboto Mono fonts from Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet">
    <!-- Load main stylesheet-->
    <link href="/resources/css/styles.css" rel="stylesheet">
    
        
        
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/resources/css/message.css"/>
        
<!--  -->

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style>
	body {
    padding-top : 10px;
    margin : 100px;
    font-family: Pretendard, 'Noto Sans KR';
    }

</style>


<script>
$(function() {
	$( "button.btn.btn-raised-success.btn-sm.col-sm-1.mb-4:contains('���')" ).on("click" , function() {
		alert("��� click");
		addStudentsExam();
		
		$.ajax({
			url:"/studnents/rest/manageStudentsExam",
			method:"POST",
				headers: { 
					"Accept" : "application/json",
                	"Content-Type" : "application/json"
				},success : function(JSONData , status) {
					
				}
		})
	});
});

function addStudentsExam() {
	var examYear = $("input[name='examYear']").val();
	var examSemester = $("input[name='examSemester']").val();
	var examTerm = $("input[name='examTerm']").val();
	var examSubject = $("input[name='examSubject']").val();
	var examScore = $("input[name='examScore']").val();
	
	
/* 	alert("�⵵ => "+examYear);
	alert("�б� => "+examSemester);
	alert("�б� => "+examTerm);
	alert("���� => "+examSubject);
	alert("���� => "+examScore); */
	
	if(examYear == null || examYear.length < 1){
		
		alert("�⵵�� �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	if(examSemester == null || examSemester.length < 1){
		
		alert("�б�� �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	if(examTerm == null || examTerm.length < 1){
		
		alert("�б�� �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	if(examSubject == null || examSubject.length < 1){
		
		alert("������ �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	if(examScore == null || examScore.length < 1){
		
		alert("������ �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/students/addStudentsExam").submit();
}




$(function() {
		$('#exam').on('change', function() {
			alert("change");
	
 		var examCode = $('option:selected').attr("examCode"); 
			
/*  	
		var examScore = $('option:selected').val().trim();
		var examSubject = $('option:selected').text().trim();  
			alert("examScore => " + examScore); 
			alert("examSubject => " + examSubject);
			alert("examCode => " + examCode); */
			
			
			$.ajax(
					{url : "/students/rest/getStudentsExam/"+examCode ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						
					},success : function(JSONData , status) {
						alert("exam Code => "+JSONData.examCode);
						alert("examSubject => "+JSONData.examSubject);
						alert("examScore => "+JSONData.examScore);
						
					}						
					})
		})

})


</script>
  
</head>


<body>

<h1> Rest �Ⱦ�� :( </h1>

<input type="hidden" value="${user.userId }" name="studentId">

	<div class="border border-top-0 p-3 p-sm-5 bg-light">
	    <span class="text-nowrap p-3 border rounded bg-white" style="width: 10rem">I&nbsp;&nbsp;&nbsp;D : ${user.userId }</span>
	    <span class="text-nowrap p-3 border rounded bg-white" style="width: 10rem">�� �� : ${user.userName } &nbsp;</span>
	</div>

	
	<div class="border border-top-0 p-3 p-sm-10">
	    <div class="mb-4">
	        <select class="form-select form-select-lg " aria-label="Large select example"  style="width: 10rem" id="exam">
	        	<option selected="" disabled="">���� ����</option>
	        <c:forEach var="students" items="${list}">
	            
	            <option value="${students.examScore}" examCode = "${students.examCode }">${students.examSubject}</option>
			</c:forEach>

	        </select>
	    </div>
	</div>

<!-- ���� �Է� ���� -->
<form id="studentsExam">
<div class="border border-top-0 p-3 p-sm-5 row">

<!-- �⵵ �Է� -->

 

    <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control"  type="number" placeholder="2022" style="width:90px;" name="examYear">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">�⵵</font>
           		</font>
           	</label>
        </div>

    </div>

 <!-- �б� �Է� -->   
     <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control"  type="number" placeholder="1" style="width:90px;" name="examSemester">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">�б�</font>
           		</font>
           	</label>
        </div>
    </div>   

<!-- �б� �Է� -->    
     <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control"  type="number" placeholder="1" style="width:90px;" name="examTerm">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">�б�</font>
           		</font>
           	</label>
        </div>
    </div> 

<!-- ���� �Է� -->

     <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control"  type="text" placeholder="����" style="width:90px;" name="examSubject">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">����</font>
           		</font>
           	</label>
        </div>
    </div> 

<!-- ���� �Է� -->
     <div class="mb-4 col-sm-2">
        <div class="form-floating">
            <input class="form-control" type="number" placeholder="100" style="width:90px;" name="examScore">
            <label for="floatingInputExample">
          	    <font style="vertical-align: inherit;">
           			 <font style="vertical-align: inherit;">����</font>
           		</font>
           	</label>
        </div>
    </div> 
 <button class="btn btn-raised-success btn-sm col-sm-1 mb-4" type="button">���</button>

</div>

</form>

<!--  ���� �Է� ��-->

				 
<div class="card mb-5" align="center">
      <div class="card-header bg-white px-4"><div class="fs-5 my-1">${user.userName }�� ����</div></div>
      <div class="card-body p-4">
     	 <canvas id="myLineChart" width="883" height="265" style="display: block; box-sizing: border-box; width: 706.797px; height: 212px;"></canvas>
      </div>
  </div>

<script type="text/javascript">
new Chart(document.getElementById("myLineChart"), {
	  type: 'line',
	  data: {
	    labels: ["2022/1 �߰�","2022/1 �⸻","2022/2 �߰�","2022/2 �⸻"],
	    datasets: [{ 
	        data: [86,114,106,106],
	        label: "����",
	        borderColor: "#3e95cd",
	        fill: false
	      }, { 
	        data: [282,350,411,502],
	        label: "����",
	        borderColor: "#8e5ea2",
	        fill: false
	      }, { 
	        data: [168,170,178,190],
	        label: "��ȸ",
	        borderColor: "#3cba9f",
	        fill: false
	      }, { 
	        data: [40,20,10,16],
	        label: "Java",
	        borderColor: "#e8c3b9",
	        fill: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: 'exam chart test'
	    }
	  }
	});



/*             var context = document
                .getElementById('myLineChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // ��Ʈ�� ����
                data: { // ��Ʈ�� �� ������
                    labels: [
                        //x ��
                        '1','2','3','4','5','6','7'
                    ],
                    datasets: [
                        { //������
                            label: 'test1', //��Ʈ ����
                            fill: false, // line ������ ��, �� ������ ä����� ��ä�����
                            data: [
                                21,19,25,20,23,26,25 //x�� label�� �����Ǵ� ������ ��
                            ],
                            backgroundColor: [
                                //����
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //��輱 ����
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //��輱 ����
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            }); */
        </script>


</body>
</html>