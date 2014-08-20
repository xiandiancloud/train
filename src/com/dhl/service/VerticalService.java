package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.SequentialDao;
import com.dhl.dao.VerticalDao;
import com.dhl.domain.Vertical;

/**
 *
 */
@Service
public class VerticalService {
	
	@Autowired
	private VerticalDao verticalDao;
	@Autowired
	private SequentialDao sequentialDao;
	
	public List<Vertical> getAllVertical(int sequentialId)
	{
		return verticalDao.getAllVertical(sequentialId);
	}
	
	/**
	 * 保存单元
	 * @param name
	 * @param courseId
	 * @return
	 */
	public Vertical saveVertical(String name,int sequentialId)
	{
		Vertical c = new Vertical();
		c.setName(name);
		c.setSequential(sequentialDao.get(sequentialId));
		verticalDao.save(c);
		return c;
	}
}
