package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CourseDao;
import com.dhl.dao.UserCourseDao;
import com.dhl.dao.UserCourseTimeDao;
import com.dhl.domain.UserCourse;
import com.dhl.domain.UserCourseTime;

/**
 *
 */
@Service
public class UserCourseService {

	@Autowired
	private UserCourseDao userCourseDao;
	@Autowired
	private CourseDao courseDao;
//	@Autowired
//	private UserCourseTimeDao userCourseTimeDao;
	
//	public UserCourseTime getUserCourseTime(int userId, int courseId,int docounts)
//	{
//		return userCourseTimeDao.getUserCourseTime(userId, courseId, docounts);
//	}
//	
//	public void updateUserCourseTime(UserCourseTime uct,String usetime)
//	{
//		uct.setUsetime(usetime);
//		userCourseTimeDao.update(uct);
//	}
//	public void saveUserCourse(int userId, int courseId) {
//		UserCourse uc = new UserCourse();
//		uc.setUserId(userId);
//		uc.setCourse(courseDao.get(courseId));
//		uc.setState(0);
//		uc.setDocounts(1);
//		userCourseDao.save(uc);
//	}

	public void save(UserCourse entity)
	{
		userCourseDao.save(entity);
	}
	public void updateUserCourse(UserCourse userCourse) {
		// userCourse.setHostname(hostname);
		// userCourse.setUsername(username);
		// userCourse.setPassword(password);
		// userCourse.setServerId(serverId);
		userCourseDao.update(userCourse);
	}

	public void setMyCourseActiveState(int userId) {
		userCourseDao.setMyCourseActiveState(userId);
	}
	public UserCourse getUserCourse(int userId, int courseId) {
		return userCourseDao.getUserCourse(userId, courseId);
	}
	
	public UserCourse getUserRecentlyCourse(int userId) {
		return userCourseDao.getUserRecentlyCourse(userId);
	}
	
	/**
	 * 得到我的所有课程
	 * 
	 * @param userId
	 * @return
	 */
	public List<UserCourse> getMyAllCourse(int userId) {
		return userCourseDao.getMyAllCourse(userId);
	}
	
	public List<UserCourse> getMyFinishCourse(int userId) {
		return userCourseDao.getMyFinishCourse(userId);
	}
	
	public List<UserCourse> getMyHavingCourse(int userId) {
		return userCourseDao.getMyHavingCourse(userId);
	}
}
