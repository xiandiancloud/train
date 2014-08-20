package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ChapterDao;
import com.dhl.dao.SequentialDao;
import com.dhl.domain.Sequential;

/**
 *
 */
@Service
public class SequentialService {
	
	@Autowired
	private ChapterDao chapterDao;
	@Autowired
	private SequentialDao sequentialDao;
	
	/**
	 * 保存小节
	 * @param name
	 * @param courseId
	 * @return
	 */
	public Sequential saveSequential(String name,int chapterId)
	{
		Sequential c = new Sequential();
		c.setName(name);
		c.setChapter(chapterDao.get(chapterId));
		sequentialDao.save(c);
		return c;
	}
	
}
