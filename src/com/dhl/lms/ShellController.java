package com.dhl.lms;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.SCPClient;
import ch.ethz.ssh2.Session;

import com.dhl.domain.RestShell;
import com.dhl.domain.UCEnvironment;
import com.dhl.domain.User;
import com.dhl.domain.UserTrain;
import com.dhl.service.UCEService;
import com.dhl.service.UserTrainService;
import com.dhl.util.UtilTools;
import com.dhl.web.BaseController;

/**
 * 实验提交检测control
 * 
 * @see
 * @since
 */
@Controller
@RequestMapping("/lms")
public class ShellController extends BaseController {
	@Autowired
	private UserTrainService userTrainService;
	// @Autowired
	// private UserCourseService userCourseService;
	@Autowired
	private UCEService uceService;
	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping("/myshell")
	public void myshell(HttpServletRequest request,
			HttpServletResponse response, int courseId, int trainId,
			String name, String path) {
		try {
			String rp = request.getSession().getServletContext()
					.getRealPath("/");
			PrintWriter out = response.getWriter();
			User user = getSessionUser(request);
//			if (user == null) {
//				String str = "{'user':'nouser','msg':'用户还没有登陆'}";
//
//				out.write(str);
//			} else {

				System.out.println("path ---------- " + path);
				//
				//远程上传文件传递
				String restid = UtilTools.getConfig().getProperty("RESTHOST_ID");
				String restusername = UtilTools.getConfig().getProperty("RESTHOST_USERNAME");
				String restpassword = UtilTools.getConfig().getProperty("RESTHOST_PASSWORD");
				Connection conn = UtilTools.getConnection(restid, restusername, restpassword);
				System.out.println("shell-------------------------22222222222"+path);
				if (conn != null) {
//					Session ssh = conn.openSession();
					SCPClient scpClient = conn.createSCPClient();
					scpClient.put(rp + path, "/tmp", "0755");
				}
				// ----------shell start--------------
				UCEnvironment uce = uceService.getMyUCE(user.getId(), courseId,
						name);
				if (uce != null)
				{
					String ip = uce.getHostname();
					String userName = uce.getUsername();
					String passWord = uce.getPassword();
					
					RestShell rs = new RestShell();
					rs.setIp(ip);
					rs.setUserName(userName);
					rs.setPassWord(passWord);
					rs.setPath(path);
					HttpEntity<RestShell> entity = new HttpEntity<RestShell>(rs);
					
					String resturl = UtilTools.getConfig().getProperty("REST_URL");
					ResponseEntity<RestShell> res = restTemplate.postForEntity(resturl, 
							entity, RestShell.class);
					
					RestShell e = res.getBody();
					
					String rdata = e.getCondition();
					String result = e.getResult();
					result = UtilTools.replaceBr(result);
					UserTrain userTrain = userTrainService.getUserTrain(
							user.getId(), courseId, trainId);
					if (userTrain == null) {
						UserTrain ut = new UserTrain();
						ut.setCounts(1);
						ut.setResult(result);
						ut.setRevalue(rdata);
						ut.setCourseId(courseId);
						ut.setUserId(user.getId());
						ut.setTrainId(trainId);
						// ut.setVerticalId(verticalId);
						userTrainService.save(ut);
					} else {
						userTrain.setCounts(userTrain.getCounts() + 1);
						userTrain.setResult(result);
						userTrain.setRevalue(rdata);
						userTrainService.update(userTrain);
					}

					String str = "{'sucess':'sucess','result':'" + result + "','revalue':'"
							+ rdata + "'}";

					out.write(str);
				}
				else
				{
					String str = "{'sucess':'fail','msg':'环境还没有创建'}";

					out.write(str);
				}
				
//				Connection conn = UtilTools.getConnection(ip, userName,
//						passWord);
//				if (conn != null) {

//					Session ssh = conn.openSession();
//					SCPClient scpClient = conn.createSCPClient();
//					scpClient.put(rp + path, "/tmp", "0755");
//
//					String[] strs = path.split("/");
//					String commandsrc = "cd /tmp;./" + strs[strs.length - 1]
//							+ " &";
//					ssh.execCommand(commandsrc);
//
//					String tmp = "";
//					InputStream is = new StreamGobbler(ssh.getStdout());
//					BufferedReader brs = new BufferedReader(
//							new InputStreamReader(is));
//					while (true) {
//						String line = brs.readLine();
//						if (line == null) {
//							break;
//						}
//						tmp += line + "</br>";
//					}
//					String[] tmpstr = tmp.split("&&&&&&");
//					String rdata = tmpstr[0];
//					String result = tmpstr[1];
//
//					ssh.close();
//					conn.close();
					// ----------shell end----------------

					
//				}

//			}
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e1) {
				e1.printStackTrace();
			} finally {
				String str = "{'user':'error','msg':'服务器有异常，请联系管理员'}";
				if (out != null)
					out.write(str);
			}
		}
	}

}
