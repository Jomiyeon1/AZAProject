window.addEventListener('DOMContentLoaded', event => {

    const datatablesSimpleQuizList = document.getElementById('datatablesSimpleQuizList');

    if (datatablesSimpleQuizList) {
	    	$.ajax({
		url:"/paper/rest/listPaperQuiz",
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
	
				console.log("js : rest/listPaperQuiz");
				var quizs = result.list;
				var quizData = [];
				
				quizs.map((record, i) => {
					console.log(record);
					
					var temp = [];
					temp.push(i+1);
					temp.push(record.lessonName);
					temp.push(record.quizTitle);
					temp.push(record.studentName);
					temp.push(record.quizCreateAt);
					temp.push(record.quizSubmitDate);
					temp.push(record.quizScore);

					console.log(temp);
					
					quizData.push(temp);
				})
				console.log(quizData);
				
				var data = {
					"headings" : [
						"NO",
						"������",
						"�����",
						"�л� �̸�",
						"���� �����",
						"���� ������",
						"���� ����",
					],					
					"data" : quizData,

				}
						
				
				
         new simpleDatatables.DataTable(datatablesSimpleQuizList, {
			data,
			columnDefs: [
	            {
	                targets: [0],
	                orderData: [0, 1],
	            },
	            {
	                targets: [1],
	                orderData: [0, 1],
	            },
	            {
	                targets: [2],
	                orderData: [0, 1],
	            },
	            {
	                targets: [3],
	                orderData: [0, 1],
	            },
	            {
	                targets: [4],
	                orderData: [0, 1],
	            },
	            {
	                targets: [5],
	                orderData: [0, 1],
	            },
            ],	
		});
			}}
		})
    }
 ////////////////////////////////////////////////////////////////////////   
    const datatablesSimpleNoteList = document.getElementById('datatablesSimpleNoteList');

    if (datatablesSimpleNoteList) {
	    	$.ajax({
		url:"/students/rest/listStudentsNote",
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
	
				console.log("js : rest/listStudentsNote");
				var notes = result.list;
				var noteData = [];
				
				notes.map((record, i) => {
					console.log(record);
					
					var temp = [];
					temp.push(i+1);
					temp.push(record.noteTitle);
					temp.push(record.noteCreateAt);
					temp.push(record.noteCode);

					console.log(temp);
					
					noteData.push(temp);
				})
				console.log(noteData);
				
				var data = {
					"headings" : [
						"NO",
						"��Ʈ ����",
						"�ۼ� ��¥",
						"��Ʈ �ڵ�",
					],					
					"data" : noteData,

				}
				
				var getNoteCode = function(data, type, row) {
					var noteCode = row.lastElementChild.textContent
                     return `<a href="/students/getStudentsNote?noteCode=`+noteCode+`">`+data+`</a>`;
				}
				
										
         new simpleDatatables.DataTable(datatablesSimpleNoteList, {
			data,
			columns:[
				{
					select: 1,
					render: getNoteCode
				},
			],
			columnDefs: [
	            {
	                targets: [0],
	                orderData: [0, 1],
	            },
	            {
	                targets: [1],
	                orderData: [0, 1],
	            },
	            {
	                targets: [2],
	                orderData: [0, 1],
	            },
            ],	
		});
			}}
		})
    }
    /////////////////////////////////////////////////
    const datatablesSimpleHomeworkList = document.getElementById('datatablesSimpleHomeworkList');

    if (datatablesSimpleHomeworkList) {
	    	$.ajax({
		url:"/paper/rest/listPaperHomework",
		type:"POST",
		headers : {
                "Accept" : "application/json",
                "Content-Type" : "application/json",                                    
            },
        success: function(result) {         	
            if(result) {
	
				console.log("js : rest/listPaperHomework");
				var homeworks = result.list;
				var homeworkData = [];
				
				homeworks.map((record, i) => {
					console.log(record);
					
					var temp = [];
					temp.push(i+1);
					temp.push(record.lessonName);
					temp.push(record.homeworkTitle);
					temp.push(record.studentName);
					temp.push(record.homeworkCreateAt);
					temp.push(record.homeworkDueDate);
					temp.push(record.homeworkCheck);
					temp.push(record.homeworkCode);

					console.log(temp);
					
					homeworkData.push(temp);
				})
				console.log(homeworkData);
				
				var data = {
					"headings" : [
						"NO",
						"������",
						"���� ����",
						"�л� �̸�",
						"��� ��¥",
						"���� ��¥",
						"���� ���⿩��",
						"���� �ڵ�",
					],					
					"data" : homeworkData,

				}
				
				var homeworkCheckIcon = function(data, type, row) {
					if(data == "0"){
						return `<span class="badge bg-warning">�̿Ϸ�</span>`
					}else if(data == "1"){
						return `<span class="badge bg-success">�Ϸ�</span>`
					}
					return data;
				}
				
				var getHomeworkCode = function(data, type, row) {
					var homeworkCode = row.lastElementChild.textContent
                     return `<a href="/paper/managePaperHomework?homeworkCode=`+homeworkCode+`">`+data+`</a>`;
				}
						
				
				
         new simpleDatatables.DataTable(datatablesSimpleHomeworkList, {
			data,
			columns:[
				{
					select: 2,
					render: getHomeworkCode
				},
				{
					select: 6,
					render: homeworkCheckIcon
				}
			],
			columnDefs: [
	            {
	                targets: [0],
	                orderData: [0, 1],
	            },
	            {
	                targets: [1],
	                orderData: [0, 1],
	            },
	            {
	                targets: [2],
	                orderData: [0, 1],
	            },
	            {
	                targets: [3],
	                orderData: [0, 1],
	            },
	            {
	                targets: [4],
	                orderData: [0, 1],
	            },
	            {
	                targets: [5],
	                orderData: [0, 1],
	            },
	            {
	                targets: [6],
	                orderData: [0, 1],
	            },
            ],	
		});
			}}
		})
    }
});


				