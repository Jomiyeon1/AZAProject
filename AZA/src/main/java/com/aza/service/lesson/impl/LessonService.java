package com.aza.service.lesson.impl;

import java.util.List;
import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Book;
import com.aza.service.domain.Lesson;
import com.aza.service.domain.LessonBook;
import com.aza.service.domain.Schedule;

public interface LessonService {
	// lesson : insert
	public void addLesson(Lesson lesson) throws Exception;

	// lesson : select
	public Lesson getLesson(String lessonCode) throws Exception;

	// lesson : update
	public void updateLesson(Lesson lesson) throws Exception;

	// lesson : delete
	public Lesson deleteLesson(String lessonCode) throws Exception;

	// lesson : list
	public Map<String, Object> listLesson(Search search, String lessonName) throws Exception;

	// schedule : add
	public void addLessonSchedule(Schedule schedule) throws Exception;

	// schedule : select
	public Schedule getLessonSchedule(int scheduleCode) throws Exception;

	// schedule : update
	public void updateLessonSchedule(Schedule schedule) throws Exception;

	// schedule : delete
	public Schedule deleteLessonSchedule(int scheudleCode) throws Exception;

	// schedule : list
	public Map<String, Object> listLessonSchedule(Search search) throws Exception;
}