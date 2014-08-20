package com.dhl.web;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dhl.cons.CommonConstant;
import com.dhl.dao.Page;
import com.dhl.domain.CourseCategory;
import com.dhl.service.CourseCategoryService;

/**
 * 
 * @see
 * @since
 */
@Controller
public class CourseCategoryController extends BaseController {
	/**
	 * 自动注入
	 */
	@Autowired
	private CourseCategoryService courseCategoryService;

	@RequestMapping("/getCourseByCategoryId")
	public void getCourseByCategoryId(HttpServletRequest request,
			HttpServletResponse response, int categoryId, int pageNo) {
		try {
			Page page = courseCategoryService.getCourseByCategoryId(categoryId,
					pageNo, CommonConstant.SYS_PAGE_SIZE);
			String str = getProjectViewStr(page);
			PrintWriter out = response.getWriter();
			out.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private String getProjectViewStr(Page list) {
		StringBuffer buffer = new StringBuffer();
		long count = list.getTotalPageCount();
		buffer.append("{\"total\":" + count + ",\"rows\":[");
		List<CourseCategory> data = list.getResult();
		Iterator<CourseCategory> it = data.iterator();
		while (it.hasNext()) {
			CourseCategory p = it.next();
			buffer.append("{");
			buffer.append("\"id\":");
			buffer.append("\"" + p.getCourse().getId() + "\"");
			buffer.append(",\"name\":");
			buffer.append("\"" + p.getCourse().getName() + "\"");
			buffer.append(",\"imgpath\":");
			buffer.append("\"" + p.getCourse().getImgpath() + "\"");
			buffer.append(",\"desc\":");
			buffer.append("\"" + p.getCourse().getDescrible() + "\"");
			buffer.append("},");
		}
		if (count > 0) {
			String str = buffer.substring(0, buffer.length() - 1) + "]}";
			str = str.replaceAll("null", "");
			return str;
		} else {
			String str = buffer.toString() + "]}";
			str = str.replaceAll("null", "");
			return str;
		}
	}
}
