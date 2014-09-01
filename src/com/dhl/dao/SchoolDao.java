package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.School;

@Repository
public class SchoolDao extends BaseDao<School> {

	public List<School> getAllSchool() {
		String hql = "from School";
		return find(hql);
	}

	public School getSchoolByname(String name) {
		String hql = "from School where school_name = '" + name + "'";
		List<School> list = find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}
}
