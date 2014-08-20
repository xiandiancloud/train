package com.dhl.util;


public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
//		UtilTools.createServer();
		
//		UtilTools.stopServer("9b087620-aa6f-4d55-abc4-0307eb6a9826");
		
//		UtilTools.startServer("9b087620-aa6f-4d55-abc4-0307eb6a9826");
		
//		UtilTools.getServer("d9fcc80d-c639-42cd-b449-3f30c2600300");
		
		UtilTools.delServer("d9fcc80d-c639-42cd-b449-3f30c2600300");
		
//		 String hostname = "192.168.1.110";  
//	        String username = "dhl";  
//	        String password = "123456";  
//	        //指明连接主机的IP地址  
//	        Connection conn = new Connection(hostname);  
//	        Session ssh = null;  
//	        try {  
//	            //连接到主机  
//	            conn.connect();  
//	            //使用用户名和密码校验  
//	            boolean isconn = conn.authenticateWithPassword(username, password);  
//	            if(!isconn){  
//	                System.out.println("用户名称或者是密码不正确");  
//	            }else{  
//	                System.out.println("已经连接OK");  
//	                ssh = conn.openSession();  
//	                
//	                SCPClient scpClient = conn.createSCPClient(); 
//		            scpClient.put("D:/aaa.sh","/home/dhl/work","0755"); 
//		            
//	                //使用多个命令用分号隔开  
////	              ssh.execCommand("pwd;cd /tmp;mkdir hb;ls;ps -ef|grep weblogic");  
//	                ssh.execCommand("cd /home/dhl/work;./aaa.sh &");  
//	                //只允许使用一行命令，即ssh对象只能使用一次execCommand这个方法，多次使用则会出现异常  
////	               ssh.execCommand("mkdir hb");  
//	                //将屏幕上的文字全部打印出来  
//	                String rdata = "";
//					String result = "";
//	                InputStream  is = new StreamGobbler(ssh.getStdout());  
//	                BufferedReader brs = new BufferedReader(new InputStreamReader(is));  
//	                while(true){  
//	                    String line = brs.readLine();  
//	                    if(line==null){  
//	                        break;  
//	                    }  
//	                    rdata+=line;
//	                    
//	                    System.out.println("------------------- "+line);  
//	                }  
//	                System.out.println("----------rdata--------- "+rdata);  
//	                String[] strs = rdata.split("&&&&&&");
//	                System.out.println("----------111--------- "+strs[0]);  
//	                System.out.println("----------111--------- "+strs[1]);  
//	            }  
//	           
//	            //连接的Session和Connection对象都需要关闭  
//	            ssh.close();  
//	            conn.close();  
//	              
//	        } catch (IOException e) {  
//	            // TODO Auto-generated catch block  
//	            e.printStackTrace();  
//	        }  
	}

}
