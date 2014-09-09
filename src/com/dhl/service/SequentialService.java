package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.SequentialDao;
import com.dhl.domain.Sequential;

/**
 *
 */
@Service
public class SequentialService {
	
//	@Autowired
//	private ChapterDao chapterDao;
	@Autowired
	private SequentialDao sequentialDao;
	
	/**
	 * 根据id返回小节
	 * @param id
	 * @return
	 */
	public Sequential get(int id)
	{
		return sequentialDao.get(id);
	}
	
	/**
	 * 保存小节
	 * @return
	 */
	public Sequential save(Sequential c)
	{
		sequentialDao.save(c);
		return c;
	}
	
	/**
	 * 更新小节
	 * @return
	 */
	public void update(Sequential c)
	{
		sequentialDao.update(c);
	}
	
	/**
	 * 刪除小节
	 * @return
	 */
	public void remove(Sequential c)
	{
		sequentialDao.remove(c);
	}
}
