package com.dhl.web;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dhl.domain.Chapter;
import com.dhl.domain.Course;
import com.dhl.domain.RestShell;
import com.dhl.domain.RestTrain;
import com.dhl.domain.Sequential;
import com.dhl.domain.Train;
import com.dhl.domain.Vertical;
import com.dhl.domain.VerticalTrain;
import com.dhl.service.CourseService;

/**
 * 为考试题库的restful
 * @author dhl
 *
 */
@Controller
public class RestForExamController {

	@Autowired
	private CourseService courseService;
	
	/**
	 * 取得实训课程列表
	 * @param request
	 * @param response
	 * @param rshell
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/examtraincourselist", headers = "Accept=application/xml, application/json")
	public @ResponseBody
	RestTrain examtraincourselist(HttpServletRequest request, HttpServletResponse response,@RequestBody RestTrain rshell) {

		List<Course> list = courseService.getAllCourseList();
		String str = "[";
		for (Course c:list)
		{
			str += "{'id':'"+c.getId()+"','name':'"+c.getName()+"'},";
		}
		if (str.length() > 1)
		{
			str = str.substring(0,str.length()-1);
		}
		str += "]";
//		String str = JSONArray.fromObject(list).toString();
		
		RestTrain rt = new RestTrain();
		rt.setCourselist(str);
		return rt;
	}
	
	/**
	 * 取得一个实训课程的组织结构
	 * @param request
	 * @param response
	 * @param rshell
	 * @return
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/examtraincourse", headers = "Accept=application/xml, application/json")
	public @ResponseBody
	RestTrain examtraincourse(HttpServletRequest request, HttpServletResponse response,@RequestBody RestTrain rshell) {

		int courseId = rshell.getCourseId();
		Course course = courseService.get(courseId);
		String name = course.getName();
		String imgpath = course.getImgpath();
		String describle = course.getDescrible();
		int publish = course.getPublish();
		String starttime = course.getStarttime();
		String starttimedetail = course.getStarttimedetail();
		String endtimedetail = course.getEndtimedetail();
		String org = course.getOrg();
		String coursecode = course.getCoursecode();
		String rank = course.getRank();
		String str = "[{'name':'"+name+"','imgpath':'"+imgpath+"','describle':'"+describle+"','publish':'"+publish
				+"','starttime':'"+starttime+"','starttimedetail':'"+starttimedetail+"','endtimedetail':'"+endtimedetail
				+"','org':'"+org+"','coursecode':'"+coursecode+"','rank':'"+rank+"','chapters':";
		
		Set<Chapter> chapterlist = course.getChapters();
		String chapterstr="[";
		for (Chapter c:chapterlist)
		{
			chapterstr += "{'name':'"+c.getName()+"','sequentials':";
			String sequentialstr = "[";
			Set<Sequential> slist = c.getSequentials();
			for (Sequential s:slist)
			{
				sequentialstr += "{'name':'"+s.getName()+"','verticals':";
				
				Set<Vertical> vlist = s.getVerticals();
				String verticalstr= "[";
				for (Vertical v:vlist)
				{
					verticalstr += "{'name':'"+v.getName()+"','trains':";
					
					Set<VerticalTrain> vtlist = v.getVerticalTrains();
					String vtstr= "[";
					for (VerticalTrain vt:vtlist)
					{
						Train t = vt.getTrain();
						String tname = t.getName();
						String codenum = t.getCodenum();
						String envname = t.getEnvname();
						String conContent = t.getConContent();
						String conShell = t.getConShell();
						String conAnswer = t.getConAnswer();
						int score = t.getScore();
						String scoretag = t.getScoretag();
						
						vtstr += "{'name':'"+tname+"','codenum':'"+codenum+"','conContent':'"+conContent
								+"','conShell':'"+conShell+"','conAnswer':'"+conAnswer+"','score':'"+score
								+"','scoretag':'"+scoretag+"','envname':'"+envname+"'},";
					}
					if (vtstr.length() > 1)
					{
						vtstr = vtstr.substring(0,vtstr.length()-1);
					}
					vtstr +="]";
					verticalstr += vtstr+"},";
				}
				if (verticalstr.length() > 1)
				{
					verticalstr = verticalstr.substring(0,verticalstr.length()-1);
				}
				verticalstr +="]";
				sequentialstr += verticalstr+"},";
			}
			if (sequentialstr.length() > 1)
			{
				sequentialstr = sequentialstr.substring(0,sequentialstr.length()-1);
			}
			sequentialstr +="]";
			chapterstr += sequentialstr+"},";
		}
		if (chapterstr.length() > 1)
		{
			chapterstr = chapterstr.substring(0,chapterstr.length()-1);
		}
		chapterstr +="]";
		str += chapterstr+"}]";
//		String str = JSONArray.fromObject(course).toString();
		RestTrain rt = new RestTrain();
		rt.setCourse(str);
		return rt;
	}
	
	@RequestMapping(method=RequestMethod.GET, value="/test", headers="Accept=application/xml, application/json")
	public @ResponseBody RestShell getAllShell() {
		RestShell test = new RestShell();
		test.setCondition("test111");
		test.setResult("test22");
		System.out.println("test-------------------------111");
		return test;
	}
}
