---
title: "Cygwin Package"
date: 2017-12-01T17:31:32+09:00
weight: 6
chapter: false
---

### Cygwin package install

기본적으로 cygwin installer 설치할때 패키지 설정에서 설치하고자 하는 패키지를 선택하면 설치가 된다. 

문제는 추가로 패키지를 설치하고 싶을때 다시 인스톨러 실행을 시켜야 한다는 점이 불편하다. 

찾아보니 `apt-cyg` 를 설치하면 우분투의 `apt-get` 처럼 사용이 가능하다. 

(https://github.com/transcode-open/apt-cyg)

설치와 사용방법은 아래처럼 간단하다. 

```
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin

apt-cyg install nano
```

단, Cygwin 설치할때 필요한 `lynx` 패키지 설치가 필요하다. 

그밖에 추천 패키지

- bash-completion
- wget, curl 
- vim 
- git, git-svn
- rxvt-unicode (better console) 