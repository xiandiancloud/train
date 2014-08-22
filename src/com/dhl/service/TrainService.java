package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.TrainDao;
import com.dhl.domain.Train;

/**
 *
 */
@Service
public class TrainService {

	@Autowired
	private TrainDao trainDao;

	/**
	 * 根据编码取得实验
	 * @return
	 */
	public Train getTrainByCodenum(String codenum)
	{
		return getTrainByCodenum(codenum);
	}
	
	/**
	 * 保存实验
	 * 
	 * @return
	 */
	public Train save(Train t) {
		trainDao.save(t);
		return t;
	}

}
