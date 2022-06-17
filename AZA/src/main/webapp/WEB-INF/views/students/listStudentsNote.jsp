<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��Ʈ</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/79647d7f04.js" crossorigin="anonymous"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
<script defer src="/resources/javascript/alert/alertUI.js"></script>
<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">
<!-- Load Simple DataTables Stylesheet-->

<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet">
<!-- Load main stylesheet-->



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
<style>
*, body { 
font-family: Pretendard, 'Noto Sans KR';
}
</style>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">
</head>
<body>
<script type="text/javascript">

/* $(function(){
	$('#noteTitlee').on("click", function(){
		self.location ="/students/getStudentsNote?noteCode="+$(this).attr('noteCode');
	})
}); */

$(function(){
	$("td:nth-child(2)").on("click", function() {
		self.location ="/students/getStudentsNote?noteCode="+$(this).attr('noteCode');
	})
})


$(function() {	
	$( "button.btn.btn-outline-primary:contains('��Ʈ �ۼ�')").on("click" , function() {
		self.location = "/students/addStudentsNote";
	});
});



</script>

<!-- //////////////////////////////////////////////////////////////// -->
<!-- Layout content-->
<%-- <div id="layoutDrawer_content">
    <!-- Main page content-->
    <main>
    <header class="mb-9">
            <div class="container-xl p-5 mb-3">
                 <!-- <div class="row align-items-center justify-content-between">
                    <div class="col-12 col-md mb-4 mb-md-0">
                        <h1 class="mb-1 display-4 fw-500 text-white">�л� ���</h1>
                        <p class="lead mb-0 text-white">STUDENTS LIST</p>
                    </div>
                    <div class="col-12 col-md-auto flex-shrink-0">
                        <label class="form-label text-white-50" for="litepickerDateRange">Date range:</label>
                        <input class="form-control mb-0" id="litepickerDateRange" placeholder="Select date range..." value="Mar 8, 2021 - Mar 14, 2021" style="min-width: 13rem; height: 3rem">
                    <div class="litepicker-backdrop"></div></div>
                </div> -->
            </div> 
        </header>
        <div class="container-xl px-5">
            <div class="card card-raised mb-5">
                <div class="card-header bg-transparent px-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="me-4">
                            <h2 class="display-6 mb-0">�л� ���</h2>
                            <div class="card-text">Students List</div>
                        </div>
<!--                                     <div class="d-flex gap-2">
                                        <button class="btn btn-lg btn-text-primary btn-icon mdc-ripple-upgraded" type="button"><i class="material-icons">download</i></button>
                                        <button class="btn btn-lg btn-text-primary btn-icon mdc-ripple-upgraded" type="button"><i class="material-icons">print</i></button>
                                    </div> -->
                    </div>
                </div>
                <div class="card-body p-4">


            <!-- Simple DataTables example-->
            <table id="datatablesSimpleNote">
            
            </table>
          </div>
                    
            </div>
            <hr class="my-5" />
        </div>
    </main>
	<!-- Footer-->
	<footer>
		<button type="button" id="open-messagePopup" class="btn float btn-lg btn-icon"><i class="material-icons">mail_outline</i></button>
		<jsp:include page="/WEB-INF/views/common/home.jsp" />
	</footer>
</div> --%>
<!-- //////////////////////////////////////////////////////////////// -->

	<div class="col flex-shrink-0 mb-5 mb-md-0" style="margin: 20px 20px 20px 20px">
        <h1 class="display-4 mb-0">���� ��Ʈ</h1>
        <div class="text-muted">Students Note</div>
    </div>
	<div style="margin: 30px 30px 30px 30px">
		<!-- <input type="button" onclick="addBtn();" value="�ۼ�"/> -->
		<button id="addBtn" type="button" class="btn btn-outline-primary">��Ʈ �ۼ�</button>
	</div>

	<div class="dataTable-container" style="margin: 30px 30px 30px 30px">
      		<table id="datatablesSimple" class="dataTable-table">
	                <thead>
	                    <tr>
	                    	
	                    	<th data-sortable="" style="width: 5%;">
	                    		<a href="#" class="dataTable-sorter">No.</a>
                    		</th>
                    		<th data-sortable="" style="width: 16%;">
                    			<a href="#" class="dataTable-sorter">����</a>
                   			</th>
                   			<th data-sortable="" style="width: 15%;">
                   				<a href="#" class="dataTable-sorter">�ۼ� ��¥</a>
                  			</th>
               			</tr>
	                </thead>
	                
                	<tbody>
           				<c:set var="i" value="0"/>			
							<c:forEach var="students" items="${list}">			
							<c:set var="i" value="${i+1}" />
							<tr>
								<td >${i}</td>
								<td id="noteTitlee" noteCode="${students.noteCode }">${students.noteTitle}</td>
								<td >${students.noteCreateAt}</td>				
							</tr>
						</c:forEach>
              			</tbody>
              </table>
              <!-- <nav class="dataTable-pagination">
	              <ul class="dataTable-pagination-list">
		              <li class="active"><a href="#" data-page="1">1</a></li>
		              <li class=""><a href="#" data-page="2">2</a></li>
		              <li class=""><a href="#" data-page="3">3</a></li>
		              <li class="ellipsis"><a href="#">��</a></li>
		              <li class=""><a href="#" data-page="10">10</a></li
		              ><li class="pager"><a href="#" data-page="2">></a></li>
	              </ul>
              </nav> -->
    </div>


	
	
    <script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="/resources/javascript/common/charts/chart-defaults.js"></script> -->
	<script src="/resources/javascript/common/prism.js"></script>
	<script src="/resources/javascript/common/material.js"></script>
	<script src="/resources/javascript/common/scripts.js"></script>
	<script src="/resources/javascript/common/datatables/datatables-simple-demo2.js"></script>
<!-- 	<script src="/resources/javascript/common/charts/demos/dashboard-chart-area-light-demo.js"></script> -->
       

</body>
</html>