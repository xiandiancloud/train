package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Course;

@Repository
public class CourseDao extends BaseDao<Course> {
	
	public List<Course> getCourseByName(String name)
	{
		String hql = "from Course where name = '"+name+"'";
    	return find(hql);
	}
	
	public Page getAllCourse(int pageNo,int pageSize){
		String hql = "from Course";
//    	return find(hql);
		return pagedQuery(hql, pageNo, pageSize);
		
    }
	
	public List<Course> getAllCourseList(){
		String hql = "from Course";
//    	return find(hql);
		return find(hql);
		
    }
}
