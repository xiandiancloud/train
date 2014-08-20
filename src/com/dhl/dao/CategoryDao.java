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
}
