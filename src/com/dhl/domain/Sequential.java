package com.dhl.domain;

import java.util.List;
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
import javax.persistence.Transient;

/**
 * @author dhl
 *
 */

@Entity
@Table(name= "t_sequential")
public class Sequential extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private String name;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "chapterId")
	private Chapter chapter;
	
	@OneToMany(cascade = CascadeType.MERGE,fetch = FetchType.EAGER,mappedBy = "sequential")
	@OrderBy(value="id ASC")
	private Set<Vertical> verticals;
	
	@Transient
	private String trainResult;
	
//	private int chapterId;
	
	public String getTrainResult() {
		return trainResult;
	}
	public void setTrainResult(String trainResult) {
		this.trainResult = trainResult;
	}
	public Set<Vertical> getVerticals() {
		return verticals;
	}
	public void setVerticals(Set<Vertical> verticals) {
		this.verticals = verticals;
	}
	public Chapter getChapter() {
		return chapter;
	}
	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}
	//	public int getChapterId() {
//		return chapterId;
//	}
//	public void setChapterId(int chapterId) {
//		this.chapterId = chapterId;
//	}
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
