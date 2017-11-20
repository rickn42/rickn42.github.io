+++
title = "Cygwin Font"
date =  2017-11-20T10:32:52+09:00
weight = 4
+++

### cygwin 폰트 설정

기본이 UTF-8 로 되어있어서 윈도우에서 가져오는 한글이 깨진다.

ex)
```raw
$ ipconfig

Windows IP ▒▒▒▒


▒̴▒▒▒ ▒▒▒▒▒ vEthernet (nat):

   ▒▒▒Ằ DNS ▒▒▒̻▒. . . . :
   ▒▒ũ-▒▒▒▒ IPv6 ▒ּ▒ . . . . : ...
   IPv4 ▒ּ▒ . . . . . . . . . : ...
   ▒▒▒▒▒ ▒▒▒▒ũ . . . . . . . : ...
   ▒⺻ ▒▒▒▒Ʈ▒▒▒▒ . . . . . . :

```

options -> Text 설정으로 가서 아래처럼 바꾸면 된다.

```raw
Locale = ko_KR
Character set = eucKR
```

```raw
$ ipconfig

Windows IP 구성


이더넷 어댑터 vEthernet (nat):

   연결별 DNS 접미사. . . . :
   링크-로컬 IPv6 주소 . . . . : ...
   IPv4 주소 . . . . . . . . . : ...
   서브넷 마스크 . . . . . . . : ...
   기본 게이트웨이 . . . . . . :
```