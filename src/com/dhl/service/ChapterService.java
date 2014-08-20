package com.dhl.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dhl.dao.ChapterDao;
import com.dhl.dao.CourseDao;
import com.dhl.domain.Chapter;

/**
 *
 */
@Service
public class ChapterService {
	
	@Autowired
	private ChapterDao chapterDao;
	@Autowired
	private CourseDao courseDao;
	
	/**
	 * 保存章节
	 * @param name
	 * @param courseId
	 * @return
	 */
	public Chapter saveChapter(String name,int courseId)
	{
		Chapter c = new Chapter();
		c.setName(name);
		c.setCourse(courseDao.get(courseId));
		chapterDao.save(c);
		return c;
	}
	
}
