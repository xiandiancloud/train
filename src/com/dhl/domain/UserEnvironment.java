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
@Table(name = "t_user_environment")
public class UserEnvironment extends BaseDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	private int userId;
//	private int courseId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "courseId")
	private Course course;
//	private int trainId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "trainId")
	private Train train;
	//环境模板名
	private String name;
//	private String result;
	private String createtime;
	private String hostname;
	private String username;
	private String password;
	private String serverId;
	
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Train getTrain() {
		return train;
	}
	public void setTrain(Train train) {
		this.train = train;
	}
//	public int getCourseId() {
//		return courseId;
//	}
//	public void setCourseId(int courseId) {
//		this.courseId = courseId;
//	}
//	public int getTrainId() {
//		return trainId;
//	}
//	public void setTrainId(int trainId) {
//		this.trainId = trainId;
//	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getServerId() {
		return serverId;
	}
	public void setServerId(String serverId) {
		this.serverId = serverId;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
//	public String getResult() {
//		return result;
//	}
//	public void setResult(String result) {
//		this.result = result;
//	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
}
