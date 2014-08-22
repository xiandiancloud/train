package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserRole;

@Repository
public class UserRoleDao extends BaseDao<UserRole> {
	
	public UserRole getUserRoleByUserId(int userId)
	{
		String hql = "from UserRole where userId = "+userId;
		List<UserRole> users = find(hql);
	    if (users==null || users.size() == 0) {
			return null;
		}else{
			return users.get(0);
		}
	}
}
