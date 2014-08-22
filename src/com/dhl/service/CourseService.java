package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CourseDao;
import com.dhl.dao.Page;
import com.dhl.domain.Course;

/**
 *
 */
@Service
public class CourseService {
	
	@Autowired
	private CourseDao courseDao;
	
	/**
	 * 根据名字查课程
	 * @param name
	 * @return
	 */
	public List<Course> getCourseByName(String name)
	{
		return courseDao.getCourseByName(name);
	}
	
	/**
	 * 保存课程
	 * @param name
	 * @param imgpath
	 * @param desc
	 * @return
	 */
	public Course save(Course course)
	{
		courseDao.save(course);
		return course;
	}
	
	/**
	 * 取得所有的课程
	 * @param pageNo
	 * @param pageSize
	 * @return 返回课程的分页对象
	 */
	public Page getAllCourse(int pageNo,int pageSize)
	{
		return courseDao.getAllCourse(pageNo,pageSize);
	}
	
	/**
	 * 根据课程id取得课程
	 * @param id
	 * @return
	 */
	public Course get(int id)
	{
		return courseDao.get(id);
	}
}
