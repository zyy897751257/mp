/*
 Navicat Premium Data Transfer

 Source Server         : mp
 Source Server Type    : SQL Server
 Source Server Version : 10501600
 Source Host           : 127.0.0.1:1433
 Source Catalog        : AuthManagedb
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 10501600
 File Encoding         : 65001

 Date: 23/05/2020 17:15:51
*/


-- ----------------------------
-- Table structure for t_department
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_department]') AND type IN ('U'))
	DROP TABLE [dbo].[t_department]
GO

CREATE TABLE [dbo].[t_department] (
  [id] int  NOT NULL,
  [dept_name] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [org_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[t_department] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for t_level
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_level]') AND type IN ('U'))
	DROP TABLE [dbo].[t_level]
GO

CREATE TABLE [dbo].[t_level] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [level] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[t_level] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构等级',
'SCHEMA', N'dbo',
'TABLE', N't_level',
'COLUMN', N'level'
GO


-- ----------------------------
-- Records of t_level
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_level] ON
GO

INSERT INTO [dbo].[t_level] ([id], [level]) VALUES (N'1', N'一级')
GO

INSERT INTO [dbo].[t_level] ([id], [level]) VALUES (N'2', N'二级')
GO

INSERT INTO [dbo].[t_level] ([id], [level]) VALUES (N'3', N'三级')
GO

SET IDENTITY_INSERT [dbo].[t_level] OFF
GO


-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[t_menu]
GO

CREATE TABLE [dbo].[t_menu] (
  [id] int  NOT NULL,
  [name] varchar(128) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [linkUrl] varchar(128) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [path] varchar(128) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [priority] int DEFAULT NULL NULL,
  [icon] varchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [description] varchar(128) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [parentMenuId] int DEFAULT NULL NULL,
  [level] int DEFAULT NULL NULL
)
GO

ALTER TABLE [dbo].[t_menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO [dbo].[t_menu]  VALUES (N'1', N'权限管理', NULL, NULL, NULL, NULL, NULL, N'0', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'2', N'基础信息维护', NULL, NULL, NULL, NULL, NULL, N'0', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'3', N'数据对应', NULL, NULL, NULL, NULL, NULL, N'0', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'4', N'数据分析', NULL, NULL, NULL, NULL, NULL, N'0', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'5', N'用户管理', N'user.html', NULL, NULL, NULL, NULL, N'1', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'6', N'角色管理', N'role.html', NULL, NULL, NULL, NULL, N'1', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'7', N'权限分配', N'permission.html', NULL, NULL, NULL, NULL, N'1', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'8', N'基础信息', NULL, NULL, NULL, NULL, NULL, N'2', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'9', N'医疗机构', NULL, NULL, NULL, NULL, NULL, N'2', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'10', N'科室信息', NULL, NULL, NULL, NULL, NULL, N'2', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'11', N'医生信息', NULL, NULL, NULL, NULL, NULL, N'2', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'12', N'中草药信息', NULL, NULL, NULL, NULL, NULL, N'2', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'13', N'药品配伍禁忌', NULL, NULL, NULL, NULL, NULL, N'2', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'14', N'方剂信息', NULL, NULL, NULL, NULL, NULL, N'2', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'15', N'针灸', NULL, NULL, NULL, NULL, NULL, N'2', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'16', N'医院信息导入', N'http://www.baidu.com', NULL, NULL, NULL, NULL, N'3', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'17', N'医院药品对应', N'http://www.baidu.com', NULL, NULL, NULL, NULL, N'3', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'18', N'一级', NULL, NULL, NULL, NULL, NULL, N'9', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'19', N'二级', NULL, NULL, NULL, NULL, NULL, N'9', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'20', N'三级', NULL, NULL, NULL, NULL, NULL, N'9', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'21', N'湖北省人民医院', N'org.html?orgCode=HBSRMYY', NULL, NULL, NULL, NULL, N'20', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'22', N'湖北省妇幼保健医院', N'org.html?orgCode=HBSFYBJY', NULL, NULL, NULL, NULL, N'20', NULL)
GO

INSERT INTO [dbo].[t_menu]  VALUES (N'23', N'测试医院01', N'org.html?orgCode=Test01', NULL, NULL, NULL, NULL, N'18', NULL)
GO


-- ----------------------------
-- Table structure for t_org
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_org]') AND type IN ('U'))
	DROP TABLE [dbo].[t_org]
GO

CREATE TABLE [dbo].[t_org] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [org_code] varchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NOT NULL,
  [org_name] varchar(255) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NOT NULL,
  [org_level] int  NULL,
  [telephone] varchar(20) COLLATE Chinese_PRC_CI_AS  NULL,
  [org_address] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL,
  [principal] varchar(10) COLLATE Chinese_PRC_CI_AS  NULL,
  [org_status] varchar(4) COLLATE Chinese_PRC_CI_AS  NOT NULL
)
GO

ALTER TABLE [dbo].[t_org] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构代码',
'SCHEMA', N'dbo',
'TABLE', N't_org',
'COLUMN', N'org_code'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构名称
',
'SCHEMA', N'dbo',
'TABLE', N't_org',
'COLUMN', N'org_name'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构级别',
'SCHEMA', N'dbo',
'TABLE', N't_org',
'COLUMN', N'org_level'
GO

EXEC sp_addextendedproperty
'MS_Description', N'电话',
'SCHEMA', N'dbo',
'TABLE', N't_org',
'COLUMN', N'telephone'
GO

EXEC sp_addextendedproperty
'MS_Description', N'机构地址',
'SCHEMA', N'dbo',
'TABLE', N't_org',
'COLUMN', N'org_address'
GO

EXEC sp_addextendedproperty
'MS_Description', N'负责人',
'SCHEMA', N'dbo',
'TABLE', N't_org',
'COLUMN', N'principal'
GO

EXEC sp_addextendedproperty
'MS_Description', N'0-禁用；1-启用',
'SCHEMA', N'dbo',
'TABLE', N't_org',
'COLUMN', N'org_status'
GO


-- ----------------------------
-- Records of t_org
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_org] ON
GO

INSERT INTO [dbo].[t_org] ([id], [org_code], [org_name], [org_level], [telephone], [org_address], [principal], [org_status]) VALUES (N'2', N'HBSRMYY', N'湖北省人民医院', N'3', N'', NULL, NULL, N'0')
GO

INSERT INTO [dbo].[t_org] ([id], [org_code], [org_name], [org_level], [telephone], [org_address], [principal], [org_status]) VALUES (N'3', N'HBSFYBJY', N'湖北省妇幼保健医院', N'3', NULL, NULL, NULL, N'0')
GO

INSERT INTO [dbo].[t_org] ([id], [org_code], [org_name], [org_level], [telephone], [org_address], [principal], [org_status]) VALUES (N'4', N'Test01', N'测试医院01', N'1', N'159753', N'测试地址01', N'qwe', N'1')
GO

INSERT INTO [dbo].[t_org] ([id], [org_code], [org_name], [org_level], [telephone], [org_address], [principal], [org_status]) VALUES (N'5', N'Test02', N'测试医院02', N'1', N'123456', N'测试地址01', N'zyy', N'0')
GO

SET IDENTITY_INSERT [dbo].[t_org] OFF
GO


-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_permission]') AND type IN ('U'))
	DROP TABLE [dbo].[t_permission]
GO

CREATE TABLE [dbo].[t_permission] (
  [id] int  NOT NULL,
  [name] varchar(32) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [keyword] varchar(64) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [description] varchar(128) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL
)
GO

ALTER TABLE [dbo].[t_permission] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for t_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_role]') AND type IN ('U'))
	DROP TABLE [dbo].[t_role]
GO

CREATE TABLE [dbo].[t_role] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] varchar(32) COLLATE Chinese_PRC_CI_AS  NULL,
  [description] varchar(255) COLLATE Chinese_PRC_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[t_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of t_role
-- ----------------------------
SET IDENTITY_INSERT [dbo].[t_role] ON
GO

INSERT INTO [dbo].[t_role] ([id], [name], [description]) VALUES (N'1', N'admin', N'管理员')
GO

INSERT INTO [dbo].[t_role] ([id], [name], [description]) VALUES (N'2', N'user', N'用户')
GO

SET IDENTITY_INSERT [dbo].[t_role] OFF
GO


-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_role_menu]') AND type IN ('U'))
	DROP TABLE [dbo].[t_role_menu]
GO

CREATE TABLE [dbo].[t_role_menu] (
  [role_id] int  NOT NULL,
  [menu_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[t_role_menu] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_role_permission]') AND type IN ('U'))
	DROP TABLE [dbo].[t_role_permission]
GO

CREATE TABLE [dbo].[t_role_permission] (
  [role_id] int  NOT NULL,
  [permission_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[t_role_permission] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for t_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_user]') AND type IN ('U'))
	DROP TABLE [dbo].[t_user]
GO

CREATE TABLE [dbo].[t_user] (
  [id] int  NOT NULL,
  [username] varchar(32) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [birthday] date DEFAULT NULL NULL,
  [gender] varchar(1) COLLATE Chinese_PRC_CI_AS DEFAULT NULL NULL,
  [password] varchar(255) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [status] varchar(4) COLLATE Chinese_PRC_CI_AS  NOT NULL,
  [dept_id] int DEFAULT NULL NULL,
  [org] int  NULL
)
GO

ALTER TABLE [dbo].[t_user] SET (LOCK_ESCALATION = TABLE)
GO

EXEC sp_addextendedproperty
'MS_Description', N'0-禁用；1-启用',
'SCHEMA', N'dbo',
'TABLE', N't_user',
'COLUMN', N'status'
GO


-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO [dbo].[t_user]  VALUES (N'1', N'admin', N'2020-04-18', N'1', N'123', N'1', NULL, NULL)
GO


-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[t_user_role]') AND type IN ('U'))
	DROP TABLE [dbo].[t_user_role]
GO

CREATE TABLE [dbo].[t_user_role] (
  [user_id] int  NOT NULL,
  [role_id] int  NOT NULL
)
GO

ALTER TABLE [dbo].[t_user_role] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Primary Key structure for table t_department
-- ----------------------------
ALTER TABLE [dbo].[t_department] ADD CONSTRAINT [PK__t_depart__3213E83F0EA330E9] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_level
-- ----------------------------
ALTER TABLE [dbo].[t_level] ADD CONSTRAINT [PK__t_level__3213E83F440B1D61] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_menu
-- ----------------------------
ALTER TABLE [dbo].[t_menu] ADD CONSTRAINT [PK__t_menu__3213E83F0AD2A005] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_org
-- ----------------------------
ALTER TABLE [dbo].[t_org] ADD CONSTRAINT [PK__t_org__3213E83F07020F21] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_permission
-- ----------------------------
ALTER TABLE [dbo].[t_permission] ADD CONSTRAINT [PK__t_permis__3213E83F03317E3D] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_role
-- ----------------------------
ALTER TABLE [dbo].[t_role] ADD CONSTRAINT [PK__t_role__3213E83F47DBAE45] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_role_menu
-- ----------------------------
ALTER TABLE [dbo].[t_role_menu] ADD CONSTRAINT [PK__t_role_m__A2C36A611DE57479] PRIMARY KEY CLUSTERED ([role_id], [menu_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_role_permission
-- ----------------------------
ALTER TABLE [dbo].[t_role_permission] ADD CONSTRAINT [PK__t_role_p__C85A54631A14E395] PRIMARY KEY CLUSTERED ([role_id], [permission_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_user
-- ----------------------------
ALTER TABLE [dbo].[t_user] ADD CONSTRAINT [PK__t_user__3213E83F1273C1CD] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table t_user_role
-- ----------------------------
ALTER TABLE [dbo].[t_user_role] ADD CONSTRAINT [PK__t_user_r__6EDEA153164452B1] PRIMARY KEY CLUSTERED ([user_id], [role_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

