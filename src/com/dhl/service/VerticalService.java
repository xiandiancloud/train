package com.dhl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.VerticalDao;
import com.dhl.domain.Vertical;

/**
 *
 */
@Service
public class VerticalService {
	
	@Autowired
	private VerticalDao verticalDao;
//	@Autowired
//	private SequentialDao sequentialDao;
	
	public Vertical get(int id)
	{
		return verticalDao.get(id);
	}
	
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
	public Vertical save(Vertical c)
	{
		verticalDao.save(c);
		return c;
	}
	
	/**
	 * 更新单元
	 * @param c
	 * @return
	 */
	public Vertical update(Vertical c)
	{
		verticalDao.update(c);
		return c;
	}
	
	/**
	 * 刪除单元
	 * @param c
	 * @return
	 */
	public void remove(Vertical c)
	{
		verticalDao.remove(c);
	}
}
