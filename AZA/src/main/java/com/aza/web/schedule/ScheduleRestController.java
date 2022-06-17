package com.aza.web.schedule;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.aza.common.Search;
import com.aza.service.domain.Schedule;
import com.aza.service.domain.User;
import com.aza.service.lesson.LessonService;

@CrossOrigin(origins="*", allowedHeaders="*")
@RestController
@RequestMapping("/schedule/rest/*")
public class ScheduleRestController {

	@Autowired
	@Qualifier("lessonServiceImpl")
	private LessonService lessonService;
	
	@Value("${pageUnit}")
	int pageUnit;

	@Value("${pageSize}")
	int pageSize;
	
	public ScheduleRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value="manageLessonSchedule")
	public Map<String, Object> manageLessonSchedule(HttpSession session) throws Exception{
		User user = (User)session.getAttribute("user");
		
		String teacherId = user.getUserId();
		Search search = new Search();
//		int totalCount= (int) lessonService.listLessonSchedule(search, teacherId).get("totalCount");
//		search.setCurrentPage(1);
//		search.setPageSize(totalCount);
		
//		return lessonService.listLessonSchedule(search, teacherId);
		return null;
	}
	
	@RequestMapping(value="getSchedule/{scheduleCode}",method=RequestMethod.GET)
	public Schedule getSchedule(@PathVariable int scheduleCode) throws Exception{
		return lessonService.getLessonSchedule(scheduleCode);
	}
	

	@RequestMapping(value="addSchedule", method=RequestMethod.POST)
	public Schedule addSchedule(@RequestBody Schedule schedule) throws Exception{
		lessonService.addLessonSchedule(schedule);
		return schedule;
	}
	
	@RequestMapping(value="deleteSchedule/{scheduleCode}",method=RequestMethod.POST)
	public Schedule deleteSchedule(@RequestBody Schedule schedule, @PathVariable int scheduleCode) throws Exception{
		lessonService.deleteLessonSchedule(scheduleCode);
		
		return schedule;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("listLessonSchedule")
	@ResponseBody
	public Map<String, Object> listLessonSchedule(HttpSession session) throws Exception{
		String role = ((User) session.getAttribute("user")).getRole();
		
		if(role.equals("teacher")) {
			String teacherId = ((User) session.getAttribute("user")).getUserId();
			
			Map<String, Object> map = lessonService.listLessonSchedule(teacherId);
			
			JSONObject json = new JSONObject();
			try {
				for(Map.Entry<String, Object> entry : map.entrySet()) {
					String key = entry.getKey();
					Object value = entry.getValue();
					
					json.put(key, value);
				}
			}catch(Exception e) {
				System.out.println("error임");
			}
			System.out.println(json.toString());
//			return json;
			return lessonService.listLessonSchedule(teacherId);
		}else {
			String studentId = ((User) session.getAttribute("user")).getUserId();
			
			Map<String, Object> map = lessonService.listLessonScheduleStudent(studentId, studentId);
			
			JSONObject json = new JSONObject();
			try {
				for(Map.Entry<String, Object> entry : map.entrySet()) {
					String key = entry.getKey();
					Object value = entry.getValue();
					
					json.put(key, value);
				}
			}catch(Exception e) {
				System.out.println("error임");
			}
			System.out.println(json.toString());
			return json;
		}
	}
	
//	@SuppressWarnings("unchecked")
//	@RequestMapping(value="listLessonSchedule")
//	@ResponseBody
////	public ModelAndView listLessonSchedule(@ModelAttribute("search") Search search, HttpSession session) throws Exception{
////	public String listLessonSchedule(@ModelAttribute("search") Search search, HttpSession session) throws Exception{
//	public JSONObject listLessonSchedule(HttpSession session) throws Exception{
////	public JSONArray listLessonSchedule(@ModelAttribute("search") Search search, HttpSession session) throws Exception{
////	public Map<String,Object> listLessonSchedule(@ModelAttribute("search")Search search,
////			@RequestParam Map<String, Object> param, HttpSession session)throws Exception{
////	public List<Map<String,Object>> listLessonSchedule(@ModelAttribute("search")Search search,
////			@RequestParam Map<String, Object> param, HttpSession session)throws Exception{
////		if(search.getCurrentPage()==0)
////		{
////			search.setCurrentPage(1);
////		}
////		search.setPageSize(pageSize);
//				
////		param.put("time", "2022-06-06T13:00:00.000Z");
////		param.put("end", "2022-06-06T14:00:00.000Z");
////		param.put("title", "안녕");
////		System.out.println(param);
////		return param;
//		
//		List<Map<String,Object>> paramList = new ArrayList<Map<String,Object>>();
//		
//		String teacherId = ((User) session.getAttribute("user")).getUserId();
////		Map<String, Object> map = lessonService.listLessonSchedule(search, teacherId);
//		Map<String, Object> map = lessonService.listLessonSchedule(teacherId);
////		String[] map = lessonService.listLessonSchedule(search, teacherId);;
//		
//		JSONArray arr = new JSONArray();
//		
//		JSONObject jsonObject = new JSONObject();
////		for(Map.Entry<String, Object> entry: map.entrySet()) {
////			String key = entry.getKey();
////			Object value = entry.getValue();
////			jsonObject.put(key, value);
////		}
////		arr.add(jsonObject);
////		jsonObject.put("id", "1");
////		jsonObject.put("title", "안녕");
////		jsonObject.put("time", "2022-06-06T13:00:00.000Z");
////		jsonObject.put("end", "2022-06-06T14:00:00.000Z");
////		System.out.println(jsonObject);
////		return jsonObject;
////		System.out.println(arr);
////		return arr;
//		
////		JSONParser parser = new JSONParser();
//		
//		JSONObject json = new JSONObject();
//		try {
//			for(Map.Entry<String, Object> entry : map.entrySet()) {
//				String key = entry.getKey();
//				Object value = entry.getValue();
//				
//				json.put(key, value);
//			}
//		}catch(Exception e) {
//			System.out.println("error임");
//		}
//		System.out.println(json.toString());
//		return json;
//	}
}
