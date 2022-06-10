<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>listPayment</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
</head>
<body>
<script type="text/javascript">

$(function() {
	$('#payName').on("click" , function() {
		alert("hi!");
		$.ajax(
			{
				url: "/payment/rest/getPayment",
				method : "GET",
				dataType : "JSON",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status){
						
						alert("JSONData : \n"+JSONData);
						alert("JSONData �̸� : \n"+JSONData.studentName);
						
						var displayValue = "<h3>" +"�л� �̸�: "+JSONData.studentName+"<br/>";
						$("h3").remove();
						$( "#"+payName+"" ).html(displayValue);
						
						
					}
				
			});

	});
});

//iamport
function requestPay(){

    var IMP = window.IMP;
    IMP.init('imp15771574');
    // ����â ȣ��
    IMP.request_pay({
        pg : 'html5_inicis',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(), // �ֹ� ��ȣ
        name : '��ǰ��',
        //amount : this.order.amount,
        amount : 100,
        buyer_tel : '010-1111-1111',
    }, function(rsp) {
        if ( rsp.success ) {



        } else {
			System.out.println("11");
        }

    });
}
</script>


<h3>PAYMENT LIST</h3>

				<table border="1" cellspacing = "0" cellpadding = "10px">

			  	<tr>
			  			<td>No</td>
			  			<td>������</td>
			  			<td>�л� �̸�</td>
			  			<td>������</td>
			  			<td>����������</td>
			  			<td>�����Ϸ���</td>
			  			<td>��������</td>
			  			<td>�����ϱ�</td>
			  	</tr>
		  			  <c:set var="i" value="0" />
 	 				  <c:forEach var="payment" items="${list}">
					  <c:set var="i" value="${ i+1 }" />
			  	 <tr>
							<td align="center">${ i } </td>
		
							<td align="center" >${payment.payLessonName.getLessonName()}</td>
							<td align="center" id="payName">${payment.studentName} </td>
							<td align="center">${payment.amount} </td>
							<td align="center">${payment.payDueDate} </td>
							<td align="center" type="date">${payment.payDay} </td>
							<td align="center">${payment.checkPay} </td>
							
							<td align="center"><button onclick="requestPay()">�����ϱ�</button></td>				 
					
				 </tr>
				  </c:forEach>

				</table>
				
<!--  -->			
       

</body>
</html>