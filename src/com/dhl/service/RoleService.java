package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.RoleDao;
import com.dhl.domain.Role;

/**
 *
 */
@Service
public class RoleService {
	
	@Autowired
	private RoleDao roleDao;
	
	/**
	 * 根据角色名称取得角色
	 * @param roleName
	 * @return
	 */
	public Role getRoleByname(String roleName)
	{
		return roleDao.getRoleByname(roleName);
	}
}
