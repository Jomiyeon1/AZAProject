package com.aza.Lesson.test.Lesson;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import com.aza.common.Search;
import com.aza.service.domain.Book;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.LessonBook;
import com.aza.service.domain.Schedule;
import com.aza.service.lesson.LessonService;

//@RunWith(SpringRunner.class)
@SpringBootTest
public class LessonServiceTest {

	private static final int Object = 0;
	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	//ok
	//@Test
	public void testAddLesson() throws Exception{
		Lesson lesson = new Lesson();
		
//		lesson.setLessonCode("11111111");
		lesson.setTeacherId("teacher52");
		lesson.setLessonName("Lonely Eyes");
		lesson.setLessonPlace("");
		lesson.setLessonDay("");
		lesson.setLessonStartTime("10:50");
		lesson.setLessonEndTime("09:30");
		lesson.setSubject("");
		lesson.setFees(4500);
		
		lessonService.addLesson(lesson);
		
		lesson = lessonService.getLesson("11111111");
		System.out.println(lesson);
		System.out.println("============");
		
	}
	
	//OK
	//@Test
	public void testGetLesson() throws Exception{
		Lesson lesson = new Lesson();
		
		lesson = lessonService.getLesson("agho1216");
		
		System.out.println(lesson);
	}
	
	//ok
	//@Test
	public void updateLesson() throws Exception{
		Lesson lesson = new Lesson();
		lesson = lessonService.getLesson("QE8OWXXL");
//		lesson.setLessonCode("QE8OWXXL");
		lesson.setLessonName("WebSocket");
		lessonService.updateLesson(lesson);
		
		System.out.println(lesson);
//		Lesson lesson = lessonService.getLesson("QE8OWXXL");
//		
//		lesson.setLessonName("MongoDB");
//		
//		lessonService.updateLesson(lesson);
//		lesson = lessonService.getLesson("abcd1234");
//		System.out.println(lesson);	
		
	}
	
	//@Test
	public void deleteLesson() throws Exception{
		lessonService.deleteLesson("EDF43234");
	}
	
	//OK
	//@Test
	public void testlistLesson() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = lessonService.listLessonTeacher(search,"teacher52");
//		Map<String, Object> map = lessonService.listLesson(search,"student5");
		System.out.println(map);
		
		List<Object> list = (List<Object>)map.get("list");
//		assertEquals(3, list.size());
		
		System.out.println(list);
				
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);	
	}
	//OK
	//@Test
	public void testlistLessonStudent() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = lessonService.listLessonStudent(search,"student5");
//		Map<String, Object> map = lessonService.listLesson(search,"student5");
		System.out.println(map);
		
		List<Object> list = (List<Object>)map.get("list");
//		assertEquals(3, list.size());
		
		System.out.println(list);
				
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);	
	}
	
	//OK
	//@Test
	public void testaddLessonBook() throws Exception{
		Lesson lesson = new Lesson();
//		Book book = new Book();
		
		lesson.setIsbn("987654321");
		lesson.setBookTitle("lauv");
		lesson.setPublisher("pop");
		lesson.setBookPrice("90000");
		lesson.setAuthor("lauv");
		lesson.setBookYear("2020");
		lesson.setBookImg("2020");
		lesson.setLessonCode("agho1216");
		lessonService.addLessonBook(lesson);
		
	}
	
	//OK
	//@Test
	public void testlistLessonBook() throws Exception{
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);
		Map<String, Object> map = lessonService.listLessonBook(search, "teacher51");
		System.out.println(map);
		
		List<Object> list = (List<Object>)map.get("list");
//		assertEquals(3, list.size());
		
		System.out.println(list);
				
		Integer totalCount = (Integer)map.get("totalCount");
		System.out.println(totalCount);	
	}
	
	//OK
	//@Test
	public void testDeleteLessonBook() throws Exception{
		lessonService.deleteLessonBook("987654321");
	}
	
	//OK
	//@Test
	public void testaddLessonSchedule() throws Exception{
		Schedule schedule = new Schedule();
		
		schedule.setTeacherId("teacher53");
	}
		
	//OK
	//@Test
	public void testgetLessonSchedule() throws Exception{
		Schedule schedule = new Schedule();
		
		schedule = lessonService.getLessonSchedule(1002);
		
		System.out.println(schedule);
	}
	
	//OK
	//@Test
	public void testupdateLessonSchedule() throws Exception{
		Schedule schedule = lessonService.getLessonSchedule(1021);
		System.out.println(schedule);
		schedule.setScheduleStartDate("2022/06/05");
		schedule.setScheduleContent("lany-all 4 Nothing!");
		
		lessonService.updateLessonSchedule(schedule);
	}
	
	//OK
	//@Test
	public void testDeleteLessonSchedule() throws Exception{
		lessonService.deleteLessonSchedule(1022);
	}

	
	//OK
	//@Test
//	public void listLessonSchedule() throws Exception{
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(3);
//		Map<String, Object> map = lessonService.listLessonSchedule(search,"teacher51");
//		System.out.println(map);
//		
//		List<Object> list = (List<Object>)map.get("list");
////		assertEquals(3, list.size());
//		
//		System.out.println(list);
////				
//		Integer totalCount = (Integer)map.get("totalCount");
//		System.out.println(totalCount);	
//	}
	
	

	@Test
	public void testLessonTime() throws Exception{
		Map<String, Object> map = lessonService.listLessonTime("teacher1", "");

		System.out.println(map);
		
		List<Object> list = (List<Object>)map.get("list");
		System.out.println(list);
	}
	
	
	
	//@Test
//	public void testlistLessonStudent() throws Exception{
//		Search search = new Search();
//		search.setCurrentPage(1);
//		search.setPageSize(3);
//		Map<String, Object> map = lessonService.listLessonStudent(search,"student5");
////		Map<String, Object> map = lessonService.listLesson(search,"student5");
//		System.out.println(map);
//		
//		List<Object> list = (List<Object>)map.get("list");
////		assertEquals(3, list.size());
//		
//		System.out.println(list);
//				
//		Integer totalCount = (Integer)map.get("totalCount");
//	}
	
}
