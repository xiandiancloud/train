package com.dhl.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 学生课程
 * @author dhl
 *
 */

@Entity
@Table(name= "user_course")
public class UserCourse extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int userId;
//	private int courseId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "courseId")
	private Course course;
	private int docounts;
	private int state;
	private String usetime;
	private int activestate;
	public int getActivestate() {
		return activestate;
	}
	public void setActivestate(int activestate) {
		this.activestate = activestate;
	}
	public String getUsetime() {
		return usetime;
	}
	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}
	public int getDocounts() {
		return docounts;
	}
	public void setDocounts(int docounts) {
		this.docounts = docounts;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
