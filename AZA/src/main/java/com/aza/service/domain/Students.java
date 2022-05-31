package com.aza.service.domain;

public class Students {

	// field
	private String lessonCode;
	private int attendanceCode;
	private String studentId;
	private String studentName;
	private String attendanceDate;
	private String attendanceState;
	private int characterCode;
	private String teacherId;
	private String characterContent;
	private int recordCode;
	private char proposal;
	private String lessonStartDate;
	private int fees;
	private String payDueDate;
	private int examCode;
	private String examTerm;
	private int examYear;
	private int examSemester;
	private String examSubject;
	private int examScore;
	private int noteCode;
	private String noteCreateAt;
	private String noteTitle;
	private String noteContent;
	
	
	// ctor
	public Students() {}


	// method :: getter & setter
	public String getLessonCode() {
		return lessonCode;
	}


	public void setLessonCode(String lessonCode) {
		this.lessonCode = lessonCode;
	}


	public int getAttendanceCode() {
		return attendanceCode;
	}


	public void setAttendanceCode(int attendanceCode) {
		this.attendanceCode = attendanceCode;
	}


	public String getStudentId() {
		return studentId;
	}


	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}


	public String getStudentName() {
		return studentName;
	}


	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}


	public String getAttendanceDate() {
		return attendanceDate;
	}


	public void setAttendanceDate(String attendanceDate) {
		this.attendanceDate = attendanceDate;
	}


	public String getAttendanceState() {
		return attendanceState;
	}


	public void setAttendanceState(String attendanceState) {
		this.attendanceState = attendanceState;
	}


	public int getCharacterCode() {
		return characterCode;
	}


	public void setCharacterCode(int characterCode) {
		this.characterCode = characterCode;
	}


	public String getTeacherId() {
		return teacherId;
	}


	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}


	public String getCharacterContent() {
		return characterContent;
	}


	public void setCharacterContent(String characterContent) {
		this.characterContent = characterContent;
	}


	public int getRecordCode() {
		return recordCode;
	}


	public void setRecordCode(int recordCode) {
		this.recordCode = recordCode;
	}


	public char getProposal() {
		return proposal;
	}


	public void setProposal(char proposal) {
		this.proposal = proposal;
	}


	public String getLessonStartDate() {
		return lessonStartDate;
	}


	public void setLessonStartDate(String lessonStartDate) {
		this.lessonStartDate = lessonStartDate;
	}


	public int getFees() {
		return fees;
	}


	public void setFees(int fees) {
		this.fees = fees;
	}


	public String getPayDueDate() {
		return payDueDate;
	}


	public void setPayDueDate(String payDueDate) {
		this.payDueDate = payDueDate;
	}


	public int getExamCode() {
		return examCode;
	}


	public void setExamCode(int examCode) {
		this.examCode = examCode;
	}


	public String getExamTerm() {
		return examTerm;
	}


	public void setExamTerm(String examTerm) {
		this.examTerm = examTerm;
	}


	public int getExamYear() {
		return examYear;
	}


	public void setExamYear(int examYear) {
		this.examYear = examYear;
	}


	public int getExamSemester() {
		return examSemester;
	}


	public void setExamSemester(int examSemester) {
		this.examSemester = examSemester;
	}


	public String getExamSubject() {
		return examSubject;
	}


	public void setExamSubject(String examSubject) {
		this.examSubject = examSubject;
	}


	public int getExamScore() {
		return examScore;
	}


	public void setExamScore(int examScore) {
		this.examScore = examScore;
	}


	public int getNoteCode() {
		return noteCode;
	}


	public void setNoteCode(int noteCode) {
		this.noteCode = noteCode;
	}


	public String getNoteCreateAt() {
		return noteCreateAt;
	}


	public void setNoteCreateAt(String noteCreateAt) {
		this.noteCreateAt = noteCreateAt;
	}


	public String getNoteTitle() {
		return noteTitle;
	}


	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}


	public String getNoteContent() {
		return noteContent;
	}


	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}


	@Override
	public String toString() {
		return "Students [lessonCode=" + lessonCode + ", attendanceCode=" + attendanceCode + ", studentId=" + studentId
				+ ", studentName=" + studentName + ", attendanceDate=" + attendanceDate + ", attendanceState="
				+ attendanceState + ", characterCode=" + characterCode + ", teacherId=" + teacherId
				+ ", characterContent=" + characterContent + ", recordCode=" + recordCode + ", proposal=" + proposal
				+ ", lessonStartDate=" + lessonStartDate + ", fees=" + fees + ", payDueDate=" + payDueDate
				+ ", examCode=" + examCode + ", examTerm=" + examTerm + ", examYear=" + examYear + ", examSemester="
				+ examSemester + ", examSubject=" + examSubject + ", examScore=" + examScore + ", noteCode=" + noteCode
				+ ", noteCreateAt=" + noteCreateAt + ", noteTitle=" + noteTitle + ", noteContent=" + noteContent + "]";
	}
	
}
