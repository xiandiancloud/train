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
@Table(name = "user_train_history")
public class UserTrainHistory extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int userId;
	private int courseId;
	private int trainId;
//	private int verticalId;
	private int counts;
	private String result;
	private String revalue;
	
	private int docounts;
	private String usetime;
	
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

	public String getRevalue() {
		return revalue;
	}

	public void setRevalue(String revalue) {
		this.revalue = revalue;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getTrainId() {
		return trainId;
	}

	public void setTrainId(int trainId) {
		this.trainId = trainId;
	}

//	public int getVerticalId() {
//		return verticalId;
//	}
//
//	public void setVerticalId(int verticalId) {
//		this.verticalId = verticalId;
//	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
}
