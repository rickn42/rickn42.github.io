+++
title = "Opengl_install"
date =  2017-12-20T11:42:22+09:00
weight = 10
chapter = false
+++

### install opengl on windows & setup visual studio 

#### 1. opengl 다운로드

(openGL homepage)[https://www.opengl.org/]

-> top nav: click `Coding Resources`
-> right nav: click `GULT`
-> download `Pre-compiled Win32 for Intel GLUT 3.7 DLLs for Windows 95 & NT`

#### 2. glut.h 저장

아래 설정 경로를 보고 해당 위치에 복사한다.

visual studio project properties
-> VC++ directory
-> include directory
-> C:\Program Files (x86)\Windows Kits\10\include\10.0.xxxxxx\um\gl


#### 3. glut.lib, glut32.lib 저장

아래 설정 경로를 보고 해당위치에 복사한다.

visual studio project properties
-> VC++ directory
-> library directory
-> C:\Program Files (x86)\Windows Kits\10\lib\10.0.xxxxxx\um\x86

#### 4. glut.dll, glut32.dll 저장

C:\Windows\SysWOW64
C:\Windows\System32

### 5. vs 프로젝트 링커 설정

링커의 추가 의존성경로에 `glut32.lib` 을 추가한다. 

visual studio project properties
-> linker
-> input
-> additional dependencies

