package com.dhl.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author dhl
 *
 */

@Entity
@Table(name= "user_course_time")
public class UserCourseTime extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int userId;
	private int courseId;
	private String usetime;
	private int docounts;
	
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
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
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
}
