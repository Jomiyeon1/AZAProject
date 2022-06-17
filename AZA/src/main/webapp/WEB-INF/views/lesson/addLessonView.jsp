<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>addLessonView</title>
    
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		function fncAddLesson(){
			var lessonName = $("input[name='lessonName']").val();
			var lessonDay = $("input[name='lessonDay']").val();
			var lessonPlace = $("input[name='lessonPlace']").val();
			var fees = $("input[name='fees']").val();
			var subject = $("input[name='subject']").val();
			
			if(lessonName == null || lessonName.length <1){
				alert("�������� �ʼ� �Է»����Դϴ�..");
				return;
			}
			if(lessonDay == null || lessonDay.length <1){
				alert("���������� �ʼ��Է»����Դϴ�..");
				return;
			}
			if(lessonPlace == null || lessonPlace.length <1){
				alert("������Ҵ� �ʼ��Է»����Դϴ�..");
				return;
			}
			if(fees ==null || fees.length <1){
				alert("������� �ʼ��Է»����Դϴ�..");
				return;
			}
			if(subject ==null || subject.length <1){
				alert("���Ǹ��� �ʼ��Է»����Դϴ�..");
				return;
			}
			$("form").attr("method","POST").attr("action","/lesson/addLesson").submit();
		}
		
		$(function(){
			$("button.btn.btn-primary").on("click",function(){
				fncAddLesson();
			});
		});
		
		$(function(){
			$("a[href='#']").on("click",function(){
				$("form")[0].reset();
			});
		});
	</script>
</head>
<body>
    <div class="container">
        <h1 class="bg-primary text-center">�������</h1>
        
        <!-- form start/// -->
    <form class="form-horizontal">
       <div class="form-group">
         <label for="lessonName" class="col-sm-2 control-label">������</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonName" name="lessonName" placeholder="������">
         </div>
       </div>
       <div class="form-group">
         <label for="lessonDay" class="col-sm-2 control-label">��������</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonDay" name="lessonDay" placeholder="��������">
         </div>
       </div>
       <div class="form-group">
        <label for="lessonStartTime" class="col-sm-2 control-label">�������۽ð�</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="lessonStartTime" name="lessonStartTime" placeholder="�������۽ð�">
        </div>
      </div>
      <div class="form-group">
        <label for="lessonEndTime" class="col-sm-2 control-label">��������ð�</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="lessonEndTime" name="lessonEndTime" placeholder="��������ð�">
        </div>
       </div>
        <div class="form-group">
            <label for="lessonPlace" class="col-sm-2 control-label">�������</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lessonPlace" name="lessonPlace" placeholder="�������">
        </div>
        </div>
        <div class="form-group">
            <label for="fees" class="col-sm-2 control-label">������</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="fees" name="fees" placeholder="������">
        	</div>
        </div>
        <div class="form-group">
            <label for="subject" class="col-sm-2 control-label">���Ǹ�</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="subject" name="subject" placeholder="���Ǹ�">
        </div>
        </div>
        <div class="form-group">
            <label for="lessonContent" class="col-sm-2 control-label">Ŀ��ŧ��</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lessonContent" name="lessonContent" placeholder="Ŀ��ŧ��">
        </div>
        </div>

       <div class="form-group">
	         <div class="col-sm-offset-4  col-sm-4 text-center">
	           <button type="button" class="btn btn-primary" >��&nbsp;��</button>
	           <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
	         </div>
       </div>
       
     </form>
    </div>
</body>
</html>