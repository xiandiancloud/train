package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.CourseCategory;

@Repository
public class CourseCategoryDao extends BaseDao<CourseCategory> {
	
	public Page getCourseByCategoryId(int categoryId,int pageNo,int pageSize)
	{
		String hql = "from CourseCategory where course.publish = 1 and category.id = "+categoryId;
		return pagedQuery(hql, pageNo, pageSize);
	}
	
	public CourseCategory getCourseCategoryByCourseId(int courseId)
	{
		String hql = "from CourseCategory where courseId = "+courseId;
		List<CourseCategory> list = find(hql);
    	if (list.size() == 0) {
			return null;
		}else{
		
			return list.get(0);
		}
	}
}
