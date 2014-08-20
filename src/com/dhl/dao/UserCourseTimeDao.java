package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserCourseTime;

@Repository
public class UserCourseTimeDao extends BaseDao<UserCourseTime> {

	public UserCourseTime getUserCourseTime(int userId, int courseId,int docounts)
	{
		String hql = "from UserCourseTime where courseId = " + courseId
				+ " and userId = " + userId+" and docounts = "+docounts;
		List<UserCourseTime> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
}
