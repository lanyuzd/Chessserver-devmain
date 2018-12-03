#ifndef INIR_PARAMETER_HEAD_FILE
#define INIR_PARAMETER_HEAD_FILE

#pragma once

#include "Stdafx.h"

//////////////////////////////////////////////////////////////////////////////////

//���ò���
class CInitParameter
{
	//������Ϣ
public:
	WORD							m_wConnectTime;						//����ʱ��
	WORD							m_wCollectTime;						//ͳ��ʱ��

	//Э����Ϣ
public:
	WORD							m_wCorrespondPort;					//Э���˿�
	tagAddressInfo					m_CorrespondAddress;				//Э����ַ

	//Լս������Ϣ
public:
	WORD							m_wPrsnlRmCorrespondPort;		//Լս����˿�
	tagAddressInfo			m_PrsnlRmCorrespondAddress;	//Լս�����ַ

	//������Ϣ
public:
	TCHAR							m_szServerName[LEN_SERVER];			//��������

	//�ֻ�����
public:
	WORD							m_wVisibleTableCount;				//����������
	WORD							m_wEverySendPageCount;				//ÿ�η���ҳ��

	//������Ϣ
public:
	tagAddressInfo					m_ServiceAddress;					//�����ַ
	tagDataBaseParameter			m_TreasureDBParameter;				//���ӵ�ַ
	tagDataBaseParameter			m_PlatformDBParameter;				//���ӵ�ַ
	tagGameServiceAttrib*			m_pGameServiceAttrib;				//��������
	tagGameServiceOption*			m_pGameServiceOption;				//��������

	//��������
public:
	//���캯��
	CInitParameter();
	//��������
	virtual ~CInitParameter();

	//���ܺ���
public:
	//��ʼ��
	VOID InitParameter();
	//��������
	VOID LoadInitParameter();
	//���ò���
	VOID SetServerParameter(tagGameServiceAttrib *pGameServiceAttrib, tagGameServiceOption *pGameServiceOption);
	//��ȡ�ֻ�����
	VOID ReadMobileParameter();
};

//////////////////////////////////////////////////////////////////////////////////

#endif