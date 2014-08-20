package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.Page;
import com.dhl.dao.UserDao;
import com.dhl.domain.User;

/**
 * 用户管理服务器，负责查询用户、注册用户、锁定用户等操作
 *
 */
@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
    public User add(String userName){
    	User user = new User();
    	user.setName(userName);
        userDao.save(user);
        return user;
    }
	
	/**
     * 更新用户
     * @param user 
     */
    public void update(User user){
        userDao.update(user);
    }
    
	   /**
     * 根据用户名/密码查询 User对象
     * @param userName 用户名
     * @return User
     */
//    public User getUserByUserName(String userName,String password){
//        return userDao.getUserByUserName(userName,password);
//    }
	
    public User getUserByUserName(String userName){
        return userDao.getUserByUserName(userName);
    }
	/**
	 * 根据userId加载User对象
	 * @param userId
	 * @return
	 */
	public User getUserById(int userId){
		return userDao.get(userId);
	}
	
	
	/**
	 * 根据用户名为条件，执行模糊查询操作 
	 * @param userName 查询用户名
	 * @return 所有用户名前导匹配的userName的用户
	 */
//	public List<User> queryUserByUserName(String userName){
//		return userDao.queryUserByUserName(userName);
//	}
	
	/**
	 * 获取所有用户
	 * @return 所有用户
	 */
	public List<User> getAllUsers(){
		return userDao.loadAll();
	}
	
	public Page getPage(int pageNo,int pageSize)
    {
    	return userDao.getPage(pageNo, pageSize);
    }
}
