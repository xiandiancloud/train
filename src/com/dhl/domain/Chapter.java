package com.dhl.domain;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

/**
 * @author dhl
 * 
 */

@Entity
@Table(name = "t_chapter")
public class Chapter extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "courseId")
	private Course course;
	@OneToMany(cascade = CascadeType.MERGE,fetch = FetchType.EAGER,mappedBy = "chapter")
	@OrderBy(value="id ASC")
	private Set<Sequential> sequentials;
	

	public Set<Sequential> getSequentials() {
		return sequentials;
	}

	public void setSequentials(Set<Sequential> sequentials) {
		this.sequentials = sequentials;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	// private int courseId;
	// public int getCourseId() {
	// return courseId;
	// }
	// public void setCourseId(int courseId) {
	// this.courseId = courseId;
	// }
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
