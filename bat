@echo off
cd /d %~dp0
:: �뱣�����°�Ȩ��Ϣ лл
:: V2RAY ���� NGINX �� VMESS+WS+TLS+Website(Use Host)+Rinetd BBR һ����װ�ű�
:: https://github.com/dylanbai8/V2Ray_ws-tls_Website_onekey

%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
:: ��ȡ����ԱȨ�ޣ�����Ҫ��ɾ����ע�͵�

title -- v2ray��������ű� --
MODE con: COLS=60 lines=21
color 0a

:begin
cls
MODE con: COLS=60 lines=21
echo.
echo    ===== v2ray��������ű� =====
echo.
echo --[1]--����/����V2ray�����ش��ڣ�wv2ray.exe��
echo --[2]--��ʱ��������ʾ���̴���(v2ray.exe)
echo.
echo --[3]--��װ�������������񣨹���ԱȨ�ޣ�
echo --[4]--һ������ϵͳ����
echo.
echo --[5]--ж�ؿ������������񣨹���ԱȨ�ޣ�
echo --[6]--һ���ر�ϵͳ����
echo.
echo --[7]--�ر�v2ray��̨����
echo --[8]--�˳��ű�
echo.
echo --ע��--��ʱ�����в����������ٰ�װΪ����������
echo --ע��--���������汾����Ҫ�滻 \v2ray\ Ŀ¼
echo.
choice /c 12345678 /n /m "��ѡ��1-8����"
 
echo %errorlevel%
if %errorlevel% == 1 goto set_1
if %errorlevel% == 2 goto set_2
if %errorlevel% == 3 goto set_3
if %errorlevel% == 4 goto set_4
if %errorlevel% == 5 goto set_5
if %errorlevel% == 6 goto set_6
if %errorlevel% == 7 goto set_7
if %errorlevel% == 8 goto end 

:set_1
MODE con: COLS=80 lines=16
sc stop v2ray 1>nul 2>nul
taskkill /im wv2ray.exe /f 1>nul 2>nul
cls
echo.
echo.
echo ��������������....
echo.
echo.
echo --[����������̨����]--
echo.
sc start v2ray 1>nul 2>nul
start "" /d "%cd%\v2ray\" "wv2ray.exe" -config=%cd%\v2ray\config.json
ping localhost -n 2 1>nul 2>nul
tasklist /fi "imagename eq wv2ray.exe"
echo.
echo �����ɹ�������������ش���
ping localhost -n 3 1>nul 2>nul
exit

:set_2
sc stop v2ray 1>nul 2>nul
taskkill /im wv2ray.exe /f 1>nul 2>nul
cls
echo.
echo.
start "" /d "%cd%\v2ray\" "v2ray.exe" -config=%cd%\v2ray\config.json
goto begin

:set_3
MODE con: COLS=60 lines=20
sc stop v2ray 1>nul 2>nul
taskkill /im wv2ray.exe /f 1>nul 2>nul
cls
echo.
echo.
echo.
echo ���ڻ�ȡ������ԱȨ�ޡ������ڵ����˵��е㡾�ǡ�
echo.
echo.
echo --[���ڰ�װ����]--
echo.
%cd%\v2ray\wv2ray-service.exe install v2ray "%cd%\v2ray\wv2ray.exe"
%cd%\v2ray\wv2ray-service.exe set v2ray Start SERVICE_AUTO_START
%cd%\v2ray\wv2ray-service.exe set v2ray DisplayName "V2ray Auto Start"
%cd%\v2ray\wv2ray-service.exe set v2ray Description "V2ray ���������������ػ����̣�"
echo.
echo.
echo ����װ�ɹ�������������������������ڵ����˵��е㡾�ǡ�
pause>nul
MODE con: COLS=80 lines=16
echo.
echo.
echo V2ray��������������....
echo.
echo.
echo --[������������]--
sc start v2ray 1>nul 2>nul
echo.
ping localhost -n 2 1>nul 2>nul
tasklist /fi "imagename eq wv2ray.exe"
echo.
echo ���������ɹ�������������ؿ�ʼ�˵�
pause>nul
goto begin

:set_4
MODE con: COLS=60 lines=20
cls
echo.
echo.
echo.
echo ��ʼ����ϵͳ����
echo Internetѡ��-����-����������-���������
echo.
echo  --[���ڳ��򽫹ر�����ie�����]--
taskkill /f /im iexplore.exe 1>nul 2>nul
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "127.0.0.1:1087" /f
echo.
echo  --[�ѳɹ����ô������������]--
echo.
echo ע�⣺�����ر�v2ray����ʱ��ͬʱ�ر�ϵͳ����
echo       ���򽫵���ϵͳ�޷�����
echo.
echo ����������ؿ�ʼ�˵�
pause>nul
goto begin

:set_5
MODE con: COLS=60 lines=14
sc stop v2ray 1>nul 2>nul
taskkill /im wv2ray.exe /f 1>nul 2>nul
cls
echo.
echo.
echo.
echo ���ڻ�ȡ������ԱȨ�ޡ������ڵ����˵��е㡾�ǡ�
echo.
echo --[����ж������������]--
%cd%\v2ray\wv2ray-service.exe remove v2ray confirm
echo.
echo ж�سɹ�������������ؿ�ʼ�˵�
pause>nul
goto begin

:set_6
MODE con: COLS=60 lines=17
cls
echo.
echo.
echo.
echo ��ʼ����ȡ��ϵͳ����
echo Internetѡ��-����-����������-���������
echo.
echo  --[���ڳ��򽫹ر����������]--
taskkill /f /im iexplore.exe 1>nul 2>nul
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f
echo.
echo  --[��ȡ���������������]--
echo.
echo ����������ؿ�ʼ�˵�
pause>nul
goto begin

:set_7
MODE con: COLS=60 lines=11
cls
echo.
echo.
echo.
echo �ر�v2ray��̨�����񣩽���....
echo.
echo --[���ڹر�v2ray����]--
sc stop v2ray 1>nul 2>nul
taskkill /im wv2ray.exe /f 1>nul 2>nul
echo.
echo �رճɹ�������������ؿ�ʼ�˵�
pause>nul
goto begin

:end
exit
