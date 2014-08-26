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
}
