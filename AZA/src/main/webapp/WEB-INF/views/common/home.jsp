<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script defer src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script defer src="/webjars/stomp-websocket/stomp.min.js"></script>
<script defer src="/webjars/sockjs-client/sockjs.min.js"></script>
<script defer src="/resources/javascript/message/asserts/ui.js"></script>
</head>
<script type="text/javascript">

          $(function() {   
                               
                $.ajax({
                    url: "http://localhost:8080/message/rest/listMessage",
                    type: "GET",
                    headers : {
                            "Accept" : "application/json",
                            "Content-Type" : "application/json",                                    
                        },
                    success: function(result) {
                        if(result) {
                        	console.log(result);
                        	
                        	sessionStorage.setItem('userId', result[0].userId);
                        	
                        	result.shift();
                        	
                        	console.log(result);
                        	
                        	var listOtherView = "";
                        	
                        	result.map((other,i) => {
                       			
                        		let studentId = other.studentId ? other.studentId : other.firstStudentId;
                        		let studentName = other.studentId ? other.studentName : "�л��̷�";
                        		let relationName = other.relationName ? other.relationName : "";
                        		let userId = other.userId ? other.userId : studentId;
                        		let userName = studentName + " " + relationName;
                        		//console.log(i, studentId);
                        		
                        		listOtherView += `<ul id='getOtherMessage' class='list-unstyled mb-0' onclick="getOtherMessage('`+userId+`','`+userName+`')">
                        		<li class='p-2 border-bottom' data-id=`+userId+`>
                                    	<a class="d-flex justify-content-between">
	                                        <div class="d-flex flex-row">
	                                            <div class="pt-1">
	                                                <p class="fw-bold mb-0">`+studentName+" "+relationName+`</p>
	                                                <p class="small text-muted">�ֱٸ޽���</p>
	                                            </div>
	                                        </div>
                                    	</a>
                                	</li>
                            	</ul>`;
                        	});
                        	
                        	$('ul').remove();
                        	$('#listOther').append(listOtherView);

                        } else {
                            console.log("����");
                        }
                    } 
                })
            }); 


        </script>









<body>
  
        <h2>ä��</h2>
        <h3 class="">ä��������</h3>
        <button class="open-messagePopup" id="open-messagePopup" >Chat</button>        
        <div class="messagePopup hidden" id="messagePopup">
            <section style="background-color: #eee;">
                
                <!-- list -->
                <div id="otherListContainer" class="container py-5">          
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-6">         
                        <div class="card" id="chat2">
                            <div class="card-header d-flex justify-content-between align-items-center p-3">
                                <div>
                                    <h5 class="mb-0">�����</h5>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text" id="basic-addon1">@</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                  </div>
                                <button id="getMessageBtn" type="button" class="btn btn-primary btn-sm" data-mdb-ripple-color="dark">�ӽ� getMessageContainer</button>
                            </div>

                            <div id="listOther" class="card-body scroll" style="position: relative; height: 400px">
                               <ul class="list-unstyled mb-0">
                                    <li class="p-2 border-bottom">
                                        <a href="#!" class="d-flex justify-content-between">
                                            <div class="d-flex flex-row">
                                                <div class="pt-1">
                                                    <p class="fw-bold mb-0">�����̸�</p>
                                                    <p class="small text-muted">�ֱٸ޽���</p>
                                                </div>
                                            </div>
                                            <div class="pt-1">
                                                <p class="small text-muted mb-1">�ð�</p>
                                                <span class="badge bg-danger rounded-pill float-end">�</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul> 
                                 
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            <form id="">
                                <div class="d-flex justify-content-around"> 
                                </div>     
                            </form>
                        </div>
                    </div>
                </div>
                </div>

               <!--  message -->
                <div id="getMessageContainer" class="container py-5 hidden">          
                <div class="row d-flex justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-6">         
                        <div class="card" id="chat2">
                            <div class="card-header d-flex justify-content-between align-items-center p-3">
                                <div id="otherInfo">
                                    <h5 class="mb-0">otherName</h5>
                                    <h6 class="mb-0">otherDetail</h6>
                                </div>
                                <button id="otherListBtn" type="button" class="btn btn-primary btn-sm" data-mdb-ripple-color="dark">���</button>
                            </div>
                            
                            <div id="messages" class="card-body scroll" style="position: relative; height: 400px">
                                
                            </div>
                        </div>
                        <div class="card-footer text-muted">
                            <form id="msgForm">
                                <div class="d-flex justify-content-around">
                                <input type="text" id="messageContent"  class="form-control form-control-lg" placeholder="�޽��� �Է�">
                                <button id="sendBtn" class="btn btn-outline-primary"><i class="fas fa-paper-plane"></i></button>   
                            </div>     
                            </form>
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </div>

</body>
</html>