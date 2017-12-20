+++
title = "Visual Studio Pthread"
date =  2017-12-20T14:28:20+09:00
weight = 10
chapter = false 
+++

### Visual Studio 에서 pthread 포함한 빌드하기

비주얼스튜디오로 gdb 이용해서 linux 빌드 중인데, 

소스에 pthread 가 들어갔지만, 

빌드하면 아래와 같이 참조를 찾을 수 없다고 한다. 

```
undefined reference pthread_detatch
undefined reference pthread_create
...
```

우분터 서버에서 복사한 `/usr/include` 에는 `pthread.h` 가 존재하는데 에러난다. 

찾아볼 결과, `-pthread` 옵션을 추가해야만 했다. 

비주얼 스튜디오의 프로젝트 설정에서, 

링커 - 모든 옵션 - 추가옵션 에 `-pthread` 를 추가하면 된다. 

