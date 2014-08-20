package com.dhl.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.lang.StringUtils;

import ch.ethz.ssh2.Connection;

import com.woorea.openstack.base.client.OpenStackSimpleTokenProvider;
import com.woorea.openstack.keystone.Keystone;
import com.woorea.openstack.keystone.model.Access;
import com.woorea.openstack.keystone.model.authentication.UsernamePassword;
import com.woorea.openstack.nova.Nova;
import com.woorea.openstack.nova.api.ServersResource;
import com.woorea.openstack.nova.model.Server;
import com.woorea.openstack.nova.model.Server.Addresses.Address;
import com.woorea.openstack.nova.model.ServerForCreate;
import com.woorea.openstack.nova.model.Servers;

public class UtilTools {

	public static String COFING_FILE = "/config/dhl.properties";
	public static Properties p;

	public static Properties getConfig() {
		if (p == null) {
			p = new Properties();
			try {
				p.load(Thread.currentThread().getContextClassLoader()
						.getResourceAsStream(COFING_FILE));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return p;
	}

	/**
	 * 默认是utf-8编码
	 * 
	 * @param str
	 * @return
	 */
	public static String converStr(String str) {
		return converStr(str, "UTF-8");
	}

	/**
	 * 
	 * @param str
	 * @param encode
	 * @return
	 */
	public static String converStr(String str, String encode) {
		if (str == null || str.equals("null")) {
			return "";
		}
		try {
			byte[] tmpbyte = str.getBytes("ISO8859_1");
			if (encode != null) {
				// 如果指定编码方式
				str = new String(tmpbyte, encode);
			} else {
				// 用系统默认的编码
				str = new String(tmpbyte);
			}
			return str;
		} catch (Exception e) {
		}
		return str;
	}

	public static String encodingFileName(String fileName) {
		String returnFileName = "";
		try {
			returnFileName = URLEncoder.encode(fileName, "UTF-8");
			returnFileName = StringUtils.replace(returnFileName, "+", "%20");
			if (returnFileName.length() > 150) {
				returnFileName = new String(fileName.getBytes("GB2312"),
						"ISO8859-1");
				returnFileName = StringUtils
						.replace(returnFileName, " ", "%20");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();

		}
		return returnFileName;
	}

	public static String timeTostr(Date date) {
		String strDate = "";
		if (date != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			strDate = format.format(date);
		}
		return strDate;
	}

	public static String timeToyear(Date date) {
		String strDate = "";
		if (date != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy");
			strDate = format.format(date);
		}
		return strDate;
	}

	public static String timeTostrHMS(Date date) {
		String strDate = "";
		if (date != null) {
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			strDate = format.format(date);
		}
		return strDate;
	}

	// public static String timeTostrNoHMS(Date date){
	// String strDate="";
	// if(date!=null){
	// SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	// strDate=format.format(date);
	// }
	// return strDate;
	// }
	//
	// public static String timeTostrNoHMS2(Date date){
	// String strDate="";
	// if(date!=null){
	// SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
	// strDate=format.format(date);
	// }
	// return strDate;
	// }
	//
	// public static Date strTodate(String str)
	// {
	// SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	// Date d = null;
	// try {
	// d = format.parse(str);
	// } catch (ParseException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// return d;
	// }
	//
	// public static Date strTodateShort(String str)
	// {
	// SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
	// Date d = null;
	// try {
	// d = format.parse(str);
	// } catch (ParseException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// return d;
	// }
	//
	//
	// public static int compare(Date firstDate,Date secondDate)
	// {
	// Calendar firstCalendar = null;
	// if (firstDate != null)
	// {
	// firstCalendar = Calendar.getInstance();
	// firstCalendar.setTime(firstDate);
	// }
	//
	// Calendar secondCalendar = null;
	// if (secondDate != null)
	// {
	// secondCalendar = Calendar.getInstance();
	// secondCalendar.setTime(secondDate);
	// }
	// return firstCalendar.compareTo(secondCalendar);
	// }

	public static String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}

	public static String replaceStr(String str) {
		str = str.replaceAll("<br>", "\r\n");
		// String s = "\n   iii \n 44\r4";
		// String reg ="[\n-\r]";
		// Pattern p = Pattern.compile(reg);
		// Matcher m = p.matcher(s);
		// String beizhu = m.replaceAll("");
		return str;
	}

    public static String replaceBr(String str)
    {
    	str = str.replaceAll("</br>", "");
    	return str;
    }
    
	public static String[] createServer(String serverName) {
		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
		Access access = keystone
				.tokens()
				.authenticate(
						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
								Configuration.KEYSTONE_PASSWORD))
				.withTenantName("admin").execute();

		keystone.token(access.getToken().getId());

		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
				access.getToken().getTenant().getId()));
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		// KeyPairs keysPairs = nova.keyPairs().list().execute();
		//
		// Images images = nova.images().list(true).execute();
		//
		// Flavors flavors = nova.flavors().list(true).execute();

		ServerForCreate serverForCreate = new ServerForCreate();
		serverForCreate.setName(serverName);
		serverForCreate.setFlavorRef("2");
		serverForCreate.setImageRef("c2de2f09-84e5-41a8-838b-ace493b8a639");
		serverForCreate.setKeyName("hello_key");
		serverForCreate.getSecurityGroups().add(
				new ServerForCreate.SecurityGroup("default"));

		Server server = nova.servers().boot(serverForCreate).execute();
		String[] strs = new String[4];
		String ip = null;
		boolean flag = true;
		while (flag) {
			// System.out.println("status ------- "+server.getStatus()+"    ,   "+server.getTaskState()+"   ,   "+server.getAddresses()+"   ,  "+getServerIP(server.getId()));
			try {
				ip = getServerIP(server.getId());
				if (ip != null) {
					flag = false;
				}
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		strs[0] = ip;
		strs[1] = "root";
		strs[2] = "000000";
		strs[3] = server.getId();
		return strs;
		// String[] strs = new String[4];

		// Map<String,List<Address>> address =
		// server.getAddresses().getAddresses();
		// List<Address> alist = address.get("flatnet");
		// if (alist.size() > 0)
		// {
		// String ip = alist.get(0).getAddr();
		// strs[0] = ip;
		// }
		// else
		// {
		// strs[0] = "";
		// }
		// strs[0] = getServerIP(server.getId());
		// strs[1] = "root";
		// strs[2] = "123456";
		// strs[3] = server.getId();
		// return strs;
	}

	public static void getServer(String serverId) {
		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
		Access access = keystone
				.tokens()
				.authenticate(
						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
								Configuration.KEYSTONE_PASSWORD))
				.withTenantName("admin").execute();

		keystone.token(access.getToken().getId());

		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
				access.getToken().getTenant().getId()));
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		Servers servers = nova.servers().list(true).execute();
		for (Server server : servers) {
			if (server != null && server.getId().equals(serverId)) {
				if (server.getAddresses() == null) {
				}
				Map<String, List<Address>> address = server.getAddresses()
						.getAddresses();
				// for(String dataKey : address.keySet()) {
				// System.out.println(dataKey );
				// }
				List<Address> alist = address.get("flatnet");
				if (alist == null) {
				}
				if (alist.size() > 0) {
					String ip = alist.get(0).getAddr();
					System.out.println("getserver ip----------------------"
							+ ip);
				}

				// for(Map.Entry<String, List<Address>> entry:
				// address.entrySet()) {
				// System.out.print(entry.getKey() + ":" + entry.getValue() +
				// "\t");
				// }
				// address.getAddresses()

			}
		}
	}

	public static String getServerIP(String serverId) {
		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
		Access access = keystone
				.tokens()
				.authenticate(
						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
								Configuration.KEYSTONE_PASSWORD))
				.withTenantName("admin").execute();

		keystone.token(access.getToken().getId());

		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
				access.getToken().getTenant().getId()));
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		Servers servers = nova.servers().list(true).execute();
		for (Server server : servers) {
			if (server != null && server.getId().equals(serverId)) {
				if (server.getAddresses() == null) {
					return null;
				}
				Map<String, List<Address>> address = server.getAddresses()
						.getAddresses();
				// for(String dataKey : address.keySet()) {
				// System.out.println(dataKey );
				// }
				List<Address> alist = address.get("flatnet");
				if (alist == null) {
					return null;
				}
				if (alist.size() > 0) {
					String ip = alist.get(0).getAddr();
					System.out.println("getserver ip----------------------"
							+ ip);
					return ip;
				}
				// for(Map.Entry<String, List<Address>> entry:
				// address.entrySet()) {
				// System.out.print(entry.getKey() + ":" + entry.getValue() +
				// "\t");
				// }
				// address.getAddresses()

			}
		}
		return null;
	}

	public static void startServer(String serverId) {
		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
		Access access = keystone
				.tokens()
				.authenticate(
						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
								Configuration.KEYSTONE_PASSWORD))
				.withTenantName("admin").execute();

		keystone.token(access.getToken().getId());

		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
				access.getToken().getTenant().getId()));
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		ServersResource.StartServer startServer = nova.servers()
				.start(serverId);
		startServer.endpoint(Configuration.NOVA_ENDPOINT);
		startServer.execute();
		System.out.println("start finish----------------------");
	}

	public static void stopServer(String serverId) {
		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
		Access access = keystone
				.tokens()
				.authenticate(
						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
								Configuration.KEYSTONE_PASSWORD))
				.withTenantName("admin").execute();

		keystone.token(access.getToken().getId());

		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
				access.getToken().getTenant().getId()));
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		ServersResource.StopServer stopServer = nova.servers().stop(serverId);
		stopServer.endpoint(Configuration.NOVA_ENDPOINT);
		stopServer.execute();
	}

	public static void delServer(String serverId) {
		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
		Access access = keystone
				.tokens()
				.authenticate(
						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
								Configuration.KEYSTONE_PASSWORD))
				.withTenantName("admin").execute();

		keystone.token(access.getToken().getId());

		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
				access.getToken().getTenant().getId()));
		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
				.getToken().getId()));

		ServersResource.Delete startServer = nova.servers().delete(serverId);
		startServer.endpoint(Configuration.NOVA_ENDPOINT);
		startServer.execute();
		System.out.println("del finish----------------------");
	}

	public static Connection getConnection(String hostname, String username,
			String password) {
		Connection conn = new Connection(hostname);
		try {
			// 连接到主机
			conn.connect();
			// 使用用户名和密码校验
			boolean isconn = conn.authenticateWithPassword(username, password);
			if (!isconn) {
				System.out.println("用户名称或者是密码不正确");
				return null;
			} else {
				System.out.println("已经连接OK");
				return conn;
			}

		} catch (IOException e) {
			return null;
		}
	}

	public static boolean login(String ip, String usr, String psword)
			throws IOException {
		Connection conn = new Connection(ip);
		conn.connect();
		return conn.authenticateWithPassword(usr, psword);
	}

}
