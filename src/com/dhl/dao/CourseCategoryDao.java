package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.cons.CommonConstant;
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
	
	public Page searchCourse(int categoryId,int rank,String search,int pageNo,int pageSize)
	{
		String r = "";
		if (rank == 1)
		{
			r = CommonConstant.LEVEL_1;
		}
		else if (rank == 2)
		{
			r = CommonConstant.LEVEL_2;
		}
		else if (rank == 3)
		{
			r = CommonConstant.LEVEL_3;
		}
		String hql = "from CourseCategory where course.publish = 1";
		if (categoryId > 0)
		{
			hql = "from CourseCategory where course.publish = 1 and category.id = "+categoryId;
		}
		if (rank > 0)
		{
			hql = "from CourseCategory where course.publish = 1 and course.rank = '"+r+"'";
		}
		if (search != null&& !"".equals(search))
		{
			hql = "from CourseCategory where course.publish = 1 and course.name like '%"+search+"%'";
		}
		if (categoryId > 0 && rank > 0)
		{
			hql = "from CourseCategory where course.publish = 1 and category.id = "+categoryId+" and course.rank = '"+r+"'";
		}
		if (categoryId > 0 && search != null && !"".equals(search))
		{
			hql = "from CourseCategory where course.publish = 1 and category.id = "+categoryId+" and course.name like '%"+search+"%'";
		}
		if (rank > 0 && search != null)
		{
			hql = "from CourseCategory where course.publish = 1 and course.rank = '"+r+"' and course.name like '%"+search+"%'";
		}
		if (categoryId > 0 && rank > 0 && search != null && !"".equals(search))
		{
			hql = "from CourseCategory where course.publish = 1 and category.id = "+categoryId+" and course.rank = '"+r+"' and course.name like '%"+search+"%'";
		}
		return pagedQuery(hql, pageNo, pageSize);
	}
}
