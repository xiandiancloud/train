package com.dhl.cons;

/**
 *整个应用通用的常量 
 *<br><b>类描述:</b>
 *<pre>|</pre>
 *@see
 *@since
 */
public class CommonConstant
{	
   /**
    * 用户对象放到Session中的键名称
    */
   public static final String USER_CONTEXT = "USER_CONTEXT";
   
   public static final String USER_ROLE = "USER_ROLE";
   
   public static final String USER_GROUP = "USER_GROUP";
   
   /**
    * 将登录前的URL放到Session中的键名称
    */
   public static final String LOGIN_TO_URL = "toUrl";
   
   /**
    * 每页的记录数
    */
   //public static final int PAGE_SIZE = 10;
   public static final int SYS_PAGE_SIZE = 8;
  
   //系统4种角色
   public static final String ROLE_S = "学生";
   public static final String ROLE_T = "老师";
   public static final String ROLE_C = "裁判";
   public static final String ROLE_A = "管理员";
}
