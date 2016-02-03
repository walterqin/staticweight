VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CSectionCode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'����������
Option Explicit
'=========================================================================================================
'����
'=========================================================================================================
Const conSection = "Code"

'=========================================================================================================
'�ֲ�����
'=========================================================================================================

'=========================================================================================================
'����
'=========================================================================================================
Private m_Ini As CGdhINI    'ָ�����������ini�ļ�

Private m_Port As Integer       '�˿�
Private m_Settings As String   '�˿�����
Private m_BoardNo As Integer    '���Ű�װλ��

'=========================================================================================================
'����
'=========================================================================================================
'���ļ��ж�����key
Public Sub GetAllKeys()
    m_Port = m_Ini.GetLong(conSection, "Port", 2)
    m_Settings = m_Ini.GetString(conSection, "Settings", "115200,n,8,1")
    m_BoardNo = m_Ini.GetInteger(conSection, "TNBoardNo", 2)
    If m_BoardNo < 0 Or m_BoardNo > 2 Then
        m_BoardNo = 2
    End If
End Sub

'=========================================================================================================
'����
'=========================================================================================================
'ini
Public Property Set Ini(vData As CGdhINI)
    Set m_Ini = vData
End Property

'Port
Public Property Let Port(vData As Integer)
    m_Port = vData
    m_Ini.SaveInteger conSection, "Port", m_Port
End Property

Public Property Get Port() As Integer
    Port = m_Port
End Property

'Settings
Public Property Let Settings(vData As String)
    m_Settings = vData
    m_Ini.SaveString conSection, "Settings", m_Settings
End Property

Public Property Get Settings() As String
    Settings = m_Settings
End Property

'BoardNo
Public Property Let BoardNo(vData As Integer)
    m_BoardNo = vData
    m_Ini.SaveInteger conSection, "TNBoardNo", m_BoardNo
End Property

Public Property Get BoardNo() As Integer
    BoardNo = m_BoardNo
End Property

