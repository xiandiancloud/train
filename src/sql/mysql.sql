/*==============================================================*/
/* 用户相关信息                          */
/*==============================================================*/
drop database if exists xduser;
create database xduser character set utf8;
use xduser;

drop table if exists `auth_school`;
CREATE TABLE `auth_school` (
  `id` int(10) NOT NULL auto_increment,
  `school_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists `auth_userprofile`;
CREATE TABLE `auth_userprofile` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `meta` longtext NOT NULL,
  `courseware` varchar(255) NOT NULL,
  `gender` varchar(6) default NULL,
  `mailing_address` longtext,
  `year_of_birth` int(11) default NULL,
  `level_of_education` varchar(6) default NULL,
  `goals` longtext,
  `allow_certificate` tinyint(1) NOT NULL,
  `country` varchar(2) default NULL,
  `city` longtext,
  `school_name` varchar(255) default NULL,
  `major` varchar(255) default NULL,
  `class_name` varchar(255) default NULL,
  `admission_time` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `auth_userprofile_52094d6e` (`name`),
  KEY `auth_userprofile_8a7ac9ab` (`language`),
  KEY `auth_userprofile_b54954de` (`location`),
  KEY `auth_userprofile_fca3d292` (`gender`),
  KEY `auth_userprofile_d85587` (`year_of_birth`),
  KEY `auth_userprofile_551e365c` (`level_of_education`),
  CONSTRAINT `user_id_refs_id_3daaa960628b4c11` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists t_role;
create table t_role
(
 id          int not null AUTO_INCREMENT,
 roleName    char(100) not null,
 roleDesc    varchar(255) default null,
 primary key (id),
 UNIQUE KEY (roleName)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_roleuser;
create table t_roleuser
(
  id        int not null AUTO_INCREMENT,
  userId    int(20) not null,
  roleId    int(20) not null,
  primary key (id),
  CONSTRAINT receivet_roleuser_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
  CONSTRAINT receivet_roleuser_ibfk_2 FOREIGN KEY (roleId) REFERENCES t_role (id) ON DELETE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*==============================================================*/
/* 实训相关信息                          */
/*==============================================================*/
drop database if exists train;
create database train character set utf8;
use train;

drop table if exists t_coursecategory;
create table t_coursecategory
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   describle           varchar(255) default null, 
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_course;
create table t_course
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   imgpath             varchar(255) default null,
   describle           varchar(255) default null, 
   publish             int(10) default 0,
   starttime           varchar(255) default null,
   starttimedetail     varchar(255) default null,
   endtimedetail       varchar(255) default null,
   org                 varchar(255) default null,
   coursecode          varchar(255) default null,
   rank                varchar(255) default null,
   isgroom             int(10) default 0,
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists course_category;
create table course_category
(
   id                  int not null AUTO_INCREMENT,
   courseId            int(10) not null,
   categoryId          int(10) not null,
   primary key (id),
   UNIQUE KEY (courseId),
   CONSTRAINT receivecourse_category_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receivecourse_category_ibfk_2 FOREIGN KEY (categoryId) REFERENCES t_coursecategory (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_chapter;
create table t_chapter
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   courseId            int(10) not null,
   primary key (id),  
   CONSTRAINT receivet_chapter_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_sequential;
create table t_sequential
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   chapterId           int(10) not null,
   primary key (id),   
   CONSTRAINT receivet_sequential_ibfk_1 FOREIGN KEY (chapterId) REFERENCES t_chapter (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_vertical;
create table t_vertical
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,   
   sequentialId        int(10) not null,
   primary key (id),
   CONSTRAINT receivet_vertical_ibfk_1 FOREIGN KEY (sequentialId) REFERENCES t_sequential (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_train;
create table t_train
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null,
   codenum             varchar(255) not null,
   envname             varchar(255) not null,    
   conContent          longtext not null,
   conShell            varchar(255) default null,
   conAnswer           longtext default null,
   score               int(10) not null,
   scoretag            varchar(255) default null,
   primary key (id),
   UNIQUE KEY (name),
   UNIQUE KEY (codenum)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists vertical_train;
create table vertical_train
(
   id                  int not null AUTO_INCREMENT,
   courseId            int(10) not null,
   verticalId          int(10) not null,
   trainId             int(10) not null,
   primary key (id),
   UNIQUE KEY (courseId,trainId),
   CONSTRAINT receivevertical_train_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receivevertical_train_ibfk_2 FOREIGN KEY (verticalId) REFERENCES t_vertical (id) ON DELETE CASCADE,
   CONSTRAINT receivevertical_train_ibfk_3 FOREIGN KEY (trainId) REFERENCES t_train (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists user_train;
create table user_train
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   trainId             int(10) not null,
   counts              int(10) default 0,
   revalue             longtext default null,
   result              varchar(255) default null,
   primary key (id),
   UNIQUE KEY (courseId,trainId),
   CONSTRAINT receiveuser_train_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_train_ibfk_2 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists user_course;
create table user_course
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   state               int(10) default 0,
   activestate         int(10) default 0,
   usetime             varchar(255) default 0,
   docounts            int(10) default 1,
   primary key (id),
   UNIQUE KEY (userId,courseId),
   CONSTRAINT receiveuser_course_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists teacher_course;
create table teacher_course
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   primary key (id),
   UNIQUE KEY (userId,courseId),
   CONSTRAINT receiveteacher_course_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists user_train_history;
create table user_train_history
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   trainId             int(10) not null,
   counts              int(10) default 0,
   revalue             longtext default null,
   result              varchar(255) default null,
   docounts            int(10) not null,
   usetime             varchar(255) default 0,
   primary key (id),
   UNIQUE KEY (courseId,trainId,docounts),
   CONSTRAINT receiveuser_train_history_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_train_history_ibfk_2 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*
drop table if exists t_environment;
create table t_environment
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
*/

drop table if exists t_user_environment;
create table t_user_environment
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   trainId             int(10) not null,
   name                varchar(255) not null,  
   createtime          varchar(255) not null, 
   hostname            varchar(255) default null,
   username            varchar(255) default null,
   password            varchar(255) default null,
   serverId            varchar(255) default null,
   primary key (id),
   UNIQUE KEY (userId,courseId,trainId),
   CONSTRAINT receivet_user_environment_ibfk_1 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receivet_user_environment_ibfk_2 FOREIGN KEY (trainId) REFERENCES t_train (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_cloud;
create table t_cloud
(
   id                int not null AUTO_INCREMENT,
   ip                varchar(255) not null,
   userId            int(10) not null,
   name              varchar(255) not null,
   password          varchar(255) not null,
   primary key (id),
   UNIQUE KEY (ip)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_user_cloud;
create table t_user_cloud
(
   id                int not null AUTO_INCREMENT,
   userId            int(10) not null,
   cloudId          int(10) not null,
   primary key (id),
   CONSTRAINT receivet_user_clound_1 FOREIGN KEY (cloudId) REFERENCES t_cloud (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;