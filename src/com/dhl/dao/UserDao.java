package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.User;

@Repository
public class UserDao extends BaseDao<User> {
	
	private final String GET_USER_BY_USERNAME = "from User u where u.name = ?";
	private final String GET_USER_BY_USERNAMEPASSWORD = "from User u where u.name = ? and u.password = ?";
	
	private final String QUERY_USER_BY_USERNAME = "from User u where u.name like ?";
	
	private final String GET_PAGEDS = "from User where name!= 'admin' order by id desc";
	
    /**
     * 根据用户名查询User对象
     * @param userName 用户名
     * @return 对应userName的User对象，如果不存在，返回null。
     */
	public User getUserByUserName(String userName,String password){
		Object[] value={userName,password};
		List<User> users = (List<User>)getHibernateTemplate().find(GET_USER_BY_USERNAMEPASSWORD,value);
	    if (users.size() == 0) {
			return null;
		}else{
			return users.get(0);
		}
    }
	
	public User getUserByUserName(String userName){
		List<User> users = (List<User>)getHibernateTemplate().find(GET_USER_BY_USERNAME,userName);
	    if (users.size() == 0) {
			return null;
		}else{
		
			return users.get(0);
		}
    }
	/**
	 * 根据用户名为模糊查询条件，查询出所有前缀匹配的User对象
	 * @param userName 用户名查询条件
	 * @return 用户名前缀匹配的所有User对象
	 */
	public List<User> queryUserByUserName(String userName){
	    return (List<User>)getHibernateTemplate().find(QUERY_USER_BY_USERNAME,userName+"%");
	}

	public Page getPage(int pageNo, int pageSize) 
	{
		return pagedQuery(GET_PAGEDS, pageNo, pageSize);
	}
}
