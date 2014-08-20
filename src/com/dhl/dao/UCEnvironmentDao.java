package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UCEnvironment;

@Repository
public class UCEnvironmentDao extends BaseDao<UCEnvironment> {

	public List<UCEnvironment> getMyUCE(int userId) {
		String hql = "from UCEnvironment where userId = " + userId;
		return find(hql);
	}
	
	public UCEnvironment getMyUCE(int userId,int courseId,String name) {
		String hql = "from UCEnvironment where userId = " + userId +" and courseId = "+courseId +" and name = '"+name+"'";
		List<UCEnvironment> list = find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
