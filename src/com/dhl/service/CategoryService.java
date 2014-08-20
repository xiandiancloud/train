package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.CategoryDao;
import com.dhl.domain.Category;

/**
 *
 */
@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	public List<Category> getAllCategory()
	{
		return categoryDao.getAllCategory();
	}
	
}
