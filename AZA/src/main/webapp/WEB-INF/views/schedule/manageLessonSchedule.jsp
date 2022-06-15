<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@page import="java.util.List" %>
<%@page import="com.aza.service.domain.Schedule" %> --%>

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<link type="text/css" href="/resources/css/schedule.css" rel="stylesheet" />
<script type="text/javascript"	src="/resources/javascript/schedule/main.js"></script>
<!-- <script src='../lib/main.min.js'></script> -->
<script type="text/javascript"	src="/resources/javascript/schedule/ko.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<!-- <script src="path/jquery-3.3.1.min.js"></script> -->


<script>
      //addEventListener => Ư�����(id, class,tag���)event�� Ŭ���ϸ� �Լ��� ������
      /* document.addEventListener('DOMContentLoaded', function() { */
    	
      
    	var calendar = null;
    	$(document).ready(function(){
        var calendarEl = document.getElementById('calendar');
        
        /* var all_events = null; */
       /* all_events = loadingEvents();
        

  	  	var return_value;
  	  	alert("==============");
  	  	alert(return_value);
  	  	console.log(return_value); */
        /* console.log(all_events);
        alert(JSON.stringify(all_events)); */
        
       /*  let json = JSON.stringify(all_events);
        
        alert(json);
        
        var jsonConverList = JSON.parse(all_events);
        console.log('--------');
        console.log(jsonConverList);
        console.log('--------'); */
        
        /* var arr = new Array(all_events);
        var json = json_encode(arr);
        console.log(json); */
        
		//new FullCalendar.Calendar(��� DOM ��ü,(�Ӽ�: �Ӽ���, �Ӽ�2: �Ӽ���2..))
        calendar = new FullCalendar.Calendar(calendarEl, {
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridDay'
          },
          initialView: 'dayGridMonth',
          locale: 'ko',   //�ѱۼ��� ������ ����� ����
          buttonIcons: false, //������ �����޷� ���� <> == true
          navLinks: true,  //��¥ ������ �� ��ȸ.
          businessHours: true, //�� �ð� ǥ��
          editable: true,	//�������ɿ���
          selectable: true, //��¥ ���ý� ǥ��
          dayMaxEvents: true, //�̺�Ʈ�� ���� �� +ǥ�÷� ������ ����
          selectMirror: true,
          events: function(info, successCallback, failureCallback){
        	  // ajax ó���� �����͸� �ε� ��Ų��.
        	  /* var datalist = []; */
        	  $.ajax({
        		 type:"post",
        		 url: '/schedule/listLessonSchedule',
        		 dataType: "json",
                 success: function(list) {
                	  var events = [];
                      console.log("^^ �ɰ���?");
                      console.log(list);
                      $.each(list, function (index,data){
                    	  /* for(var i=0; i<data.length; i++){
                    		  console.log(data[i].title);  
                    	  } */
                    		var datalist = data.list;
                    	  
                    		/* for(var i=0; i<data.length; i++){ */
	                    		if(data.pValue !=null && data.pValue === 'private'){
	                    			for(var i=0; i<data.length; i++){
	                    			events.push({
		                    				title:data[i].title
		                    				,start:data[i].start
		                    				,end:data[i].end
	                    			}); 
	                    			}
	                    		}else if(data.pValue!=null&&data.pValue ==='public'){
	                    			for(var i=0; i<data.length; i++){
	                    			events.push({
		                    				title:data[i].title
		                    				,start:data[i].start
		                    				,end:data[i].end
	                    				}); 
	                    			}
	                    		}else{
	                    			for(var i=0; i<data.length; i++){
		                    			events.push({
			                    				title:data[i].title
			                    				,start:data[i].start
			                    				,end:data[i].end
		                    				}); 
		                    			}                  			
	                    		}
                    		 /*} */
                      })                      
                      /* datalist.push({
                    		title:result.title,
                    		start:result.start,
                    		end:result.end */
                    		/* title: "���� ȸ��",
                    		start: "2022-06-06T19:00:00",
                    		end: "2022-06-07T09:30:00" */
                      /* }); */
                	  successCallback(events);
                 	}
        	  });
          },//json������ ��
          eventAdd: function(){//�̺�Ʈ�� �߰��Ǹ� �߻��ϴ� �̺�Ʈ
        	  console.log()
          },
          
          select: function(arg){
            var title = prompt('���� ���: ');
            //title���� ������, ȭ�鿡 calendar.addEvent() json�������� ������ �߰�
            if(title){
              calendar.addEvent({
            	title: title,
                start: arg.start,
                end: arg.end,
                /* allDay: arg.allDay, */
                backgroundColor:"skyblue",
                textColor:"blue"
              })
            }
           /*  calendar.unselect() */
          },
          eventClick: function(arg){
              if(confirm('�̺�Ʈ�� ����ڽ��ϱ�?')){
                arg.event.remove()
              }
            },
          aditable: true
          //ajax�����͸� �ҷ��� �κ�
          /* events: all_events */
          /* events: */
        });
        calendar.render();       
        //������ �ɼ��� ����Ǹ� �������� �������� �ɼ� ����
/*         localeSelectorEl.addEventListener('change', function() {
            if (this.value) {
              calendar.setOption('locale', this.value);
            }
          });*/
      });
      
      function allSave()
      {
    	  var allEvent = calendar.getEvents();
    	  
    	  var events = new Array(); 
    	  
    	  /* console.log(allEvent); */
    	  for(var i=0; i< allEvent.length; i++)
    	  {
    		 var obj = new Object();
    		  /* alert(allEvent[i]._def.title);//�̺�Ʈ ��Ī */
    		 obj.title = allEvent[i]._def.title;	//�̺�Ʈ ��Ī
    		 /* obj.allday = allEvent[i]._def.allDay; //�Ϸ������� �̺�Ʈ���� �˷��ִ� boolean */
    		 obj.start = allEvent[i]._instance.range.start; //���� ��¥ �� �ð�
    		 obj.end = allEvent[i]._instance.range.end;
    		 
    		 events.push(obj);
    	  }
    	  var jsondata = JSON.stringify(events);
    	  /* console.log(jsondata); */
    	  
    	  savedata(jsondata)
      }
      
      function loadingEvents()	//��ü json data ���
      {
    	  $.ajax
    	  ({
    		  type:'POST',
    		  url: '/schedule/listLessonSchedule',
    		  data: {},
    		  dataType: 'JSON',	//������ �ö��� ������ Ÿ��
    		  async: false //==>����
    		})
    		.done(function(result){
    			/* console.log(result); */
    			/* alert(JSON.stringify(result));*/
    			
    			/* var list = result.list;
    			list.map(schedule => {
    				console.log(schedule.start);
    				console.log(schedule.end);
    				console.log(schedule.title);
    			}) */
    			
    			return_value = JSON.stringify(result);
    			/* alert(JSON.stringify(result)); */
    			alert(return_value);
    			return return_value;
    		})    		
    		.fail(function(request, status, error){
    			alert("���� �߻�:"+error)	
    		});
    	  /* 
    		return return_value; */
      }
      
      function savedata(jsondata)
      {
    	  $.ajax
    	  ({
    		  type:'POST',
    		  url: '/schedule/addLessonSchedule',
    		  data: {"alldata": jsondata},
    		  /* data: {"scheduleTitle":jsondata.scheduleTitle,
    			  "scheduleStartTime":"scheduleStartTime",
    			  "scheduleEndTime":"scheduleEndTime"}, */
    		  dataType: 'text',
    		  async: false //==>����
    		  /* success: function(data){
    			  alert("OK");
    		  } */
    		})
    		.done(function(result){
    			alert("ok");
    			alert(result);
    		})
    		
    		.fail(function(request, status, error){
    			alert("���� �߻�:"+error)	
    		});
      }
    </script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
	padding: 0 10px;
}

.fc-header-toolbar {
	/*�޷� ��� ���� ��ġ ����*/
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

#loading {
	display: none;
	position: absolute;
	top: 10px;
	right: 10px;
}
</style>

</head>
<body>
	<h2>ScheduleTest</h2>
	<div id='loading'>loading...</div>
	<div style="height:30px; text-align:center; font-size:35px; color:black; margin-bottom:30px; font-weight:bold">
	<div style="width:60%; float:left; text-align:right">���� ��Ȳ
	</div><div style="width:40%; float:left;text-align:right"></div>
	<button style="width:120px; height:40px; background-color:black; color:white; vertical-align:middle; font-size:17px;
	cursor:poointer" onclick="javascript:allSave();">��ü����</button></div>
	<div id='calendar'></div>
</body>
</html>