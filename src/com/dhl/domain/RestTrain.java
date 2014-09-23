package com.dhl.domain;


/**
 * 考试系统跟实训交换数据的类
 * @author dhl
 */
public class RestTrain {

	//实训课程的列表
	String courselist;
	
	private int courseId;
	//单个课程
	String course;
	
	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getCourselist() {
		return courselist;
	}

	public void setCourselist(String courselist) {
		this.courselist = courselist;
	}
	
}
