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
	 * 保存章节
	 * 
	 * @param name
	 * @param courseId
	 * @return
	 */
	public Train saveTrain(String name, String preName, String preContent,
			String preShell,String conName,String conContent,String conShell,String conanswer,String garName,String garContent,String garShell) {
		Train c = new Train();
		c.setName(name);
		c.setPreName(preName);
//		c.setPreContent(preContent);
//		c.setPreShell(preShell);
		c.setConName(conName);
		c.setConContent(conContent);
		c.setConShell(conShell);
		c.setConAnswer(conanswer);
//		c.setGarName(garName);
//		c.setGarContent(garContent);
//		c.setGarShell(garShell);
		return c;
	}

}
