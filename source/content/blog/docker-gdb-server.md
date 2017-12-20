+++
title = "Docker Gdb Server"
date =  2017-12-20T11:23:17+09:00
weight = 9
chapter = false 
+++

### Docker GDB Server


#### gdb 리눅스 준비

윈도우에서 gdb 를 이용해서 원격에서 빌드할때 리눅스(우분투) 세팅은 아래와 같다. 

우분투에 gdb 깔고 ssh 접근이 가능하면 준비 끝. 

```
$ apt-get install build-essential gdb gdbserver openssl-server
$ service ssh start
``` 


#### 비주얼 스튜디오 원격 설정

[마소 linux 프로젝트 문서](https://docs.microsoft.com/ko-kr/cpp/linux/deploy-run-and-debug-your-linux-project) 를 보면 쉽게 따라할 수 있다. 


#### 도커로 gdb 서버 띄우기

문제는! 그냥 도커로 띄우게 되면 도커의 커널 접근 권한이 없어서 에러가 발생한다. 

`unexpected gdb output from command ...` 

이때는 도커를 띄울때 -privileged 옵션을 주면 된다. 

```
$ docker run --privileged -p22:22 -it --name gdbserver ubuntu:16.04 /bin/bash
``` 

이제 비주얼 스튜디오로 디버깅 실행하면 잘 된다.
