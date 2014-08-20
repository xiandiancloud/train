package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Vertical;

@Repository
public class VerticalDao extends BaseDao<Vertical> {
	
	public List<Vertical> getAllVertical(int sequentialId){
		String hql = "from Vertical where sequentialId = "+sequentialId;
    	return find(hql);
    }
}
