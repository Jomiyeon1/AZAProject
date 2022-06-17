package com.aza.web.students;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Page;
import com.aza.common.Search;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.Students;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;
import com.aza.service.students.StudentsService;

import com.aza.service.user.UserService;


@CrossOrigin(origins = "*", allowedHeaders = "*")
@RestController
@RequestMapping("/students/rest/*")
public class StudentsRestController {
	
	// field
	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;

	// field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;

	public StudentsRestController() {
		System.out.println(this.getClass());
	}
	
	
	// STUDENTS_RECORD :: ���� �Ϸ�� �л��鸸
	@RequestMapping("listStudentsRecord")
	public Map<String, Object> listStudentsRecord(HttpSession session, @RequestParam(required = false, value = "lessonCode") String lessonCode) throws Exception {
		
		System.out.println("/students/rest/listStudentsRecord");
		
		User dbUser = (User) session.getAttribute("user");		
		String teacherId = dbUser.getUserId();
		Search search = new Search();
		int totalCount = (int) studentsService.listStudentsRecord(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		
		if(lessonCode != null && lessonCode.length() > 1) {
			
			search.setSearchCondition("2");
			search.setSearchKeyword(lessonCode);
			
		}
		return studentsService.listStudentsRecord(search, teacherId);			
	}
	
	// STUDENTS_RECORD :: ���� ��û�� �л��鸸
	@RequestMapping("listProposalStudents")
	public Map<String, Object> listProposalStudents(HttpSession session) throws Exception {
		
		System.out.println("/students/rest/listProposalStudents");
		
		User dbUser = (User) session.getAttribute("user");		
		String teacherId = dbUser.getUserId();
		Search search = new Search();
		int totalCount = (int) studentsService.listProposalStudents(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		
		return studentsService.listProposalStudents(search, teacherId);		
	}
	
	// STUDENTS_RECORD :: ���� ��û�� �л��鸸
	@RequestMapping("listTotalStudentsRecord")
	public Map<String, Object> listlistTotalStudentsRecord(HttpSession session) throws Exception {
		
		System.out.println("/students/rest/listProposalStudents");
		
		User dbUser = (User) session.getAttribute("user");		
		String teacherId = dbUser.getUserId();
		Search search = new Search();
		int totalCount = (int) studentsService.listTotalStudentsRecord(search, teacherId).get("totalCount");
		search.setCurrentPage(1);
		search.setPageSize(totalCount);
		
		return studentsService.listTotalStudentsRecord(search, teacherId);		
	}
	
	
	// ATTENDANCE
	@RequestMapping(value="listStudentsAttendance/{month}/{year}", method=RequestMethod.POST)
	public Map<String, Object> listStudentsAttendance(	@PathVariable("month") int month, 
														@PathVariable(required = false, value="year") String year, 
														HttpSession session,
														@RequestParam(required = false, value="studentId") String studentId,
														@RequestParam(required = false, value="lessonCode") String lessonCode
														) throws Exception {
		
		System.out.println("/students/rest/listStudentsAttendance");
		
		LocalDate now = LocalDate.now();
		String prevMonth = Integer.toString(month - 1); 
		prevMonth = prevMonth.length() < 2 ? "0" + prevMonth : prevMonth;
		String curMonth = month < 10 ? "0" + Integer.toString(month) : Integer.toString(month);
		
		if(year == null) {
			year = Integer.toString(now.getYear());
		}
		
		String searchStartDate = year + "/" + prevMonth + "/31";
		String searchEndDate = year + "/" + curMonth + "/31";

		String userId = ((User) session.getAttribute("user")).getUserId();
		Search search = new Search();

		
		// �ӽ� => session���� ����
		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//Map<String, Object> map = userService.listRelationByParent(search, userId);
		List students = (List) userService.listRelationByParent(search, userId).get("list");	
		
		String studentId = ((User) students.get(0)).getFirstStudentId();
		System.out.println("students : "+studentId);
		
		List lessons = (List) lessonService.listLessonStudent(search, studentId).get("list");
		String lessonCode = ((Lesson)lessons.get(0)).getLessonCode();
		System.out.println("lessons : "+lessonCode);
		
		//
		search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(31);
		
		if(studentId==null || studentId.length() < 1) {
			List students = (List) session.getAttribute("students");
			studentId = ((User) students.get(0)).getFirstStudentId();			
		}
		
		System.out.println("studentId : "+studentId);
		
		if(lessonCode == null || lessonCode.length() < 1) {
			List lessons = (List) lessonService.listLessonStudent(search, studentId).get("list");
			lessonCode = ((Lesson)lessons.get(0)).getLessonCode();	
		}
		
		System.out.println("lessonCode : "+lessonCode);

		return studentsService.listStudentsAttendance(search, studentId, lessonCode, searchStartDate, searchEndDate);	
	}
	
	// Exam ===========================================
	@RequestMapping(value = "manageStudentsExam")
	public Map<String,Object> listStudentsExam
	(HttpServletRequest request) throws Exception{
		
		System.out.println("listExam RestController Start...");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		
		Map<String, Object> map = studentsService.listStudentsExam(search);
		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		
		return map;
	}
	
	@RequestMapping(value = "getStudentsExam/{examCode}")
	public Students getStudentsExam(@PathVariable int examCode) throws Exception{
		
		Students students = new Students();
		students = studentsService.getStudentsExam(examCode);
		
		return students;		
	}
	
	// ������ ����� �� �ѷ��ֱ�(?)
	@RequestMapping(value = "updateStudentsExam/{examCode}", method = RequestMethod.GET)
	public Students updateStudentsExam(@PathVariable int examCode) throws Exception{
		
		System.out.println("rest/updateStudentsExam :: GET");
		
		return studentsService.getStudentsExam(examCode);
	}
	
	// ���� method
	@RequestMapping(value = "updateStudentsExam/{examCode}", method = RequestMethod.POST)
	public Students updateStudentsExam(@RequestBody Students students) throws Exception{
		
		System.out.println("rest/updateStudentsExam :: POST");
		
		studentsService.updateStudentsExam(students);
		
		return students;		
	}
	
	@RequestMapping(value = "deleteStudentsExam/{ExamCode}")
	public void deleteStudentsExam(@PathVariable int examCode) throws Exception{
		
		studentsService.deleteStudentsExam(examCode);
	}
	
	
}