package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.TeacherCourse;

@Repository
public class TeacherCourseDao extends BaseDao<TeacherCourse> {

	public List<TeacherCourse> getMyTCourse(int userId)
	{
		String hql = "from TeacherCourse where userId = "+userId;
	    return find(hql);
	}
}
