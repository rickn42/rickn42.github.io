+++
title = "Docker Vitualbox Port Forwarding"
date =  2017-12-14T17:09:19+09:00
weight = 8
chapter = false
+++

### virtualbox docker port forwarding

윈도우에서 toolbox 로 도커를 사용하게 되면, 

버추얼박스로 도커 머신을 띄우고 거기에 접속하는 형식이 된다. 

문제는 Kitematic 으로 도커 포트를 연결하면 

192.168.99.100 ip 로 고정되어 포워딩 되기 때문에 

윈도우에서 localhost 로 연결이 안된다. 

한가지 방법은 

`virtualbox` 의 도커머신 세팅에 들어가서 

`setting -> network -> adapter 1 advanced -> port forwarding` 으로 들어가서 

연결하고자 하는 포트를 (192.168.99.100 -> localhost) 추가해주면 된다.