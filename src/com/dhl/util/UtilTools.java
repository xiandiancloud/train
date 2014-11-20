package com.dhl.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.apache.commons.compress.archivers.tar.TarArchiveOutputStream;
import org.apache.commons.compress.utils.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.tools.tar.TarEntry;
import org.apache.tools.tar.TarInputStream;
import org.apache.tools.tar.TarOutputStream;

import ch.ethz.ssh2.Connection;

import com.woorea.openstack.base.client.OpenStackSimpleTokenProvider;
import com.woorea.openstack.keystone.Keystone;
import com.woorea.openstack.keystone.model.Access;
import com.woorea.openstack.keystone.model.authentication.UsernamePassword;
import com.woorea.openstack.nova.Nova;
import com.woorea.openstack.nova.api.ServersResource;
import com.woorea.openstack.nova.model.Image;
import com.woorea.openstack.nova.model.Images;
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

	public static String replaceBr(String str) {
		str = str.replaceAll("</br>", "");
		return str;
	}

	public static String replaceBackett(String str)
	{
		str = str.replaceAll("\'","\\\\\'");  
		str = str.replaceAll("\"","\\\\\"");  
		return str;
	}
	
//	public static String[] createServer(String serverName) {
//		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
//		Access access = keystone
//				.tokens()
//				.authenticate(
//						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
//								Configuration.KEYSTONE_PASSWORD))
//				.withTenantName("admin").execute();
//
//		keystone.token(access.getToken().getId());
//
//		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
//				access.getToken().getTenant().getId()));
//		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
//				.getToken().getId()));
//
//		// KeyPairs keysPairs = nova.keyPairs().list().execute();
//		//
//		 Images images = nova.images().list(true).execute();
//		List<Image> imagelist =  images.getList();
//		String id = null;
//		for (Image image:imagelist)
//		{
//			String name = image.getName();
//			if ("CentOS-6.5-x86_64".equals(name))
//			{
//				id = image.getId();
//			}
//		}
//		if (id == null)
//		{
//			return null;
//		}
//		//
//		// Flavors flavors = nova.flavors().list(true).execute();
//		ServerForCreate serverForCreate = new ServerForCreate();
//		serverForCreate.setName(serverName);
//		serverForCreate.setFlavorRef("2");
//		serverForCreate.setImageRef(id);
//		serverForCreate.setKeyName("hello_key");
//		serverForCreate.getSecurityGroups().add(
//				new ServerForCreate.SecurityGroup("default"));
//
//		Server server = nova.servers().boot(serverForCreate).execute();
//		String[] strs = new String[4];
//		String ip = null;
//		boolean flag = true;
//		while (flag) {
//			// System.out.println("status ------- "+server.getStatus()+"    ,   "+server.getTaskState()+"   ,   "+server.getAddresses()+"   ,  "+getServerIP(server.getId()));
//			try {
//				ip = getServerIP(server.getId());
//				if (ip != null) {
//					flag = false;
//				}
//				Thread.sleep(1000);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
//		}
//		strs[0] = ip;
//		strs[1] = "root";
//		strs[2] = "000000";
//		strs[3] = server.getId();
//		return strs;
//	}

//	public static void getServer(String serverId) {
//		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
//		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
//		Access access = keystone
//				.tokens()
//				.authenticate(
//						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
//								Configuration.KEYSTONE_PASSWORD))
//				.withTenantName("admin").execute();
//
//		keystone.token(access.getToken().getId());
//
//		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
//				access.getToken().getTenant().getId()));
//		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
//				.getToken().getId()));
//
//		Servers servers = nova.servers().list(true).execute();
//		for (Server server : servers) {
//			if (server != null && server.getId().equals(serverId)) {
//				if (server.getAddresses() == null) {
//				}
//				Map<String, List<Address>> address = server.getAddresses()
//						.getAddresses();
//				// for(String dataKey : address.keySet()) {
//				// System.out.println(dataKey );
//				// }
//				List<Address> alist = address.get("flatnet");
//				if (alist == null) {
//				}
//				if (alist.size() > 0) {
//					String ip = alist.get(0).getAddr();
//					System.out.println("getserver ip----------------------"
//							+ ip);
//				}
//
//				// for(Map.Entry<String, List<Address>> entry:
//				// address.entrySet()) {
//				// System.out.print(entry.getKey() + ":" + entry.getValue() +
//				// "\t");
//				// }
//				// address.getAddresses()
//
//			}
//		}
//	}

//	public static String getServerIP(String serverId) {
//		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
//		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
//		Access access = keystone
//				.tokens()
//				.authenticate(
//						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
//								Configuration.KEYSTONE_PASSWORD))
//				.withTenantName("admin").execute();
//
//		keystone.token(access.getToken().getId());
//
//		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
//				access.getToken().getTenant().getId()));
//		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
//				.getToken().getId()));
//
//		Servers servers = nova.servers().list(true).execute();
//		for (Server server : servers) {
//			if (server != null && server.getId().equals(serverId)) {
//				if (server.getAddresses() == null) {
//					return null;
//				}
//				Map<String, List<Address>> address = server.getAddresses()
//						.getAddresses();
//				// for(String dataKey : address.keySet()) {
//				// System.out.println(dataKey );
//				// }
//				List<Address> alist = address.get("flatnet");
//				if (alist == null) {
//					return null;
//				}
//				if (alist.size() > 0) {
//					String ip = alist.get(0).getAddr();
//					System.out.println("getserver ip----------------------"
//							+ ip);
//					return ip;
//				}
//				// for(Map.Entry<String, List<Address>> entry:
//				// address.entrySet()) {
//				// System.out.print(entry.getKey() + ":" + entry.getValue() +
//				// "\t");
//				// }
//				// address.getAddresses()
//
//			}
//		}
//		return null;
//	}

//	public static void startServer(String serverId) {
//		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
//		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
//		Access access = keystone
//				.tokens()
//				.authenticate(
//						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
//								Configuration.KEYSTONE_PASSWORD))
//				.withTenantName("admin").execute();
//
//		keystone.token(access.getToken().getId());
//
//		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
//				access.getToken().getTenant().getId()));
//		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
//				.getToken().getId()));
//
//		ServersResource.StartServer startServer = nova.servers()
//				.start(serverId);
//		startServer.endpoint(Configuration.NOVA_ENDPOINT);
//		startServer.execute();
//		System.out.println("start finish----------------------");
//	}

//	public static void stopServer(String serverId) {
//		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
//		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
//		Access access = keystone
//				.tokens()
//				.authenticate(
//						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
//								Configuration.KEYSTONE_PASSWORD))
//				.withTenantName("admin").execute();
//
//		keystone.token(access.getToken().getId());
//
//		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
//				access.getToken().getTenant().getId()));
//		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
//				.getToken().getId()));
//
//		ServersResource.StopServer stopServer = nova.servers().stop(serverId);
//		stopServer.endpoint(Configuration.NOVA_ENDPOINT);
//		stopServer.execute();
//	}

//	public static void delServer(String serverId) {
//		// 9b087620-aa6f-4d55-abc4-0307eb6a9826
//		Keystone keystone = new Keystone(Configuration.KEYSTONE_AUTH_URL);
//		Access access = keystone
//				.tokens()
//				.authenticate(
//						new UsernamePassword(Configuration.KEYSTONE_USERNAME,
//								Configuration.KEYSTONE_PASSWORD))
//				.withTenantName("admin").execute();
//
//		keystone.token(access.getToken().getId());
//
//		Nova nova = new Nova(Configuration.NOVA_ENDPOINT.concat("/").concat(
//				access.getToken().getTenant().getId()));
//		nova.setTokenProvider(new OpenStackSimpleTokenProvider(access
//				.getToken().getId()));
//
//		ServersResource.Delete startServer = nova.servers().delete(serverId);
//		startServer.endpoint(Configuration.NOVA_ENDPOINT);
//		startServer.execute();
//		System.out.println("del finish----------------------");
//	}

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

	/**
	 * 删除某个文件夹下的所有文件夹和文件
	 * 
	 * @param delpath
	 *            String
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @return boolean
	 */
	public static boolean deletefile(String delpath) throws Exception {
		try {

			File file = new File(delpath);
			// 当且仅当此抽象路径名表示的文件存在且 是一个目录时，返回 true
			if (!file.isDirectory()) {
				file.delete();
			} else if (file.isDirectory()) {
				String[] filelist = file.list();
				for (int i = 0; i < filelist.length; i++) {
					File delfile = new File(delpath + "\\" + filelist[i]);
					if (!delfile.isDirectory()) {
						delfile.delete();
					} else if (delfile.isDirectory()) {
						deletefile(delpath + "\\" + filelist[i]);
					}
				}
				file.delete();
			}

		} catch (FileNotFoundException e) {
		}
		return true;
	}

	/**
	 * 
	 * @Title: pack
	 * @Description: 将一组文件打成tar包
	 * @param sources
	 *            要打包的原文件数组
	 * @param target
	 *            打包后的文件
	 * @return File 返回打包后的文件
	 * @throws
	 */
	public static File pack(File[] sources, File target) {
		FileOutputStream out = null;
		try {
			out = new FileOutputStream(target);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		TarArchiveOutputStream os = new TarArchiveOutputStream(out);
		for (File file : sources) {
			try {
				os.putArchiveEntry(new TarArchiveEntry(file));
				IOUtils.copy(new FileInputStream(file), os);
				os.closeArchiveEntry();

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (os != null) {
			try {
				os.flush();
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return target;
	}

	/**
	 * 
	 * @Title: compress
	 * @Description: 将文件用gzip压缩
	 * @param source
	 *            需要压缩的文件
	 * @return File 返回压缩后的文件
	 * @throws
	 */
	public static File compress(File source) {
		File target = new File(source.getName() + ".gz");
		FileInputStream in = null;
		GZIPOutputStream out = null;
		try {
			in = new FileInputStream(source);
			out = new GZIPOutputStream(new FileOutputStream(target));
			byte[] array = new byte[1024];
			int number = -1;
			while ((number = in.read(array, 0, array.length)) != -1) {
				out.write(array, 0, number);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
					return null;
				}
			}

			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
					return null;
				}
			}
		}
		return target;
	}

	// 不能对每层都包含文件和目录的多层次目录结构打包
	public static void CompressedFiles_Gzip(String folderPath,
			String targzipFilePath) {
		File srcPath = new File(folderPath);
		int length = srcPath.listFiles().length;
		byte[] buf = new byte[1024]; // 设定读入缓冲区尺寸
		File[] files = srcPath.listFiles();
		try {
			// 建立压缩文件输出流
			FileOutputStream fout = new FileOutputStream(targzipFilePath);
			// 建立tar压缩输出流
			TarOutputStream tout = new TarOutputStream(fout);
			for (int i = 0; i < length; i++) {
				String filename = srcPath.getPath() + File.separator
						+ files[i].getName();
				// 打开需压缩文件作为文件输入流
				FileInputStream fin = new FileInputStream(filename); // filename是文件全路径
				TarEntry tarEn = new TarEntry(files[i]); // 此处必须使用new
															// TarEntry(File
															// file);
				// tarEn.setName(files[i].getName());
				// //此处需重置名称，默认是带全路径的，否则打包后会带全路径
				tout.putNextEntry(tarEn);
				int num;
				while ((num = fin.read(buf)) != -1) {
					tout.write(buf, 0, num);
				}
				tout.closeEntry();
				fin.close();
			}

			tout.close();
			fout.close();

			// 建立压缩文件输出流
			FileOutputStream gzFile = new FileOutputStream(targzipFilePath
					+ ".gz");
			// 建立gzip压缩输出流
			GZIPOutputStream gzout = new GZIPOutputStream(gzFile);
			// 打开需压缩文件作为文件输入流
			FileInputStream tarin = new FileInputStream(targzipFilePath); // targzipFilePath是文件全路径
			int len;
			while ((len = tarin.read(buf)) != -1) {
				gzout.write(buf, 0, len);
			}
			gzout.close();
			gzFile.close();
			tarin.close();
		} catch (FileNotFoundException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
	}

	// 循环遍历目录结构中的文件并添加至tar的输出流
	public static void addFiles(String rootPath, TarOutputStream tout,
			String folderPath) {
		File srcPath = new File(rootPath + folderPath);
		int length = srcPath.listFiles().length;
		byte[] buf = new byte[1024]; // 设定读入缓冲区尺寸
		File[] files = srcPath.listFiles();
		try {
			for (int i = 0; i < length; i++) {
				if (files[i].isFile()) {
					System.out.println("file:" + files[i].getName());
					String filename = srcPath.getPath() + File.separator
							+ files[i].getName();
					// 打开需压缩文件作为文件输入流
					FileInputStream fin = new FileInputStream(filename); // filename是文件全路径
					TarEntry tarEn = new TarEntry(files[i]); // 此处必须使用new
																// TarEntry(File
																// file);
					tarEn.setName(folderPath + File.separator
							+ files[i].getName()); // 此处需重置名称，默认是带全路径的，否则打包后会带全路径
					tout.putNextEntry(tarEn);
					int num;
					while ((num = fin.read(buf)) != -1) {
						tout.write(buf, 0, num);
					}
					tout.closeEntry();
					fin.close();
				} else {
					System.out.println(files[i].getPath());
					addFiles(rootPath, tout, folderPath + File.separator
							+ files[i].getName());
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}

	}

	// 生成tar并压缩成tar.gz
	public static void WriteToTarGzip(String rootPath, String folderPath,
			String targzipFilePath) {
		byte[] buf = new byte[1024]; // 设定读入缓冲区尺寸
		try {
			targzipFilePath = rootPath + targzipFilePath;
			// 建立压缩文件输出流
			FileOutputStream fout = new FileOutputStream(targzipFilePath);
			// 建立tar压缩输出流
			TarOutputStream tout = new TarOutputStream(fout);
			addFiles(rootPath, tout, folderPath);
			tout.close();
			fout.close();

			// 建立压缩文件输出流
			FileOutputStream gzFile = new FileOutputStream(targzipFilePath
					+ ".gz");
			// 建立gzip压缩输出流
			GZIPOutputStream gzout = new GZIPOutputStream(gzFile);
			// 打开需压缩文件作为文件输入流
			FileInputStream tarin = new FileInputStream(targzipFilePath); // targzipFilePath是文件全路径
			int len;
			while ((len = tarin.read(buf)) != -1) {
				gzout.write(buf, 0, len);
			}
			gzout.close();
			gzFile.close();
			tarin.close();

		} catch (FileNotFoundException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}

		File tarfile = new File(targzipFilePath);
		tarfile.delete();
	}

	public static void createDirectory(String outputDir, String subDir) {

		File file = new File(outputDir);

		if (!(subDir == null || subDir.trim().equals(""))) {// 子目录不为空

			file = new File(outputDir + "/" + subDir);
		}

		if (!file.exists()) {

			file.mkdirs();
		}

	}

	public static boolean delAllFile(String path) {
		boolean flag = false;
		File file = new File(path);
		if (!file.exists()) {
			return flag;
		}
		if (!file.isDirectory()) {
			return flag;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件
				delFolder(path + "/" + tempList[i]);// 再删除空文件夹
				flag = true;
			}
		}
		return flag;
	}

	public static void delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // 删除完里面所有内容
			String filePath = folderPath;
			filePath = filePath.toString();
			java.io.File myFilePath = new java.io.File(filePath);
			myFilePath.delete(); // 删除空文件夹
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void unTarGz(File file, String outputDir) throws IOException {

		TarInputStream tarIn = null;

		try {

			tarIn = new TarInputStream(new GZIPInputStream(
					new BufferedInputStream(new FileInputStream(file))),
					1024 * 2);

			createDirectory(outputDir, null);// 创建输出目录

			TarEntry entry = null;

			while ((entry = tarIn.getNextEntry()) != null) {

				if (entry.isDirectory()) {// 是目录

					createDirectory(outputDir, entry.getName());// 创建空目录

				} else {// 是文件

					File tmpFile = new File(outputDir + "/" + entry.getName());

					createDirectory(tmpFile.getParent() + "/", null);// 创建输出目录

					OutputStream out = null;

					try {

						out = new FileOutputStream(tmpFile);

						int length = 0;

						byte[] b = new byte[2048];

						while ((length = tarIn.read(b)) != -1) {
							out.write(b, 0, length);
						}

					} catch (IOException ex) {
						throw ex;
					} finally {

						if (out != null)
							out.close();
					}

				}
			}

		} catch (IOException ex) {
			throw new IOException("解压归档文件出现异常", ex);
		} finally {
			try {
				if (tarIn != null) {
					tarIn.close();
				}
			} catch (IOException ex) {
				throw new IOException("关闭tarFile出现异常", ex);
			}
		}

	}

	/**
	 * 复制单个文件
	 * 
	 * @param oldPath
	 *            String 原文件路径 如：c:/fqf.txt
	 * @param newPath
	 *            String 复制后路径 如：f:/fqf.txt
	 * @return boolean
	 */
	public static void copyFile(String oldPath, String newPath) {
		try {
			int bytesum = 0;
			int byteread = 0;
			File oldfile = new File(oldPath);
			if (oldfile.exists()) { // 文件存在时
				InputStream inStream = new FileInputStream(oldPath); // 读入原文件
				FileOutputStream fs = new FileOutputStream(newPath);
				byte[] buffer = new byte[1444];
				// int length;
				while ((byteread = inStream.read(buffer)) != -1) {
					bytesum += byteread; // 字节数 文件大小
					fs.write(buffer, 0, byteread);
				}
				inStream.close();
				fs.close();
			}
		} catch (Exception e) {
			System.out.println("复制单个文件操作出错");
			e.printStackTrace();

		}

	}
}
