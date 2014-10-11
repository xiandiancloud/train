package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CourseCategoryDao;
import com.dhl.dao.Page;

/**
 *
 */
@Service
public class CourseCategoryService {
	
	@Autowired
	private CourseCategoryDao courseCategoryDao;
	
	/**
	 * 取得分类下的已经发布的课程
	 * @param categoryId
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getCourseByCategoryId(int categoryId,int pageNo,int pageSize)
	{
		return courseCategoryDao.getCourseByCategoryId(categoryId, pageNo, pageSize);
	}
	
	/**
	 * 课程列表
	 * @param categoryId
	 * @param rank
	 * @param search
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page searchCourse(int categoryId,int rank,String search,int pageNo,int pageSize)
	{
		return courseCategoryDao.searchCourse(categoryId, rank, search, pageNo, pageSize);
	}
}
