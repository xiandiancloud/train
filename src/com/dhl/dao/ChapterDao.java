package com.dhl.dao;
import org.springframework.stereotype.Repository;

import com.dhl.domain.Chapter;

@Repository
public class ChapterDao extends BaseDao<Chapter> {
	
	public void removeChapterByCourseId(int courseId)
	{
		String hql = "delete from Chapter where courseId = "+courseId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
