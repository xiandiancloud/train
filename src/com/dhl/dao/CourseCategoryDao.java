package com.dhl.dao;
import org.springframework.stereotype.Repository;

import com.dhl.domain.CourseCategory;

@Repository
public class CourseCategoryDao extends BaseDao<CourseCategory> {
	
	public Page getCourseByCategoryId(int categoryId,int pageNo,int pageSize)
	{
		String hql = "from CourseCategory where categoryId = "+categoryId;
		return pagedQuery(hql, pageNo, pageSize);
	}
}
