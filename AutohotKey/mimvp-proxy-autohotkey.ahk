; AutohotKey ֧�� http
;
; ���˴���ʾ����
; http://proxy.mimvp.com/demo2.php
; 
; ���˴�����
; http://proxy.mimvp.com
; 
; mimvp.com
; 2016-11-29


MIMVP_PROXY_NOAUTH := 2
MIMVP_PROXY_AUTH := 1

;~ ���������
proxy_http := "138.68.165.154:3128"

;~ Ҫ���ʵ�Ŀ��ҳ��
mimvp_url := "http://proxy.mimvp.com/exist.php"
mimvp_url2 = "https://proxy.mimvp.com/exist.php"

whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.SetTimeouts(30000,30000,30000,30000) 			;~ Set timeouts to 30 seconds

whr.Open("GET", mimvp_url, true)
whr.SetRequestHeader("User-Agent", "curl/7.41.0")	;~ ģ��curl��ua���������


;~ ���ô��������
whr.SetProxy(MIMVP_PROXY_NOAUTH, proxy_http)

;~ ���ô��������֤��Ϣ
;whr.SetCredentials('mimvp-user', 'mimvp-pass', MIMVP_PROXY_AUTH)

whr.Send()
whr.WaitForResponse()

MsgBox % whr.ResponseText  ; ���뵽��Ϣ����ҳ����̫������ʾ������


; �򿪶Ի���ѡ���ļ���д����������ҳ����
FileSelectFile, resultName, S16,, Create a new file:
if (resultName = "")
	return
	
outFile := FileOpen(resultName , "w" , "utf-8")
if !IsObject(outFile)
{
	MsgBox , ���ܴ��ļ�: %resultName%
	return 
}
outFile.write(whr.ResponseText)
outFile.Close()
    