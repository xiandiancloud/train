package com.dhl.web;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.domain.Chapter;
import com.dhl.domain.Course;
import com.dhl.domain.Sequential;
import com.dhl.domain.Vertical;
import com.dhl.service.ChapterService;
import com.dhl.service.CourseService;
import com.dhl.service.SequentialService;
import com.dhl.service.TrainService;
import com.dhl.service.VerticalService;
import com.dhl.util.ParseXml;

/**
 * 
 * @see
 * @since
 */
@Controller
public class UploadCourseController extends BaseController {
	// 课程
	@Autowired
	private CourseService courseService;
	// 章节
	@Autowired
	private ChapterService chapterService;
	// 章节
	@Autowired
	private SequentialService sequentialService;
	// 小节
	@Autowired
	private VerticalService verticalService;
	@Autowired
	private TrainService trainService;

	@RequestMapping("/uploadCourse")
	public ModelAndView uploadCourse() {
		// ModelAndView view =new ModelAndView();

		try {
			String file = "D:/course/time.xml";
			Element root = getRoot(file);
			List<Element> list = ParseXml.getChildNode(root);
			int len = list.size();
			for (int i = 0; i < len; i++) {
				String name = list.get(i).getName();
				Map<String, String> mapchild = ParseXml.getNodeAttrName(list
						.get(i));
				String urlname = mapchild.get("url_name");
				String f = getFile("D:/course", name, urlname + ".xml");
				// System.out.println(f);
				Element r = getRoot(f);
				Map<String, String> map = ParseXml.getNodeAttrName(r);
				String f1 = getFile("D:/course/" + name, r.getName(),
						map.get("url_name") + ".xml");
				System.out.println(f1);
				int id = 0;
				useRecursion(f1, name, id);
			}
		} catch (Exception e) {

		}
		String url = "redirect:/getAllCourse.action";
		return new ModelAndView(url);
	}

	// 获取xml文件的根元素
	public boolean isExist(String path) {
		File f = new File(path);
		boolean isexist = false;
		if (f.exists()) {
			isexist = true;
		}
		return isexist;
	}

	public Element getRoot(String path) {
		SAXReader saxReader = new SAXReader();
		File f = new File(path);
		Element root = null;
		try {
			Document document = saxReader.read(f);
			root = document.getRootElement();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return root;
	}

	public static String getFile(String dir1, String dir2, String dir3) {
		String file = null;
		file = String.format(dir1 + "/%s/%s", dir2, dir3);
		return file;
	}

	public void useRecursion(String file,String dir,int number) throws SQLException{
		if(isExist(file)){
			Element root=getRoot(file);
			List<Element> list=ParseXml.getChildNode(root);
			Map<String,String> maproot=ParseXml.getNodeAttrName(root);
			int id=0;
			Course course = null;
			if (root.getName().equals("course")) {
				// Db.insert("insert into t_course values(null,'"
				// + maproot.get("display_name") + "','"
				// + maproot.get("imgpath") + "','" + maproot.get("desc")
				// + "')");
				String name = maproot.get("display_name");
				List<Course> clist = courseService.getCourseByName(name);
				/*if (clist != null && clist.size() > 0) {
					return;
				}*/
				if (clist == null || clist.size() <= 0) {
					course = courseService.saveCourse(name,
							maproot.get("imgpath"), maproot.get("desc"));
					id=course.getId();
				}
			}
			if (root.getName().equals("chapter")) {
				// number = Db.getId("select max(id) from t_course");
				// Db.insert("insert into t_chapter values(null,'"
				// + maproot.get("display_name") + "','" + number + "')");
			//if (course != null) {
					//number = course.getId();
				    //number=1;
					Chapter chapter = chapterService.saveChapter(maproot.get("display_name"), number);
					id=chapter.getId();
			//}
			}
			if (root.getName().equals("sequential")) {
				// number = Db.getId("select max(id) from t_chapter");
				// Db.insert("insert into t_sequential values(null,'"
				// + maproot.get("display_name") + "','" + number + "')");
				
				int chapterId = number;
				Sequential sequence = sequentialService.saveSequential(maproot.get("display_name") , chapterId);
				id=sequence.getId();
			}
			if (root.getName().equals("vertical")) {
				// number = Db.getId("select max(id) from t_sequential");
				// Db.insert("insert into t_vertical values(null,'"
				// + maproot.get("display_name") + ",'" + number + "')");
				// number=Db.getId("select max(id) from t_vertical");
				
				int sequenticalId = number;
				Vertical vertical = verticalService.saveVertical(maproot.get("display_name") , sequenticalId);
				id=vertical.getId();
			}
			if(root.getName().equals("traing")){
				//Db.insert("insert into t_train values(null,'" + maproot.get("display_name")+"'");
				//System.out.println("hello");
				String name=maproot.get("display_name");
				Element con = root.element("content");
				String conContent=con.element("realcontent").getText();
				String conName=con.attributeValue("display_name");
				String conShell = con.element("shell").getText();
				String conanswer = con.element("answer").getText();
				Element pre = root.element("precondition");
				String preContent=pre.element("realcontent").getText();
				String preName=pre.attributeValue("display_name");
				String preShell=pre.element("shell").getText();
				Element gar = root.element("garbage");
				String garContent=gar.element("realcontent").getText();
				String garName=gar.attributeValue("display_name");
				String garShell=gar.element("shell").getText();
				trainService.saveTrain(preName, preName, preContent, preShell, conName, conContent, conShell, conanswer, garName, garContent, garShell);
			}
			else
			{
				int len=list.size();
				for(int i=0;i<len;i++){
					String name=list.get(i).getName();
					Map<String,String> mapchild=ParseXml.getNodeAttrName(list.get(i));
					String urlname=mapchild.get("url_name");
					String f=getFile("D:/course/"+dir,name,urlname+".xml");
					System.out.println(f);
					useRecursion(f,dir,id);
				}
			}
		}
		else
			System.out.println("文件不存在！");
	}}
