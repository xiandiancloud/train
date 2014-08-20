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
	public Course saveCourse(String name,String imgpath,String desc)
	{
		Course course = new Course();
		course.setName(name);
		course.setImgpath(imgpath);
		course.setDescrible(desc);
		courseDao.save(course);
		return course;
	}
	
	public Page getAllCourse(int pageNo,int pageSize)
	{
		return courseDao.getAllCourse(pageNo,pageSize);
	}
	
	public Course getCourse(int id)
	{
		return courseDao.get(id);
	}
}
