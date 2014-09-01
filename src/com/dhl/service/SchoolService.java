package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.SchoolDao;
import com.dhl.domain.School;

/**
 *
 */
@Service
public class SchoolService {

	@Autowired
	private SchoolDao schoolDao;

	/**
	 * 返回全部的学校
	 * 
	 * @return
	 */
	public List<School> getAllSchool() {
		return schoolDao.getAllSchool();
	}

	/**
	 * 根据id删除学校
	 * 
	 * @param id
	 */
	public void remove(int id) {
		School s = schoolDao.get(id);
		if (s != null)
			schoolDao.remove(s);
	}

	/**
	 * 保存学校
	 * @param name
	 */
	public String saveSchool(String name) {
		School s = getSchoolByname(name);
		if (s == null) {
			School school = new School();
			school.setSchool_name(name);
			schoolDao.save(school);
			return CommonConstant.ERROR_2;
		}
		else
		{
			return CommonConstant.ERROR_1;
		}
	}

	/**
	 * 根据学校名称得到学校
	 * @param name
	 * @return
	 */
	public School getSchoolByname(String name) {
		return schoolDao.getSchoolByname(name);
	}
}
