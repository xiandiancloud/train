package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.VerticalTrain;

@Repository
public class VerticalTrainDao extends BaseDao<VerticalTrain> {
	
	public List<VerticalTrain> getVerticalTrainList(int verticalId){
		String hql = "from VerticalTrain where verticalId = "+verticalId;
    	return find(hql);
    }
	
	public List<VerticalTrain> getAllTrainByCourseId(int courseId)
	{
		String hql = "from VerticalTrain where courseId = "+courseId;
    	return find(hql);
	}
}
