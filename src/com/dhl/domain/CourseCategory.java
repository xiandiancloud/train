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
 * @author dhl
 *
 */

@Entity
@Table(name= "course_category")
public class CourseCategory extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "courseId")
	private Course course;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoryId")
	private Category category;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
