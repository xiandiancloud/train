package com.dhl.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UCEnvironmentDao;
import com.dhl.domain.UCEnvironment;
import com.dhl.util.UtilTools;

/**
 *
 */
@Service
public class UCEService {
	
	@Autowired
	private UCEnvironmentDao uceDao;
	
	public UCEnvironment get(int id) {
		return uceDao.get(id);
	}
	
	public UCEnvironment getMyUCE(int userId,int courseId,String name) {
		return uceDao.getMyUCE(userId,courseId,name);
	}
	
	public List<UCEnvironment> getMyUCE(int userId) {
		return uceDao.getMyUCE(userId);
	}
	
	public void update(UCEnvironment uce,String hostname,String username,String password,String serverId)
	{
		uce.setHostname(hostname);
		uce.setUsername(username);
		uce.setPassword(password);
		uce.setServerId(serverId);
		uceDao.update(uce);
	}
	
	public void save(int userId,int courseId,String name,String hostname,String username,String password,String serverId)
	{
		UCEnvironment uce = new UCEnvironment();
		uce.setUserId(userId);
		uce.setCourseId(courseId);
		uce.setName(name);
		uce.setHostname(hostname);
		uce.setUsername(username);
		uce.setPassword(password);
		uce.setServerId(serverId);
		uce.setCreatetime(UtilTools.timeTostrHMS(new Date()));
		uceDao.save(uce);
	}
	
	public void delete(int id) {
		uceDao.remove(uceDao.get(id));
	}
}
