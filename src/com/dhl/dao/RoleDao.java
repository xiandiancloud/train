package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Role;

@Repository
public class RoleDao extends BaseDao<Role> {
	
	public Role getRoleByname(String roleName)
	{
		String hql = "from Role where roleName = '"+roleName+"'";
		List<Role> users = find(hql);
	    if (users==null || users.size() == 0) {
			return null;
		}else{
			return users.get(0);
		}
	}
}
