USE [WHJHPlatformDB]
GO
/****** Object:  Table [dbo].[SystemMessage]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemMessage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MessageType] [int] NOT NULL,
	[ServerRange] [nvarchar](1024) NOT NULL,
	[MessageString] [nvarchar](1024) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[ConcludeTime] [datetime] NOT NULL,
	[TimeRate] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateMasterID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateMasterID] [int] NOT NULL,
	[UpdateCount] [int] NOT NULL,
	[CollectNote] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_SystemMessage_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'索引标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息范围(1:游戏,2:房间,3:全部)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'MessageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间范围(0:所有房间)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'ServerRange'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'消息内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'MessageString'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'ConcludeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间频率(多长时间发送一次)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'TimeRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建管理员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'CreateMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后更新时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'UpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改管理员ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'UpdateMasterID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'UpdateCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemMessage', @level2type=N'COLUMN',@level2name=N'CollectNote'
GO
/****** Object:  Table [dbo].[StreamCreateTableFeeInfo]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StreamCreateTableFeeInfo](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[NickName] [nvarchar](31) NOT NULL,
	[ServerID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,	
	[CellScore] [bigint] NOT NULL,
	[JoinGamePeopleCount] [tinyint] NOT NULL DEFAULT ((1)),
	[CountLimit] [tinyint] NOT NULL,
	[TimeLimit] [int] NOT NULL,
	[CreateTableFee] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [DF_StreamMatchFeeInfo_CollectDate]  DEFAULT (getdate()),
	[DissumeDate] [datetime] NULL,
	[TaxAgency] [bigint] NOT NULL DEFAULT ((0)),
	[TaxCount] [bigint] NOT NULL DEFAULT ((0)),
	[TaxRevenue] [bigint] NOT NULL DEFAULT ((0)),
	[PayMode] [tinyint] NOT NULL DEFAULT ((0)),
	[RoomStatus] [tinyint] NOT NULL DEFAULT ((0)),
	[NeedRoomCard] [tinyint] NOT NULL DEFAULT ((0)),
	[RoomScoreInfo] [varbinary](max) NULL,
	[GameMode] [tinyint] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_StreamMatchFeeInfo] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'RecordID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'RoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间底分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'CellScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间参与游戏的人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'JoinGamePeopleCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'局数限制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'CountLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间限制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'TimeLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'CreateTableFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'离开时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'DissumeDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理税收比例千分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'TaxAgency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间税收总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'TaxCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理税收返现' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'TaxRevenue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付模式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'PayMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间状态(0 未开始,1 游戏中,2 结束)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'RoomStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'理论上消耗钻石' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'NeedRoomCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间所有玩家的成绩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'RoomScoreInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏模式 0:局数 1:时间 2:圈数 3:积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StreamCreateTableFeeInfo', @level2type=N'COLUMN',@level2name=N'GameMode'
GO
/****** Object:  Table [dbo].[SigninConfig]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SigninConfig](
	[DayID] [int] NOT NULL,
	[RewardGold] [bigint] NOT NULL,
 CONSTRAINT [PK_SigninConfig] PRIMARY KEY CLUSTERED 
(
	[DayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'签到标识[天]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SigninConfig', @level2type=N'COLUMN',@level2name=N'DayID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'奖励金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SigninConfig', @level2type=N'COLUMN',@level2name=N'RewardGold'
GO
/****** Object:  Table [dbo].[SensitiveWords]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SensitiveWords](
	[ForbidWords] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_SensitiveWords] PRIMARY KEY CLUSTERED 
(
	[ForbidWords] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordBackInfo]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordBackInfo](
	[ID] [varchar](22) NOT NULL,
	[PersonalRoomGUID] [nvarchar](31) NULL,
	[UserID] [int] NOT NULL,
	[RoomID] [int]	NOT NULL,
	[Score] [bigint] NOT NULL,
	[GamesNum] [int] NOT NULL,	
	[GameMode] [tinyint] NOT NULL DEFAULT ((0)),
	[LoopCount] [tinyint] NOT NULL DEFAULT ((0)),
	[Dates] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'视频id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'约战房间唯一标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'PersonalRoomGUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'RoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分（货币）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'GamesNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏模式 0:局数 1:时间 2:圈数 3:积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'GameMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏圈数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'LoopCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'写入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RecordBackInfo', @level2type=N'COLUMN',@level2name=N'Dates'
GO
/****** Object:  Table [dbo].[PersonalTableFee]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalTableFee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KindID] [int] NOT NULL,
	[DrawCountLimit] [int] NOT NULL,
	[DrawTimeLimit] [int] NOT NULL,
	[TableFee] [bigint] NOT NULL,
	[AAPayFee] [int] NOT NULL,
	[IniScore] [bigint] NOT NULL,
	[GameMode] [tinyint] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_SystemStatusInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalTableFee', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'局数限制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalTableFee', @level2type=N'COLUMN',@level2name=N'DrawCountLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间限制' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalTableFee', @level2type=N'COLUMN',@level2name=N'DrawTimeLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalTableFee', @level2type=N'COLUMN',@level2name=N'TableFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AA费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalTableFee', @level2type=N'COLUMN',@level2name=N'AAPayFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'初始分数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalTableFee', @level2type=N'COLUMN',@level2name=N'IniScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏模式 0:局数 1:时间 2:圈数 3:积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalTableFee', @level2type=N'COLUMN',@level2name=N'GameMode'
GO
/****** Object:  Table [dbo].[PersonalRoomScoreInfo]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalRoomScoreInfo](
	[UserID] [int] NOT NULL,
	[PersonalRoomGUID] [nchar](31) NOT NULL,
	[RoomID] [int] NOT NULL,
	[Score] [bigint] NOT NULL,
	[WinCount] [int] NOT NULL,
	[LostCount] [int] NOT NULL,
	[DrawCount] [int] NOT NULL,
	[FleeCount] [int] NOT NULL,
	[WriteTime] [datetime] NOT NULL,
	[PlayBackCode] [int] NOT NULL,
	[ChairID] [int] NOT NULL,
	[KindID] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PersonalRoomScoreInfo_UserID] ON [dbo].[PersonalRoomScoreInfo]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间 ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'RoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户积分（货币）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'Score'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'胜局数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'WinCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'输局数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'LostCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'和局数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'DrawCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逃局数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'FleeCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'记录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'WriteTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回放码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'PlayBackCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'座位id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'ChairID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomScoreInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
/****** Object:  Table [dbo].[PersonalRoomInfo]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalRoomInfo](
	[ServerID] [int] NOT NULL,
	[KindID] [int] NOT NULL,	
	[IsJoinGame] [tinyint] NOT NULL,
	[MinPeople] [tinyint] NOT NULL,
	[MaxPeople] [tinyint] NOT NULL,
	[PersonalRoomTax] [bigint] NOT NULL,
	[MaxCellScore] [bigint] NOT NULL,
	[CanCreateCount] [smallint] NOT NULL,
	[CreateRight] [tinyint] NOT NULL,
	[PlayTurnCount] [int] NOT NULL,
	[PlayTimeLimit] [int] NOT NULL,
	[TimeAfterBeginCount] [int] NOT NULL,
	[TimeOffLineCount] [int] NOT NULL,
	[TimeNotBeginGame] [int] NOT NULL,
	[TimeNotBeginAfterCreateRoom] [int] NOT NULL,
	[BeginFreeTime] [SMALLINT] NOT NULL,
	[EndFreeTime] [SMALLINT] NOT NULL,
 CONSTRAINT [PK_PersonalRoomInfo_ServerID] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否参加游戏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'IsJoinGame'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与游戏最小人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'MinPeople'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与游戏最大人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'MaxPeople'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间最大底分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'MaxCellScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'桌主能够创建的最大房间数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'CanCreateCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建房间的权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'CreateRight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间能够进行游戏的最大局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'PlayTurnCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间能够进行游戏的最大时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'PlayTimeLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一局游戏开始后多长时间后解散桌子' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'TimeAfterBeginCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家掉线多长时间后解散桌子' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'TimeOffLineCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家坐下多长时间后还未开始游戏解散桌子' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'TimeNotBeginGame'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'私人房创建多长时间后无人坐桌解散桌子' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'TimeNotBeginAfterCreateRoom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'免费时段-开始' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'BeginFreeTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'免费时段结束' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalRoomInfo', @level2type=N'COLUMN',@level2name=N'EndFreeTime'
GO
/****** Object:  Table [dbo].[OnLineStreamInfo]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnLineStreamInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MachineID] [nvarchar](32) NOT NULL,
	[MachineServer] [nvarchar](32) NOT NULL,
	[InsertDateTime] [datetime] NOT NULL,
	[OnLineCountSum] [int] NOT NULL,
	[AndroidCountSum] [int] NOT NULL,
	[OnLineCountKind] [nvarchar](2048) NOT NULL,
	[AndroidCountKind] [nvarchar](2048) NOT NULL,
 CONSTRAINT [PK_OnLineStreamInfo_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'MachineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'MachineServer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'InsertDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'OnLineCountSum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStreamInfo', @level2type=N'COLUMN',@level2name=N'OnLineCountKind'
GO
/****** Object:  Table [dbo].[OnLineStatusInfo]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnLineStatusInfo](
	[KindID] [int] NOT NULL,
	[ServerID] [int] NOT NULL,
	[OnLineCount] [int] NOT NULL,
	[InsertDateTime] [datetime] NOT NULL,
	[ModifyDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_OnLineStatusInfo_ID] PRIMARY KEY CLUSTERED 
(
	[KindID] ASC,
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'OnLineCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'插入时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'InsertDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OnLineStatusInfo', @level2type=N'COLUMN',@level2name=N'ModifyDateTime'
GO
/****** Object:  Table [dbo].[MobileKindItem]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileKindItem](
	[KindID] [int] NOT NULL,
	[KindName] [nvarchar](32) NOT NULL,
	[TypeID] [int] NOT NULL,
	[ModuleName] [nvarchar](32) NOT NULL,
	[ClientVersion] [int] NOT NULL,
	[ResVersion] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[KindMark] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,	
 CONSTRAINT [PK_MobileKindItem] PRIMARY KEY CLUSTERED 
(
	[KindID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileKindItem', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileKindItem', @level2type=N'COLUMN',@level2name=N'KindName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileKindItem', @level2type=N'COLUMN',@level2name=N'ModuleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileKindItem', @level2type=N'COLUMN',@level2name=N'ClientVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'资源版本号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileKindItem', @level2type=N'COLUMN',@level2name=N'ResVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileKindItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏掩码(1:ios,2:Android)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileKindItem', @level2type=N'COLUMN',@level2name=N'KindMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MobileKindItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** Object:  Table [dbo].[GlobalPlayPresent]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalPlayPresent](
	[ServerID] [int] NOT NULL,
	[PresentMember] [nvarchar](50) NOT NULL,
	[MaxDatePresent] [int] NOT NULL,
	[MaxPresent] [int] NOT NULL,
	[CellPlayPresnet] [int] NOT NULL,
	[CellPlayTime] [int] NOT NULL,
	[StartPlayTime] [int] NOT NULL,
	[CellOnlinePresent] [int] NOT NULL,
	[CellOnlineTime] [int] NOT NULL,
	[StartOnlineTime] [int] NOT NULL,
	[IsPlayPresent] [tinyint] NOT NULL,
	[IsOnlinePresent] [tinyint] NOT NULL,
	[CollectDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GlobalPlayPresent_1] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'赠送会员范围' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'PresentMember'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单日封顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'MaxDatePresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大封顶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'MaxPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏泡分单元值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'CellPlayPresnet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏泡分单元时间(秒)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'CellPlayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏泡分启动时间(秒)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'StartPlayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线泡分单元值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'CellOnlinePresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线泡分单元时间(秒)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'CellOnlineTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'在线泡分启始时间(秒)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'StartOnlineTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开启游戏泡分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'IsPlayPresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否开启在线泡分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'IsOnlinePresent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GlobalPlayPresent', @level2type=N'COLUMN',@level2name=N'CollectDate'
GO
/****** Object:  Table [dbo].[GameTypeItem]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameTypeItem](
	[TypeID] [int] NOT NULL,
	[JoinID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[TypeName] [nvarchar](32) NOT NULL,
	[Nullity] [tinyint] NOT NULL,
 CONSTRAINT [PK_GameTypeItem_TypeID] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'JoinID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameTypeItem'
GO
/****** Object:  Table [dbo].[GameRoomInfo]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameRoomInfo](
	[ServerID] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [nvarchar](31) NOT NULL,
	[KindID] [int] NOT NULL,
	[NodeID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[TableCount] [int] NOT NULL,
	[ServerKind] [int] NOT NULL,
	[ServerType] [int] NOT NULL,
	[ServerPort] [int] NOT NULL,
	[ServerLevel] [int] NOT NULL,
	[ServerPasswd] [nvarchar](31) NULL,
	[DataBaseName] [nvarchar](31) NOT NULL,
	[DataBaseAddr] [nvarchar](15) NOT NULL,
	[CellScore] [bigint] NOT NULL,
	[RevenueRatio] [tinyint] NOT NULL,
	[ServiceScore] [bigint] NOT NULL,
	[RestrictScore] [bigint] NOT NULL,
	[MinTableScore] [bigint] NOT NULL,
	[MinEnterScore] [bigint] NOT NULL,
	[MaxEnterScore] [bigint] NOT NULL,
	[MinEnterMember] [int] NOT NULL,
	[MaxEnterMember] [int] NOT NULL,
	[MaxPlayer] [int] NOT NULL,
	[ServerRule] [int] NOT NULL,
	[DistributeRule] [int] NOT NULL,
	[MinDistributeUser] [int] NOT NULL,
	[DistributeTimeSpace] [int] NOT NULL,
	[DistributeDrawCount] [int] NOT NULL,
	[MinPartakeGameUser] [int] NOT NULL,
	[MaxPartakeGameUser] [int] NOT NULL,
	[AttachUserRight] [int] NOT NULL,
	[ServiceMachine] [nvarchar](32) NOT NULL,
	[CustomRule] [nvarchar](2048) NOT NULL,
	[PersonalRule] [nvarchar](2048) NOT NULL,
	[Nullity] [tinyint] NOT NULL,
	[ServerNote] [nvarchar](64) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[ModifyDateTime] [datetime] NOT NULL,
	[EnterPassword] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_GameRoomInfo_ServerID] PRIMARY KEY CLUSTERED 
(
	[ServerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接节点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'NodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排列标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'桌子数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'TableCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DataBaseName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DataBaseAddr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'CellScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'税收比例' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'RevenueRatio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务费用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServiceScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'限制积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'RestrictScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最低积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MinTableScore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大数目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MaxPlayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'房间规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DistributeRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最少人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MinDistributeUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组间隔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DistributeTimeSpace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分组局数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'DistributeDrawCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏最少人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MinPartakeGameUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏最多人数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'MaxPartakeGameUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运行机器' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServiceMachine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自定规则' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'CustomRule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'禁止服务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ServerNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'CreateDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomInfo', @level2type=N'COLUMN',@level2name=N'ModifyDateTime'
GO
/****** Object:  Table [dbo].[GamePropertyType]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePropertyType](
	[TypeID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[TypeName] [nvarchar](32) NOT NULL,
	[TagID] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
 CONSTRAINT [PK_GamePropertyType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyType', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyType', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyType', @level2type=N'COLUMN',@level2name=N'TypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'渠道标识(0：大厅，1：手机)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyType', @level2type=N'COLUMN',@level2name=N'TagID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'冻结标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyType', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** Object:  Table [dbo].[GamePropertySub]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePropertySub](
	[ID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[SortID] [int] NOT NULL,
 CONSTRAINT [PK_GamePropertySub] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[OwnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertySub', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具归属ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertySub', @level2type=N'COLUMN',@level2name=N'OwnerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具数量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertySub', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertySub', @level2type=N'COLUMN',@level2name=N'SortID'
GO
/****** Object:  Table [dbo].[GamePropertyRelat]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePropertyRelat](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_GamePropertyRelat] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增长标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyRelat', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyRelat', @level2type=N'COLUMN',@level2name=N'PropertyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'设备标识（0、PC  1、手机）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyRelat', @level2type=N'COLUMN',@level2name=N'TagID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具类型标识（对应GamePropertyType表）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePropertyRelat', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
/****** Object:  Table [dbo].[GameProperty]    Script Date: 06/16/2017 10:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameProperty](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](31) NOT NULL,
	[Kind] [int] NOT NULL,
	[ExchangeRatio] [int] NOT NULL,
	[UseArea] [tinyint] NOT NULL,
	[ServiceArea] [tinyint] NOT NULL,
	[BuyResultsGold] [bigint] NOT NULL,
	[SendLoveLiness] [bigint] NOT NULL,
	[RecvLoveLiness] [bigint] NOT NULL,
	[UseResultsGold] [bigint] NOT NULL,
	[UseResultsValidTime] [int] NOT NULL,
	[UseResultsValidTimeScoreMultiple] [int] NOT NULL,
	[UseResultsGiftPackage] [int] NOT NULL,
	[RegulationsInfo] [nvarchar](128) NOT NULL,
	[Recommend] [tinyint] NOT NULL,
	[SortID] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
 CONSTRAINT [PK_GameProperty] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具类型（1礼物2宝石3双倍卡4护身卡5防踢卡6vip7大喇叭8小喇叭9负分清零10逃跑清零11会员礼包）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Kind'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钻石兑道具比率(10就是代表一个钻石兑换10个此道具)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'ExchangeRatio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具使用范围，1大厅,2房间,4游戏中' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'UseArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具作用范围，1自己,2除自己玩家' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'ServiceArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者增加魅力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'SendLoveLiness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被使用者增加魅力' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'RecvLoveLiness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用增加金币' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'UseResultsGold'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用持续时间，单位秒' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'UseResultsValidTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用有效时间内积分倍率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'UseResultsValidTimeScoreMultiple'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否成为礼包' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'UseResultsGiftPackage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'道具详细描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'RegulationsInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否推荐1推荐，0不推荐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否下架' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameProperty', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_Kind]  DEFAULT ((0)) FOR [Kind]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_Diamond]  DEFAULT ((0)) FOR [ExchangeRatio]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_UseArea]  DEFAULT ((0)) FOR [UseArea]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_ServiceArea]  DEFAULT ((0)) FOR [ServiceArea]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_BuyResultsGold]  DEFAULT ((0)) FOR [BuyResultsGold]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_SendLoveLiness]  DEFAULT ((0)) FOR [SendLoveLiness]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_RecvLoveLiness]  DEFAULT ((0)) FOR [RecvLoveLiness]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_UseResultsGold]  DEFAULT ((0)) FOR [UseResultsGold]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_UseResultsValidTime]  DEFAULT ((0)) FOR [UseResultsValidTime]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_UseResultsGiftPackage]  DEFAULT ((0)) FOR [UseResultsGiftPackage]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_RegulationsInfo]  DEFAULT ('') FOR [RegulationsInfo]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_Recommend]  DEFAULT ((0)) FOR [Recommend]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_SortID]  DEFAULT ((0)) FOR [SortID]
GO
ALTER TABLE [dbo].[GameProperty] ADD  CONSTRAINT [DF_GameProperty_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Table [dbo].[GamePageItem]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePageItem](
	[PageID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[NodeID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[OperateType] [int] NOT NULL,
	[DisplayName] [nvarchar](32) NOT NULL,
	[ResponseUrl] [nvarchar](256) NOT NULL,
	[Nullity] [tinyint] NOT NULL,
 CONSTRAINT [PK_GameCustomItem_CustomID] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'页面标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'PageID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点索引' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'NodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'OperateType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'DisplayName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'ResponseUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GamePageItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** Object:  Table [dbo].[GameNodeItem]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameNodeItem](
	[NodeID] [int] NOT NULL,
	[KindID] [int] NOT NULL,
	[JoinID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[NodeName] [nvarchar](32) NOT NULL,
	[Nullity] [tinyint] NOT NULL,
 CONSTRAINT [PK_GameNodeItem] PRIMARY KEY CLUSTERED 
(
	[NodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'NodeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'JoinID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节点名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'NodeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameNodeItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** Object:  Table [dbo].[GameKindItem]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameKindItem](
	[KindID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[JoinID] [int] NOT NULL,
	[SortID] [int] NOT NULL,
	[KindName] [nvarchar](32) NOT NULL,
	[ProcessName] [nvarchar](32) NOT NULL,
	[GameRuleUrl] [nvarchar](256) NOT NULL,
	[DownLoadUrl] [nvarchar](256) NOT NULL,
	[Recommend] [int] NOT NULL,
	[GameFlag] [int] NOT NULL,
	[Nullity] [tinyint] NOT NULL,
 CONSTRAINT [PK_GameKindItem] PRIMARY KEY CLUSTERED 
(
	[KindID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'KindID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'种类标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'TypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂接标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'JoinID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'SortID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'KindName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进程名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'ProcessName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'跳转地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'GameRuleUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下载地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'DownLoadUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐游戏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'Recommend'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏标志,新1荐2热3赛4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'GameFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'无效标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameKindItem', @level2type=N'COLUMN',@level2name=N'Nullity'
GO
/****** Object:  Table [dbo].[GameGameItem]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameGameItem](
	[GameID] [int] NOT NULL,
	[GameName] [nvarchar](31) NOT NULL,
	[SuportType] [int] NOT NULL,
	[DataBaseAddr] [nvarchar](15) NOT NULL,
	[DataBaseName] [nvarchar](31) NOT NULL,
	[ServerVersion] [int] NOT NULL,
	[ClientVersion] [int] NOT NULL,
	[ServerDLLName] [nvarchar](31) NOT NULL,
	[ClientExeName] [nvarchar](31) NOT NULL,
 CONSTRAINT [PK_GameModuleInfo_ModuleID] PRIMARY KEY NONCLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'GameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'GameName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支持类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'SuportType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'DataBaseAddr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'DataBaseName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务器版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'ServerVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端版本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'ClientVersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服务端名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'ServerDLLName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户端名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameGameItem', @level2type=N'COLUMN',@level2name=N'ClientExeName'
GO
/****** Object:  Table [dbo].[DataBaseInfo]    Script Date: 05/19/2017 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataBaseInfo](
	[DBInfoID] [int] IDENTITY(1,1) NOT NULL,
	[DBAddr] [nvarchar](15) NOT NULL,
	[DBPort] [int] NOT NULL,
	[DBUser] [nvarchar](512) NOT NULL,
	[DBPassword] [nvarchar](512) NOT NULL,
	[MachineID] [nvarchar](32) NOT NULL,
	[Information] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_DataBaseInfo_Index] PRIMARY KEY CLUSTERED 
(
	[DBInfoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网络地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'DBAddr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库端口' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'DBPort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库用户' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'DBUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'DBPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机器标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'MachineID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注信息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DataBaseInfo', @level2type=N'COLUMN',@level2name=N'Information'
GO

/****** Object:  Table [dbo].[PersonalCellScore]    Script Date: 11/23/2017 18:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PersonalCellScore]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PersonalCellScore](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KindID] [int] NOT NULL,
	[CellScore] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PersonalCellScore', N'COLUMN',N'KindID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'类型标识' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalCellScore', @level2type=N'COLUMN',@level2name=N'KindID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PersonalCellScore', N'COLUMN',N'CellScore'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'游戏底分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PersonalCellScore', @level2type=N'COLUMN',@level2name=N'CellScore'
GO

/****** Object:  Default [DF_TABLE1_DataBasePort]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[DataBaseInfo] ADD  CONSTRAINT [DF_TABLE1_DataBasePort]  DEFAULT ((1433)) FOR [DBPort]
GO
/****** Object:  Default [DF_DataBaseInfo_MachineID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[DataBaseInfo] ADD  CONSTRAINT [DF_DataBaseInfo_MachineID]  DEFAULT (N'') FOR [MachineID]
GO
/****** Object:  Default [DF_SQLConnectInfo_NoteInfo]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[DataBaseInfo] ADD  CONSTRAINT [DF_SQLConnectInfo_NoteInfo]  DEFAULT (N'N('')') FOR [Information]
GO
/****** Object:  Default [DF_GameGameItem_DBAddr]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameGameItem] ADD  CONSTRAINT [DF_GameGameItem_DBAddr]  DEFAULT ('') FOR [DataBaseAddr]
GO
/****** Object:  Default [DF_GameModuleInfo_ModuleVersion]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameGameItem] ADD  CONSTRAINT [DF_GameModuleInfo_ModuleVersion]  DEFAULT ((0)) FOR [ServerVersion]
GO
/****** Object:  Default [DF_GameModuleInfo_ClientVersion]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameGameItem] ADD  CONSTRAINT [DF_GameModuleInfo_ClientVersion]  DEFAULT ((0)) FOR [ClientVersion]
GO
/****** Object:  Default [DF_GameKindItem_JoinID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameKindItem] ADD  CONSTRAINT [DF_GameKindItem_JoinID]  DEFAULT ((0)) FOR [JoinID]
GO
/****** Object:  Default [DF_GameKindItem_SortID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameKindItem] ADD  CONSTRAINT [DF_GameKindItem_SortID]  DEFAULT ((1000)) FOR [SortID]
GO
/****** Object:  Default [DF_GameKindItem_ResponseUrl]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameKindItem] ADD  CONSTRAINT [DF_GameKindItem_ResponseUrl]  DEFAULT (N'') FOR [GameRuleUrl]
GO
/****** Object:  Default [DF_GameKindItem_DownLoadUrl]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameKindItem] ADD  CONSTRAINT [DF_GameKindItem_DownLoadUrl]  DEFAULT (N'') FOR [DownLoadUrl]
GO
/****** Object:  Default [DF_GameKindItem_Nullity]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameKindItem] ADD  CONSTRAINT [DF_GameKindItem_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_GameStationItem_JoinID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameNodeItem] ADD  CONSTRAINT [DF_GameStationItem_JoinID]  DEFAULT ((0)) FOR [JoinID]
GO
/****** Object:  Default [DF_GameStationItem_SortID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameNodeItem] ADD  CONSTRAINT [DF_GameStationItem_SortID]  DEFAULT ((1000)) FOR [SortID]
GO
/****** Object:  Default [DF_GameStationItem_Nullity]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameNodeItem] ADD  CONSTRAINT [DF_GameStationItem_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_GamePageItem_ResponseUrl]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GamePageItem] ADD  CONSTRAINT [DF_GamePageItem_ResponseUrl]  DEFAULT (N'') FOR [ResponseUrl]
GO
/****** Object:  Default [DF_GameCustomItem_Nullity]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GamePageItem] ADD  CONSTRAINT [DF_GameCustomItem_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_GamePropertyRelat_PropertyID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GamePropertyRelat] ADD  CONSTRAINT [DF_GamePropertyRelat_PropertyID]  DEFAULT ((0)) FOR [PropertyID]
GO
/****** Object:  Default [DF_GamePropertyRelat_TagID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GamePropertyRelat] ADD  CONSTRAINT [DF_GamePropertyRelat_TagID]  DEFAULT ((0)) FOR [TagID]
GO
/****** Object:  Default [DF_GamePropertyRelat_TypeID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GamePropertyRelat] ADD  CONSTRAINT [DF_GamePropertyRelat_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
/****** Object:  Default [DF_GamePropertyType_TypeName]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GamePropertyType] ADD  CONSTRAINT [DF_GamePropertyType_TypeName]  DEFAULT ('') FOR [TypeName]
GO
/****** Object:  Default [DF_GamePropertyType_TagID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GamePropertyType] ADD  CONSTRAINT [DF_GamePropertyType_TagID]  DEFAULT ((0)) FOR [TagID]
GO
/****** Object:  Default [DF_GamePropertyType_Nullity]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GamePropertyType] ADD  CONSTRAINT [DF_GamePropertyType_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_GameRoomInfo_TableCount]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_TableCount]  DEFAULT ((60)) FOR [TableCount]
GO
/****** Object:  Default [DF_GameRoomInfo_ServerKind]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_ServerKind]  DEFAULT ((0)) FOR [ServerKind]
GO
/****** Object:  Default [DF_GameRoomInfo_ServerPort]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_ServerPort]  DEFAULT ((0)) FOR [ServerPort]
GO
/****** Object:  Default [DF_GameRoomInfo_ServerLevel]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_ServerLevel]  DEFAULT ((0)) FOR [ServerLevel]
GO
/****** Object:  Default [DF_GameRoomInfo_DataBaseAddr]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_DataBaseAddr]  DEFAULT ('') FOR [DataBaseAddr]
GO
/****** Object:  Default [DF_GameRoomInfo_CellScore]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_CellScore]  DEFAULT ((0)) FOR [CellScore]
GO
/****** Object:  Default [DF_GameRoomInfo_ServiceGold]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_ServiceGold]  DEFAULT ((0)) FOR [ServiceScore]
GO
/****** Object:  Default [DF_GameRoomInfo_RestrictScore]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_RestrictScore]  DEFAULT ((0)) FOR [RestrictScore]
GO
/****** Object:  Default [DF_GameRoomInfo_MinTableScore]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MinTableScore]  DEFAULT ((0)) FOR [MinTableScore]
GO
/****** Object:  Default [DF_GameRoomInfo_MinEnterScore]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MinEnterScore]  DEFAULT ((0)) FOR [MinEnterScore]
GO
/****** Object:  Default [DF_GameRoomInfo_MaxEnterScore]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MaxEnterScore]  DEFAULT ((0)) FOR [MaxEnterScore]
GO
/****** Object:  Default [DF_GameRoomInfo_MinEnterMember]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MinEnterMember]  DEFAULT ((0)) FOR [MinEnterMember]
GO
/****** Object:  Default [DF_GameRoomInfo_MaxEnterMember]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MaxEnterMember]  DEFAULT ((0)) FOR [MaxEnterMember]
GO
/****** Object:  Default [DF_GameRoomInfo_DistributeRule]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_DistributeRule]  DEFAULT ((0)) FOR [DistributeRule]
GO
/****** Object:  Default [DF_GameRoomInfo_MinDistributeUser]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MinDistributeUser]  DEFAULT ((0)) FOR [MinDistributeUser]
GO
/****** Object:  Default [DF_GameRoomInfo_DistributeTimeSpace]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_DistributeTimeSpace]  DEFAULT ((0)) FOR [DistributeTimeSpace]
GO
/****** Object:  Default [DF_GameRoomInfo_DistributeDrawCount]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_DistributeDrawCount]  DEFAULT ((0)) FOR [DistributeDrawCount]
GO
/****** Object:  Default [DF_GameRoomInfo_MinPartakeGameUser]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MinPartakeGameUser]  DEFAULT ((0)) FOR [MinPartakeGameUser]
GO
/****** Object:  Default [DF_GameRoomInfo_MaxPartakeGameUser_1]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MaxPartakeGameUser_1]  DEFAULT ((0)) FOR [MaxPartakeGameUser]
GO
/****** Object:  Default [DF_GameRoomInfo_UserRight]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_UserRight]  DEFAULT ((0)) FOR [AttachUserRight]
GO
/****** Object:  Default [DF_GameRoomInfo_MachineSerial]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_MachineSerial]  DEFAULT ('') FOR [ServiceMachine]
GO
/****** Object:  Default [DF_GameRoomInfo_CustomRule]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_CustomRule]  DEFAULT ('') FOR [CustomRule]
GO
/****** Object:  Default [DF_GameRoomInfo_Nullity]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_GameRoomInfo_ServerNote]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_ServerNote]  DEFAULT ('') FOR [ServerNote]
GO
/****** Object:  Default [DF_GameRoomInfo_CreateDataTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_CreateDataTime]  DEFAULT (getdate()) FOR [CreateDateTime]
GO
/****** Object:  Default [DF_GameRoomInfo_ModifyDateTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_ModifyDateTime]  DEFAULT (getdate()) FOR [ModifyDateTime]
GO
/****** Object:  Default [DF_GameRoomInfo_EnterPassword]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_EnterPassword]  DEFAULT ('') FOR [EnterPassword]
GO
/****** Object:  Default [DF_GameTypeItem_JoinID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameTypeItem] ADD  CONSTRAINT [DF_GameTypeItem_JoinID]  DEFAULT ((0)) FOR [JoinID]
GO
/****** Object:  Default [DF_GameTypeItem_SortID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameTypeItem] ADD  CONSTRAINT [DF_GameTypeItem_SortID]  DEFAULT ((1000)) FOR [SortID]
GO
/****** Object:  Default [DF_GameTypeItem_Nullity]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GameTypeItem] ADD  CONSTRAINT [DF_GameTypeItem_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_GlobalPlayPresent_PresentMember]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_PresentMember]  DEFAULT ('') FOR [PresentMember]
GO
/****** Object:  Default [DF_GlobalPlayPresent_MaxGrantDateScore]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_MaxGrantDateScore]  DEFAULT ((0)) FOR [MaxDatePresent]
GO
/****** Object:  Default [DF_GlobalPlayPresent_MaxGrantScore]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_MaxGrantScore]  DEFAULT ((0)) FOR [MaxPresent]
GO
/****** Object:  Default [DF_GlobalPlayPresent_CellPlayPresnet]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_CellPlayPresnet]  DEFAULT ((0)) FOR [CellPlayPresnet]
GO
/****** Object:  Default [DF_GlobalPlayPresent_CellPlayTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_CellPlayTime]  DEFAULT ((0)) FOR [CellPlayTime]
GO
/****** Object:  Default [DF_GlobalPlayPresent_StartPlayTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_StartPlayTime]  DEFAULT ((0)) FOR [StartPlayTime]
GO
/****** Object:  Default [DF_GlobalPlayPresent_CellOnlinePresent]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_CellOnlinePresent]  DEFAULT ((0)) FOR [CellOnlinePresent]
GO
/****** Object:  Default [DF_GlobalPlayPresent_CellOnlineTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_CellOnlineTime]  DEFAULT ((0)) FOR [CellOnlineTime]
GO
/****** Object:  Default [DF_GlobalPlayPresent_StartOnlineTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_StartOnlineTime]  DEFAULT ((0)) FOR [StartOnlineTime]
GO
/****** Object:  Default [DF_GlobalPlayPresent_IsPlayPresent]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_IsPlayPresent]  DEFAULT ((0)) FOR [IsPlayPresent]
GO
/****** Object:  Default [DF_GlobalPlayPresent_IsOnlinePresent]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_IsOnlinePresent]  DEFAULT ((0)) FOR [IsOnlinePresent]
GO
/****** Object:  Default [DF_GlobalPlayPresent_CollectDate]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[GlobalPlayPresent] ADD  CONSTRAINT [DF_GlobalPlayPresent_CollectDate]  DEFAULT (getdate()) FOR [CollectDate]
GO
/****** Object:  Default [DF_MobileKindItem_TypeID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[MobileKindItem] ADD  CONSTRAINT [DF_MobileKindItem_TypeID]  DEFAULT ((0)) FOR [TypeID]
GO
/****** Object:  Default [DF_MobileKindItem_ModuleName]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[MobileKindItem] ADD  CONSTRAINT [DF_MobileKindItem_ModuleName]  DEFAULT ('') FOR [ModuleName]
GO
/****** Object:  Default [DF_MobileKindItem_ClientVersion]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[MobileKindItem] ADD  CONSTRAINT [DF_MobileKindItem_ClientVersion]  DEFAULT ((0)) FOR [ClientVersion]
GO
/****** Object:  Default [DF_MobileKindItem_ResVersion]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[MobileKindItem] ADD  CONSTRAINT [DF_MobileKindItem_ResVersion]  DEFAULT ((0)) FOR [ResVersion]
GO
/****** Object:  Default [DF_MobileKindItem_SortID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[MobileKindItem] ADD  CONSTRAINT [DF_MobileKindItem_SortID]  DEFAULT ((0)) FOR [SortID]
GO
/****** Object:  Default [DF_MobileKindItem_KindMark]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[MobileKindItem] ADD  CONSTRAINT [DF_MobileKindItem_KindMark]  DEFAULT ((0)) FOR [KindMark]
GO
/****** Object:  Default [DF_MobileKindItem_Nullity]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[MobileKindItem] ADD  CONSTRAINT [DF_MobileKindItem_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_OnLineStatusInfo_InsertDateTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[OnLineStatusInfo] ADD  CONSTRAINT [DF_OnLineStatusInfo_InsertDateTime]  DEFAULT (getdate()) FOR [InsertDateTime]
GO
/****** Object:  Default [DF_OnLineStatusInfo_ModifyDateTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[OnLineStatusInfo] ADD  CONSTRAINT [DF_OnLineStatusInfo_ModifyDateTime]  DEFAULT (getdate()) FOR [ModifyDateTime]
GO
/****** Object:  Default [DF_OnLineStreamInfo_InsertDateTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[OnLineStreamInfo] ADD  CONSTRAINT [DF_OnLineStreamInfo_InsertDateTime]  DEFAULT (getdate()) FOR [InsertDateTime]
GO
/****** Object:  Default [DF_OnLineStreamInfo_AndroidCountSum]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[OnLineStreamInfo] ADD  CONSTRAINT [DF_OnLineStreamInfo_AndroidCountSum]  DEFAULT ((0)) FOR [AndroidCountSum]
GO
/****** Object:  Default [DF_OnLineStreamInfo_AndroidCountKind]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[OnLineStreamInfo] ADD  CONSTRAINT [DF_OnLineStreamInfo_AndroidCountKind]  DEFAULT ('') FOR [AndroidCountKind]
GO
/****** Object:  Default [DF__PersonalR__Score__47C69FAC]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalRoomScoreInfo] ADD  CONSTRAINT [DF__PersonalR__Score__47C69FAC]  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF__PersonalR__WinCo__48BAC3E5]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalRoomScoreInfo] ADD  CONSTRAINT [DF__PersonalR__WinCo__48BAC3E5]  DEFAULT ((0)) FOR [WinCount]
GO
/****** Object:  Default [DF__PersonalR__LostC__49AEE81E]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalRoomScoreInfo] ADD  CONSTRAINT [DF__PersonalR__LostC__49AEE81E]  DEFAULT ((0)) FOR [LostCount]
GO
/****** Object:  Default [DF__PersonalR__DrawC__4AA30C57]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalRoomScoreInfo] ADD  CONSTRAINT [DF__PersonalR__DrawC__4AA30C57]  DEFAULT ((0)) FOR [DrawCount]
GO
/****** Object:  Default [DF__PersonalR__FleeC__4B973090]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalRoomScoreInfo] ADD  CONSTRAINT [DF__PersonalR__FleeC__4B973090]  DEFAULT ((0)) FOR [FleeCount]
GO
/****** Object:  Default [DF_PersonalRoomScoreInfo_PlayBackCode]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalRoomScoreInfo] ADD  CONSTRAINT [DF_PersonalRoomScoreInfo_PlayBackCode]  DEFAULT ((0)) FOR [PlayBackCode]
GO
/****** Object:  Default [DF_PersonalRoomScoreInfo_ChairID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalRoomScoreInfo] ADD  CONSTRAINT [DF_PersonalRoomScoreInfo_ChairID]  DEFAULT ((0)) FOR [ChairID]
GO
/****** Object:  Default [DF_PersonalRoomScoreInfo_KindID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalRoomScoreInfo] ADD  CONSTRAINT [DF_PersonalRoomScoreInfo_KindID]  DEFAULT ((0)) FOR [KindID]
GO
/****** Object:  Default [DF_PersonalTableFee_DrawCountLimit]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalTableFee] ADD  CONSTRAINT [DF_PersonalTableFee_DrawCountLimit]  DEFAULT ((0)) FOR [DrawCountLimit]
GO
/****** Object:  Default [DF_PersonalTableFee_DrawTimeLimit]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalTableFee] ADD  CONSTRAINT [DF_PersonalTableFee_DrawTimeLimit]  DEFAULT ((0)) FOR [DrawTimeLimit]
GO
/****** Object:  Default [DF_PersonalTableFee_TableFee]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalTableFee] ADD  CONSTRAINT [DF_PersonalTableFee_TableFee]  DEFAULT ((0)) FOR [TableFee]
GO
/****** Object:  Default [DF__PersonalT__IniSc__023D5A04]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[PersonalTableFee] ADD  DEFAULT ((0)) FOR [IniScore]
GO
/****** Object:  Default [DF__RecordBac__Score__0B27A5C0]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[RecordBackInfo] ADD  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_SigninConfig_RewardGold]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SigninConfig] ADD  CONSTRAINT [DF_SigninConfig_RewardGold]  DEFAULT ((0)) FOR [RewardGold]
GO
/****** Object:  Default [DF_SystemMessage_MessageOption]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_MessageOption]  DEFAULT ((3)) FOR [MessageType]
GO
/****** Object:  Default [DF_SystemMessage_ServerRange]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_ServerRange]  DEFAULT ((0)) FOR [ServerRange]
GO
/****** Object:  Default [DF_SystemMessage_StartTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO
/****** Object:  Default [DF_SystemMessage_ConcludeTime]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_ConcludeTime]  DEFAULT (dateadd(year,(1),getdate())) FOR [ConcludeTime]
GO
/****** Object:  Default [DF_SystemMessage_Nullity]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_Nullity]  DEFAULT ((0)) FOR [Nullity]
GO
/****** Object:  Default [DF_SystemMessage_CreateDate]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_SystemMessage_CreateMasterID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_CreateMasterID]  DEFAULT ((0)) FOR [CreateMasterID]
GO
/****** Object:  Default [DF_SystemMessage_LastUpdateDate]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_LastUpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
/****** Object:  Default [DF_SystemMessage_UpdateMasterID]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_UpdateMasterID]  DEFAULT ((0)) FOR [UpdateMasterID]
GO
/****** Object:  Default [DF_SystemMessage_UpdateCount]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_UpdateCount]  DEFAULT ((0)) FOR [UpdateCount]
GO
/****** Object:  Default [DF_SystemMessage_CollectNote]    Script Date: 05/19/2017 17:38:33 ******/
ALTER TABLE [dbo].[SystemMessage] ADD  CONSTRAINT [DF_SystemMessage_CollectNote]  DEFAULT ('') FOR [CollectNote]
GO
/****** Object:  Table [dbo].[PersonalRoomInfo]    Script Date: 07/17/2017 17:02:35 ******/

ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((0)) FOR [IsJoinGame]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((0)) FOR [MinPeople]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((8)) FOR [MaxPeople]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((10000)) FOR [PersonalRoomTax]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((100)) FOR [MaxCellScore]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((32)) FOR [CanCreateCount]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((0)) FOR [CreateRight]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((100)) FOR [PlayTurnCount]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((180000)) FOR [PlayTimeLimit]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((180000)) FOR [TimeAfterBeginCount]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((180000)) FOR [TimeOffLineCount]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((180000)) FOR [TimeNotBeginGame]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  DEFAULT ((180000)) FOR [TimeNotBeginAfterCreateRoom]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  CONSTRAINT [DF_PersonalRoomInfo_BeginFreeTime]  DEFAULT ((0)) FOR [BeginFreeTime]
GO
ALTER TABLE [dbo].[PersonalRoomInfo] ADD  CONSTRAINT [DF_PersonalRoomInfo_EndFreeTime]  DEFAULT ((0)) FOR [EndFreeTime]
GO
/****** Object:  Default [DF_GameRoomInfo_PersonalRule]    Script Date: 11/23/2017 18:02:21 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_GameRoomInfo_PersonalRule]') AND parent_object_id = OBJECT_ID(N'[dbo].[GameRoomInfo]'))
Begin
	IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_GameRoomInfo_PersonalRule]') AND type = 'D')
	BEGIN
	ALTER TABLE [dbo].[GameRoomInfo] ADD  CONSTRAINT [DF_GameRoomInfo_PersonalRule]  DEFAULT ('') FOR [PersonalRule]
	END
END
/****** Object:  Default [DF__PersonalC__CellS__40F9A68C]    Script Date: 11/23/2017 18:02:21 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__PersonalC__CellS__40F9A68C]') AND parent_object_id = OBJECT_ID(N'[dbo].[PersonalCellScore]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__PersonalC__CellS__40F9A68C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PersonalCellScore] ADD  DEFAULT ((0)) FOR [CellScore]
END
end
GO