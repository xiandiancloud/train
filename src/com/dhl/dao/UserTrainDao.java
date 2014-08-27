package com.dhl.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.UserTrain;

@Repository
public class UserTrainDao extends BaseDao<UserTrain> {
	
	public UserTrain getUserTrain(int userId,int courseId,int trainId){
		String hql = "from UserTrain where courseId = "+courseId+" and trainId = "+trainId +" and userId = "+userId;
    	List<UserTrain> list = find(hql);
    	if (list.size() == 0) {
			return null;
		}else{
		
			return list.get(0);
		}
    }
	
	public List<UserTrain> getMyCourseTrain(int userId,int courseId)
	{
		String hql = "from UserTrain where courseId = "+courseId +" and userId = "+userId;
    	return find(hql);
	}
	
	public List<UserTrain> getMyFinishCourseTrain(int userId,int courseId)
	{
		String hql = "from UserTrain where courseId = "+courseId +" and userId = "+userId +" and result = 'True'";
    	return find(hql);
	}
	
	/**
	 * 删除课程下的对应的用户信息
	 * @param userId
	 * @param courseId
	 */
	public void delAllMyCourseTrain(int userId,int courseId)
	{
		String hql = "delete UserTrain where courseId = "+courseId +" and userId = "+userId;
    	createQuery(hql).executeUpdate();
	}
	
	/**
	 * 删除课程下的所有用户信息
	 * @param courseId
	 */
	public void removeUTByCourseId(int courseId)
	{
		String hql = "delete from UserTrain where courseId = "+courseId;
		this.getSession().createQuery(hql).executeUpdate();
	}
}
