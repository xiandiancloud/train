package com.dhl.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.TrainDao;
import com.dhl.dao.VerticalTrainDao;
import com.dhl.domain.Train;
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
	
	public List<Train> getTrainList(int verticalId)
	{
		List<Train> trainList = new ArrayList<Train>();
		List<VerticalTrain> list = verticalTrainDao.getVerticalTrainList(verticalId);
		if (list != null)
		{
			int size = list.size();
			for (int i=0;i<size;i++)
			{
				VerticalTrain vt = list.get(i);
//				Train train = trainDao.get(vt.getTrainId());
				Train train = trainDao.get(vt.getTrain().getId());
				trainList.add(train);
			}
		}
		return trainList;
	}
	
	public List<VerticalTrain> getAllTrainByCourseId(int courseId)
	{
		return verticalTrainDao.getAllTrainByCourseId(courseId);
	}
}
