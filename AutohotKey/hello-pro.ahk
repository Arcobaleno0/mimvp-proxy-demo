#0::
msgbox, �����ҵĵ�һ��AutoHotkey�ű� `n �Ұ����˿Ƽ�
run, http://mimvp.com
return

#1::
run, http://proxy.mimvp.com/usercenter/login.php
WinActivate, Chrome ;��ֹ���ڲ�����
winwait, ���˴���   ;�ȴ���ҳ���سɹ�������title��ʾ������
sleep, 500          ;����������ٵ�0.5�루�����٣�
send, 'mimvp-user'{tab}'mimvp-pwd'{enter}  ;ģ��������˴���ĵ�¼�û��������롢�س�
return
