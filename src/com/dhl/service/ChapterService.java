package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ChapterDao;
import com.dhl.domain.Chapter;

/**
 *
 */
@Service
public class ChapterService {
	
	@Autowired
	private ChapterDao chapterDao;
//	@Autowired
//	private CourseDao courseDao;
	
	/**
	 * 根据章节id返回章节
	 * @param id
	 * @return
	 */
	public Chapter get(int id)
	{
		return chapterDao.get(id);
	}
	
	/**
	 * 保存章节
	 * @param name
	 * @param courseId
	 * @return
	 */
	public Chapter save(Chapter c)
	{
		chapterDao.save(c);
		return c;
	}

	/**
	 * 更新章节
	 * @param name
	 * @return
	 */
	public void update(Chapter c)
	{
		chapterDao.update(c);
	}
	
	/**
	 * 更新章节
	 * @param name
	 * @return
	 */
	public void remove(Chapter c)
	{
		chapterDao.remove(c);
	}
}
