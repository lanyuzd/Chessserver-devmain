#ifndef TABLE_FRAME_SINK_HEAD_FILE
#define TABLE_FRAME_SINK_HEAD_FILE

#pragma once

#include "Stdafx.h"
#include "AfxTempl.h"
#include "GameLogic.h"
#include "HistoryScore.h"
#include "ServerControl.h"
#include "GameVideo.h"
//////////////////////////////////////////////////////////////////////////

//用户追踪
struct tagUserTracing
{
	LONGLONG						lWinScore;								//胜利积分
	LONGLONG						lVarietyScore;							//变化积分
	SYSTEMTIME						SystemTimeTrace;						//记录时间
};

//索引定义
typedef CMap<DWORD,DWORD,DWORD,DWORD> CBlackListIDMap;
typedef CMap<DWORD,DWORD,DWORD,DWORD> CUserAddressMap;
typedef CMap<DWORD,DWORD,tagUserTracing *,tagUserTracing * &> CUserTracingMap;

//////////////////////////////////////////////////////////////////////////

//游戏桌子
class CTableFrameSink : public ITableFrameSink, public ITableUserAction
{
	//游戏变量
protected:
	bool							m_bShowHand;						//梭哈标志
	bool							m_bChaosCard;						//混乱扑克
	WORD							m_wCurrentUser;						//当前用户
	LONGLONG						m_lServiceCharge;					//服务费
	CString							m_strPalyName[GAME_PLAYER];			//玩家名字
	WORD							m_wPlayerCount;								//游戏人数
	//私人房信息
	bool								m_bPersonalRoom;					//私人房标识
	LONGLONG					m_lPersonalInitScore;					//初始分
	LONGLONG					m_lPersonalCellScore;					//底分
	BYTE								m_cbPersonalGameCount;			//局数
	BYTE								m_cbPlayerCount;						//玩家人数0表示2-5人，2345对应人数
	CMD_S_RECORD				m_stRecord;							//游戏记录
	//下注信息
protected:
	LONGLONG						m_lDrawMaxScore;					//最大下注
	LONGLONG						m_lTurnMaxScore;					//最大下注
	LONGLONG						m_lTurnLessScore;					//最小下注
	LONGLONG						m_lDrawCellScore;					//底注积分

	//用户状态
protected:
	BYTE							m_cbPlayStatus[GAME_PLAYER];		//游戏状态
	BYTE							m_cbOperaScore[GAME_PLAYER];		//操作标志
	bool							m_bGiveUp[GAME_PLAYER];				//放弃状态

	//金币信息
protected:
	LONGLONG						m_lUserScore[GAME_PLAYER];			//用户下注
	LONGLONG						m_lTableScore[GAME_PLAYER];			//桌面下注
	LONGLONG						m_lUserMaxScore[GAME_PLAYER];		//最大下注

	//扑克变量
protected:
	BYTE							m_cbSendCardCount;					//发牌数目
	BYTE							m_cbCardCount[GAME_PLAYER];			//扑克数目
	BYTE							m_cbHandCardData[GAME_PLAYER][5];	//桌面扑克

	//组件变量
protected:
	CGameLogic						m_GameLogic;						//游戏逻辑
	CHistoryScore					m_HistoryScore;						//历史成绩

	//服务控制
protected:
	HINSTANCE						m_hControlInst;
	IServerControl*					m_pServerContro;

	//游戏视频
protected:
	HINSTANCE						m_hVideoInst;
	IGameVideo*						m_pGameVideo;

	//组件接口
protected:
	ITableFrame	*					m_pITableFrame;						//框架接口
	tagGameServiceOption *			m_pGameServiceOption;				//服务配置

	//限制变量
protected:
	static bool						g_bControl;							//调控标志
	static LONGLONG					g_lMaxWinScore;						//最大赢分
	static LONGLONG					g_lMaxVarietycore;					//最大赢分

	//索引变量
protected:
	static CUserTracingMap			g_UserTracingMap;					//用户记录
	static CUserAddressMap			g_UserAddressMap;					//限制地址
	static CBlackListIDMap			g_BlackListIDMap;					//限制用户

	//库存量
protected:
	LONGLONG						m_lStorageDeduct;						//回扣变量
	LONGLONG						m_lStorageMax;							//库存封顶
	LONGLONG						m_nStorageMul;							//系统输钱比例

	bool							m_bAllAndroid;						//全部机器人
	static LONGLONG					g_lStockScore;						// 总输赢分
	static LONGLONG					g_lRobotScoreMin;					// 积分低于取款
	static LONGLONG					g_lRobotScoreMax;					// 积分高于存款
	static LONGLONG					g_lRobotBankTake[2];				// 取款额度
	static LONGLONG					g_lRobotBankSave;					// 存款额度


	//函数定义
public:
	//构造函数
	CTableFrameSink();
	//析构函数
	virtual ~CTableFrameSink();

	//基础接口
public:
	//释放对象
	virtual VOID Release();
	//接口查询
	virtual VOID * QueryInterface(REFGUID Guid, DWORD dwQueryVer);

	//管理接口
public:
	//配置桌子
	virtual bool Initialization(IUnknownEx * pIUnknownEx);
	//复位桌子
	virtual VOID RepositionSink();

	//查询接口
public:
	//查询限额
	virtual SCORE QueryConsumeQuota(IServerUserItem * pIServerUserItem){return 0;}
	//最少积分
	virtual SCORE QueryLessEnterScore(WORD wChairID, IServerUserItem * pIServerUserItem){return 0;}
	//查询是否扣服务费
	virtual bool QueryBuckleServiceCharge(WORD wChairID){return true;}

	//比赛接口
public:
	//设置基数
	virtual void SetGameBaseScore(LONG lBaseScore){};

public:
	//数据事件
	virtual bool OnDataBaseMessage(WORD wRequestID, VOID * pData, WORD wDataSize){return false;}
	//积分事件
	virtual bool OnUserScroeNotify(WORD wChairID, IServerUserItem * pIServerUserItem, BYTE cbReason){return false;}

	//游戏事件
public:
	//游戏开始
	virtual bool OnEventGameStart();
	//游戏结束
	virtual bool OnEventGameConclude(WORD wChairID, IServerUserItem * pIServerUserItem, BYTE cbReason);
	//发送场景
	virtual bool OnEventSendGameScene(WORD wChairID, IServerUserItem * pIServerUserItem, BYTE cbGameStatus, bool bSendSecret);

	//事件接口
public:
	//定时器事件
	virtual bool OnTimerMessage(DWORD dwTimerID, WPARAM wBindParam);
	//游戏消息
	virtual bool OnGameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize, IServerUserItem * pIServerUserItem);
	//框架消息
	virtual bool OnFrameMessage(WORD wSubCmdID, VOID * pData, WORD wDataSize, IServerUserItem * pIServerUserItem);

	//用户事件
public:
	//用户断线
	virtual bool OnActionUserOffLine(WORD wChairID, IServerUserItem * pIServerUserItem) { return true; }
	//用户重入
	virtual bool OnActionUserConnect(WORD wChairID, IServerUserItem * pIServerUserItem) { return true; }
	//用户坐下
	virtual bool OnActionUserSitDown(WORD wChairID, IServerUserItem * pIServerUserItem, bool bLookonUser);
	//用户起立
	virtual bool OnActionUserStandUp(WORD wChairID, IServerUserItem * pIServerUserItem, bool bLookonUser);
	//用户同意
	virtual bool OnActionUserOnReady(WORD wChairID, IServerUserItem * pIServerUserItem, VOID * pData, WORD wDataSize) { return true; }

	//游戏事件
protected:
	//用户放弃
	bool OnUserGiveUp(WORD wChairID);
	//用户加注
	bool OnUserAddScore(WORD wChairID, LONGLONG lScore);
	//获取胜者
	bool OnUserGetWinner(IServerUserItem * pIServerUserItem);

	//辅助函数
protected:
	//调整下注
	VOID RectifyMaxScore();
	//发送扑克
	VOID DispatchUserCard();

	//调控函数
protected:
	//调控扑克
	VOID ControlUserCard();
	//积分事件
	VOID OnEventScoreAlter(DWORD dwUserID, LONGLONG lVarietyScore);

	//逻辑辅助
protected:
	//推断输者
	WORD EstimateLoser(BYTE cbStartPos, BYTE cbConcludePos);
	//推断胜者
	WORD EstimateWinner(BYTE cbStartPos, BYTE cbConcludePos);
	//发送库存
	void SendStorage();
	//写日志文件
	void WriteInfo(LPCTSTR pszFileName, LPCTSTR pszString);
};

//////////////////////////////////////////////////////////////////////////

#endif