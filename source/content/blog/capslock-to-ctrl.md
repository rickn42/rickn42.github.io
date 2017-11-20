+++
title = "Capslock to Ctrl"
date =  2017-11-20T10:10:19+09:00
weight = 3
+++

### windows capslock to ctrl

regedit 으로 레지스터 편집기에 들어가서 

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout] 에서

바이너리값 새로만들기로 `Scancode Map` 을 추가해서 아래와 같은 이진값을 넣는다.

그리고 재시작.

```
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00
```


#### via powershell

```powershell
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};

$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';

New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
```