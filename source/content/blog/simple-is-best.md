+++
title = "Simple Is Best"
date =  2017-10-31T20:31:24+09:00
weight = 4
chapter = false
+++

자그마한 개인 게임을 만드는데

각 agent 들이 **채널로 서로 커뮤니케이션 가능한** 라이브러리가 필요했다.

몇 일 공들여 라이브러리를 만들었다.

여러가지 내부 구조체를 선언하고 인터페이스 선언하고...

중간에 허브를 없애거나 채널이 떨어져나가도 고루틴 누수되지 않도록 하고...

공들여 영어 주석과 Readme 파일을 작성했다.

만드는 재미(?)에 빠져서 만들다 보니 겉보기엔 그럴듯하긴 한데...

기능에 비해 너무 덩치가 커졌다;;;

화려하긴 하나... 뭔가 불안정한거 같기도 하고 ㅜㅜ

[hub1 구경가기 구경하기](https://github.com/rickn42/hub)

---

그러다 오늘저녁 한시간도 안되서 Hub2 를 만들었다.

자잘한거 없이 그냥 필요에 따라서

<h3> in 채널 생성하기, out 채널 생성하기. 끗. </h3>

<h4>... 속도도 더 빠르다.</h4>

<h5>... 파일도 하나짜리...</h5>

역쉬...

### **심플 이즈 베스트** 구나.

[hub2 라이브러리 구경하기](https://github.com/rickn42/hub2)

---

그래도 삽질만은 아니였다.

백단 고루틴 다루는 스킬이 올라간 듯.

흠... 뭔가 스케치 방식이 더 잘 맞는거 같기도 하고...

몸으로 노가다 해가며 많이 만드는 방법이 현재로선 가장 나은듯.