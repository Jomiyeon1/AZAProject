<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>addLessonView</title>
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
         <label for="lessonDay" class="col-sm-2 control-label">����������</label>
         <div class="col-sm-10">
           <input type="text" class="form-control" id="lessonDay" name="lessonDay" placeholder="����������">
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
        <div class="form-group">
            <label for="lessonPlace" class="col-sm-2 control-label">�������</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lessonPlace" name="lessonPlace" placeholder="�������">
        </div>
        <div class="form-group">
            <label for="fees" class="col-sm-2 control-label">������</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="fees" name="fees" placeholder="������">
        </div>
        <div class="form-group">
            <label for="lessonContent" class="col-sm-2 control-label">����Ŀ��ŧ��</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lessonContent" name="lessonContent" placeholder="Ŀ��ŧ��">
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