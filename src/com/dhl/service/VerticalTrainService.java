package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.TrainDao;
import com.dhl.dao.VerticalTrainDao;
import com.dhl.domain.VerticalTrain;

/**
 *
 */
@Service
public class VerticalTrainService {
	
	@Autowired
	private VerticalTrainDao verticalTrainDao;
	@Autowired
	private TrainDao trainDao;
	
	public List<VerticalTrain> getVerticalTrainList(int verticalId){
		return verticalTrainDao.getVerticalTrainList(verticalId);
    }
	
	public List<VerticalTrain> getAllTrainByCourseId(int courseId)
	{
		return verticalTrainDao.getAllTrainByCourseId(courseId);
	}
}
