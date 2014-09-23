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
	
	/**
	 * 根据id取得单元下实训
	 * @param id
	 * @return
	 */
	public VerticalTrain get(int id)
	{
		return verticalTrainDao.get(id);
	}
	
	/**
	 * 删除单元下的实训
	 * @param id
	 */
	public void remove(int id)
	{
		verticalTrainDao.remove(get(id));
	}
}
