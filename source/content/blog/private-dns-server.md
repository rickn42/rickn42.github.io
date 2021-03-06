---
title: "Private Dns Server"
date: 2017-11-28T15:19:56+09:00
weight: 5
chapter: false
---

### 사설 dns 서버 구축

ref doc
http://html5around.com/wordpress/tutorials/ubuntu-bind9-local-dns-setup/

예) 아래 설정으로 dns 를 구축해보자.
```raw
도메인      zoo.local
ip         192.168.0.77
```

#### 우분투 BIND9 설치
```sh
$ sudo apt-get install bind9
```

#### `/etc/hosts`
```raw
127.0.0.1 zoo.local  localhost  # 원하는 내부 도메인명 등록
127.0.0.1 intranet  # 내부 호스트명, intranet.zoo.local 방식으로 접속하게 됨
```

#### `/etc/network/interfaces`
```raw
auto lo
iface lo inet loopback
 
auto eth0
iface eth0 inet static
 address 192.168.0.77       
 netmask 255.255.255.0
 network 192.168.0.0
 broadcast 192.168.0.255
 gateway 192.168.0.1 
 dns-nameserver 127.0.0.1   # 이 컴퓨터가 네임서버임을 의미
 dns-search zoo.local       # 검색시 zoo.local은 생략
 dns-domain zoo.local       # 내부 도메인 설정. 즉 intranet.zoo.local을 intranet만 쓰면 접속되도록 함.
```

#### 랜카드 재로딩
```bash
$ sudo ifdown eth0; ifup eth0
```

#### `/etc/bind/named.conf.options` 설정
```raw
options {
 //....

 // 내부 도메인이 없는 경우 외부 dns 로 연결
 forwarders {
     // google dns
     8.8.8.8;
     8.8.4.4;
 };

 //....
};
```

#### `/etc/bind/named.conf.local` 에 로컬 존 정보 추가하기
```raw
zone "zoo.local" IN {
    type master;
    file "/etc/bind/zones/zoo.local.db"; // 정방향 정보
};

zone "0.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/zones/rev.0.168.192.in-addr.arpa"; // 역방향 정보
};
```

#### `/etc/bind/zones/zoo.local.db` 파일 생성 (정방향 정보)
작성하기 편하기 위해 db.local 을 템플릿으로 이용하자.
```bash
$ mkdir /etc/bind/zones
$ cp /etc/bind/db.local /etc/bind/zones/zoo.local.db
```

```raw
;
; BIND data file for local loopback interface
;
$ORIGIN .
$TTL 604800
zoo.local. IN SOA intranet.zoo.local. master.zoo.local. (
 10 ; Serial
 604800 ; Refresh
 86400 ; Retry
 2419200 ; Expire
 604800 ) ; Negative Cache TTL
;
zoo.local. IN NS intranet.zoo.local.
zoo.local. IN A 192.168.0.77
;zoo.local. IN MX mail.zoo.local.
 
$ORIGIN zoo.local.
 
localhost IN A 127.0.0.1
gateway IN A 192.168.0.1

// 네임 서버
intranet IN A 192.168.0.77

// 로컬 서버 도메인
monkey IN A 192.168.0.81
dog IN A 192.168.0.82
cat IN A 192.168.0.83
...
```

#### `/etc/bind/zones/rev.0.168.192.in-addr.arpa` 파일 생성 (역방향 정보)
```raw
;
; BIND reverse data file for broadcast zone
;
$TTL 604800
@ IN SOA intranet.zoo.local. master.zoo.local. (
 14 ; Serial
 604800 ; Refresh
 86400 ; Retry
 2419200 ; Expire
 604800 ) ; Negative Cache TTL
;
@ IN NS intranet.zoo.local.
1 IN PTR gateway.zoo.local.

// 네임 서버
77 IN PTR intranet.zoo.local.

// 기타 내부 서버 도메인
81 IN PTR monkey.zoo.local.
82 IN PTR dog.zoo.local.
83 IN PTR cat.zoo.local.
...
```

#### 실행 확인 
```bash
$ cd /etc/bind
$ named-checkconf named.conf.local

$ cd /etc/bind/zones
$ named-checkzone zoo.local zoo.local.db

$ sudo service bind9 restart

$ host -l zoo.local
$ host 192.168.0.77
$ nslookup zoo.local

$ dig cat.zoo.local 
```