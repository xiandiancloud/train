package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.TeacherCourseDao;
import com.dhl.domain.TeacherCourse;

/**
 *
 */
@Service
public class TeacherCourseService {

	@Autowired
	private TeacherCourseDao teacherCourseDao;
	
	/**
	 * 保存老师跟课程的对应关系
	 * @param name
	 * @param imgpath
	 * @param desc
	 * @return
	 */
	public TeacherCourse save(TeacherCourse course)
	{
		teacherCourseDao.save(course);
		return course;
	}
	
	/**
	 * 根据用户id取得老师的所有课程
	 * @param userId
	 * @return
	 */
	public List<TeacherCourse> getMyTCourse(int userId)
	{
		return teacherCourseDao.getMyTCourse(userId);
	}
}
