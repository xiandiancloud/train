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
   conContent          varchar(3000) not null,
   conShell            varchar(255) default null,
   conAnswer           varchar(3000) default null,
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
   revalue             varchar(3000) default null,
   result              varchar(255) default null,
   primary key (id),
   UNIQUE KEY (courseId,trainId),
   CONSTRAINT receiveuser_train_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_train_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id),
   CONSTRAINT receiveuser_train_ibfk_3 FOREIGN KEY (trainId) REFERENCES t_train (id)
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
   CONSTRAINT receiveuser_course_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_course_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists teacher_course;
create table teacher_course
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   primary key (id),
   UNIQUE KEY (userId,courseId),
   CONSTRAINT receiveteacher_course_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveteacher_course_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists user_train_history;
create table user_train_history
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   trainId             int(10) not null,
   counts              int(10) default 0,
   revalue             varchar(3000) default null,
   result              varchar(255) default null,
   docounts            int(10) not null,
   usetime             varchar(255) default 0,
   primary key (id),
   UNIQUE KEY (courseId,trainId,docounts),
   CONSTRAINT receiveuser_train_history_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_train_history_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id),
   CONSTRAINT receiveuser_train_history_ibfk_3 FOREIGN KEY (trainId) REFERENCES t_train (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists t_environment;
create table t_environment
(
   id                  int not null AUTO_INCREMENT,
   name                varchar(255) not null, 
   primary key (id),
   UNIQUE KEY (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table if exists user_course_environment;
create table user_course_environment
(
   id                  int not null AUTO_INCREMENT,
   userId              int(10) not null,
   courseId            int(10) not null,
   name                varchar(255) not null,  
   createtime          varchar(255) not null, 
   hostname            varchar(255) default null,
   username            varchar(255) default null,
   password            varchar(255) default null,
   serverId            varchar(255) default null,
   primary key (id),
   CONSTRAINT receiveuser_course_environment_ibfk_1 FOREIGN KEY (userId) REFERENCES auth_user (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_course_environment_ibfk_2 FOREIGN KEY (courseId) REFERENCES t_course (id) ON DELETE CASCADE,
   CONSTRAINT receiveuser_course_environment_ibfk_3 FOREIGN KEY (name) REFERENCES t_environment (name) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
