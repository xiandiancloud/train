package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Category;

@Repository
public class CategoryDao extends BaseDao<Category> {
	
	public List<Category> getAllCategory()
	{
		String hql = "from Category";
    	return find(hql);
	}
	
	public Category getCategoryByname(String name)
	{
		String hql = "from Category where name = '"+name+"'";
		List<Category> list =  find(hql);
		if (list != null && list.size() > 0)
		{
			return list.get(0);
		}
		return null;
	}
}
