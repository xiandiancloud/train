package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserEnvironment;

@Repository
public class UserEnvironmentDao extends BaseDao<UserEnvironment> {

	public List<UserEnvironment> getMyUCE(int userId) {
		String hql = "from UserEnvironment where userId = " + userId;
		return find(hql);
	}
	
	public UserEnvironment getMyUCE(int userId,int courseId,int trainId) {
		String hql = "from UserEnvironment where userId = " + userId +" and courseId = "+courseId+" and trainId = "+trainId;
		List<UserEnvironment> list = find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
