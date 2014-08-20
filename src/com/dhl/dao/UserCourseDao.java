package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserCourse;

@Repository
public class UserCourseDao extends BaseDao<UserCourse> {

	public UserCourse getUserCourse(int userId, int courseId) {
		String hql = "from UserCourse where courseId = " + courseId
				+ " and userId = " + userId;
		List<UserCourse> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}

	public UserCourse getUserRecentlyCourse(int userId) {
		String hql = "from UserCourse where activestate = 1 and userId = " + userId;
		List<UserCourse> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
	public List<UserCourse> getMyAllCourse(int userId) {
		String hql = "from UserCourse where userId = " + userId;
		return find(hql);
	}
	
	public List<UserCourse> getMyFinishCourse(int userId) {
		String hql = "from UserCourse where userId = " + userId +" and state = 1";
		return find(hql);
	}
	
	public List<UserCourse> getMyHavingCourse(int userId) {
		String hql = "from UserCourse where userId = " + userId +" and state = 0";
		return find(hql);
	}
	
	public void setMyCourseActiveState(int userId) {
		String hql = "update UserCourse  set activestate = 0 where userId = "+userId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
