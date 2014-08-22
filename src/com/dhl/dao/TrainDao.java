package com.dhl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dhl.domain.Train;

@Repository
public class TrainDao extends BaseDao<Train> {
	public Train getTrainByCodenum(String codenum) {
		String hql = "from Train where codenum = '" + codenum + "'";
		List<Train> list = find(hql);
		if (list.size() == 0) {
			return null;
		} else {

			return list.get(0);
		}
	}
}
