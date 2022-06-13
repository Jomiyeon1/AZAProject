<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  날짜 ,금액 포맷 lib-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>GET PAYMENT</title>


<!--  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Aza : main</title>       
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

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>

<script>

function requestPay(){
	
	var amount = $("td:nth-child(4)").text().trim();
	alert("amount ==> " + amount);
	var lessonName = $("td:nth-child(2)").text().trim();
	
	var payCode = $("td:nth-child(1)").text().trim();
	
    var IMP = window.IMP;
    IMP.init('imp15771574');
    
    // name, amonut

    // 결제창 호출
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(), // 주문 번호
		//
		name : lessonName,
		amount : amount
		

    }, function(rsp) {
        /*======================================================*/
/*         console.log(rsp); */
        if (rsp.success) { // 결제 성공 시 
                // jQuery로 HTTP 요청
                 jQuery.ajax({
                    url: "http://127.0.0.1:8080/payment/rest/complete/"+payCode, // 예: https://www.myservice.com/payments/complete
                    method: "GET",
                    headers: { "Content-Type": "application/json" },
                    data: {
                        imp_uid: rsp.imp_uid,
                        merchant_uid: rsp.merchant_uid
                    }
                }).done(function (data) {
                  // 가맹점 서버 결제 API 성공시 로직
                  payCode : payCode
                	alert("success!!");
                }); 

                /*======================================================*/
        } else {
			alert("실패");
        }
    

    
    });
};


</script>















<h3>GET PAYMENT</h3>

<table id="datatablesSimple" class="dataTable-table">
	
	
	<thead>
		<tr>
		
		<th data-type="date" data-format="YYYY/MM/DD" data-sortable="" style="width: 7%;">
		<a href="#" class="dataTable-sorter">No</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">수업명</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">학생 이름</a>
		</th>
		
		<th data-sortable="" style="width: 12%;">
		<a href="#" class="dataTable-sorter" align="center">수납료</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">수납예정일</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">수납완료일</a>
		</th>
		
		<th data-sortable="" style="width: 13%;">
		<a href="#" class="dataTable-sorter" align="center">수납여부</a>
		</th>
		
		<th data-sortable="" style="width: 10%;">
		<a href="#" class="dataTable-sorter" align="center">납부하기</a>
		</th>				
		
		</tr>
	</thead>
	
	<tbody>

					  
				<tr>				
				<td align="center">

				<input type="hidden" id="payCode" value="${payment.payCode}">
				${payment.payCode}
				</td>
				<td align="center"  id="lessonName" value="${payment.payLessonName.getLessonName()}" >${payment.payLessonName.getLessonName()}</td>
				<td align="center" id="studentName" payCode="${payment.payCode}">${payment.studentName}</td>
				
				<td align="center" value="${payment.amount}" id="amount" >
					<fmt:formatNumber value="${payment.amount}" pattern="#,###" />
				</td>
				
				<td align="center">${payment.payDueDate }</td>
				
				<td align="center">
					<fmt:parseDate value="${payment.payDay}" var="payday" pattern="yyyy-MM-dd HH:mm:ss" />
					<fmt:formatDate value="${payday}" pattern="yyyy/MM/dd" /> 		
				</td>
				
				<td align="center">${payment.checkPay }</td>
				
				<td align="center">
				<button class="btn btn-raised-warning" type="button" onclick="requestPay()" id="realPayment" payCode="${payment.payCode}" style="width:70%;height:35px;">결제하기　</button>
				</td>

				</tr>

</table>	



</body>
</html>