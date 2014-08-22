package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserRoleDao;
import com.dhl.domain.UserRole;

/**
 *
 */
@Service
public class UserRoleService {
	
	@Autowired
	private UserRoleDao roleDao;
	
	/**
	 * 保持用户跟角色的对应关系
	 * @return
	 */
	public void save(UserRole entity)
	{
		roleDao.save(entity);
	}
}
