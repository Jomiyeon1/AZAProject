<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>���� ����</title>
<meta charset="EUC-KR">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
	function fncUpdateLesson(){
		$("form").attr("method","POST").attr("action","/lesson/udpateLesson").submit();
	}
	
	$(function() {
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncUpdateLesson();
		});
	});	
	
	$(function() {
		$("a[href='#']").on("click" , function() {
			$("form")[0].reset();
		});
	});
</script>

</head>
<body>
	<div class="container">
		<div class="page-header text-center">
			<h3 class="text-info">���� ����</h3>
		</div>
	<form class="form-horizontal" accept-charset="euc-kr">
	<input type="hidden" name="lessonName" value="${lesson.lessonName}" />
	  <div class="form-group">
	    <label for="lessonName" class="col-sm-offset-1 col-sm-3 control-label">���Ǹ�</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonName" name="lessonName" placeholder="���Ǹ�" value="${lesson.lessonName}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="lessonDay" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonDay" name="lessonDay" placeholder="����������" value="${lesson.lessonDay}">	    
	     </div>
	  </div>
	  <div class="form-group">
	    <label for="lessonStartTime" class="col-sm-offset-1 col-sm-3 control-label">���� ���۽ð�</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonStartTime" name="lessonStartTime" placeholder="�������۽ð�" value="${lesson.lessonStartTime}">	    
	     </div>
	  </div>
	  <div class="form-group">
	    <label for="lessonEndTime" class="col-sm-offset-1 col-sm-3 control-label">���� ����ð�</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonEndTime" name="lessonEndTime" placeholder="��������ð�" value="${lesson.lessonStartTime}">	    
	     </div>
	  </div>
	  <div class="form-group">
	    <label for="lessonPlace" class="col-sm-offset-1 col-sm-3 control-label">���� ���</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonPlace" name="lessonPlace" placeholder="�������" value="${lesson.lessonPlace}">	    
	     </div>
	  </div>	  
	  <div class="form-group">
	    <label for="lessonCreateAt" class="col-sm-offset-1 col-sm-3 control-label">���� ������</label>
	    <div class="col-sm-5">
	    <div align="left">${lesson.lessonCreateAt}</div>  
	     </div>
	  </div>	
	  <div class="form-group">
	    <label for="subject" class="col-sm-offset-1 col-sm-3 control-label">�����</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="subject" name="subject" placeholder="�����" value="${lesson.subject}">	    
	     </div>
	  </div>	
	  <div class="form-group">
	    <label for="lessonCode" class="col-sm-offset-1 col-sm-3 control-label">�����ڵ�</label>
	    <div class="col-sm-5">
	     	<input type="text" class="form-control" id="lessonCode" name="lessonCode" placeholder="�����ڵ�" value="${lesson.lessonCode}" readonly/>
	     </div>
	  </div>	  
	  <div class="form-group">
	    <label for="fees" class="col-sm-offset-1 col-sm-3 control-label">������</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="fees" name="fees" placeholder="������" value="${lesson.fees}">	    
	     </div>
	  </div>	
	  <div class="form-group">
	    <label for="lessonContent" class="col-sm-offset-1 col-sm-3 control-label">Ŀ��ŧ��</label>
	    <div class="col-sm-5">
	      <input type="text" class="form-control" id="lessonContent" name="lessonContent" placeholder="Ŀ��ŧ��" value="${lesson.lessonContent}">	    
	     </div>
	  </div>
	  
	  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
	  </div>
		  
	</form>
	
	</div>
	
</body>
</html>