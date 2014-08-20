package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.UserTrainHistoryDao;
import com.dhl.domain.UserTrainHistory;

/**
 *
 */
@Service
public class UserTrainHistoryService {

	@Autowired
	private UserTrainHistoryDao userTrainHistoryDao;

	public void save(UserTrainHistory entity)
	{
		userTrainHistoryDao.save(entity);
	}
}
