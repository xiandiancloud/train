package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserTrainDao;
import com.dhl.domain.UserTrain;

/**
 *
 */
@Service
public class UserTrainService {

	@Autowired
	private UserTrainDao userTrainDao;

	// @Autowired
	// private TrainDao trainDao;

	public void save(UserTrain entity) {
		userTrainDao.save(entity);
	}

	public void update(UserTrain entity) {
		userTrainDao.update(entity);
	}

	public UserTrain getUserTrain(int userId,int courseId,int trainId) {
		return userTrainDao.getUserTrain(userId,courseId,trainId);
	}
	
	public List<UserTrain> getMyCourseTrain(int userId,int courseId)
	{
		return userTrainDao.getMyCourseTrain(userId, courseId);
	}
	
	public List<UserTrain> getMyFinishCourseTrain(int userId,int courseId)
	{
		return userTrainDao.getMyFinishCourseTrain(userId, courseId);
	}
	
	public void delAllMyCourseTrain(int userId,int courseId)
	{
		userTrainDao.delAllMyCourseTrain(userId, courseId);
	}
}
