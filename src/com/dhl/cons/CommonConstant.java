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
   public static final String CMS_LOGIN_TO_URL = "tocUrl";
   public static final String ADMIN_LOGIN_TO_URL = "toaUrl";
   /**
    * 每页的记录数
    */
   //public static final int PAGE_SIZE = 10;
   public static final int SYS_PAGE_SIZE = 8;
   public static final int COURSELIST_SIZE = 15;
   //系统4种角色
   public static final String ROLE_S = "学生";
   public static final String ROLE_T = "老师";
   public static final String ROLE_C = "裁判";
   public static final String ROLE_A = "管理员";
   
   //错误提示
   public static final String ERROR_0 = "后台异常，请联系系统管理员";
   public static final String ERROR_1 = "学校已经存在";
   public static final String ERROR_2 = "保存成功";
   public static final String ERROR_3 = "分类已经存在";
   public static final String ERROR_4 = "实验已经存在";
   
   //课程级别
   public static final String LEVEL_1 = "初级";
   public static final String LEVEL_2 = "中级";
   public static final String LEVEL_3 = "高级";
   
   //是否是单点登录  默认0的话不是单点登录
   public static final int SSO_NO = 0;
   public static final int SSO_CAS = 1;
   public static final int SSO_LDAP = 2;
}
