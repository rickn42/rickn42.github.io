+++
title = "Docker Elk"
date =  2017-12-14T16:30:27+09:00
weight = 7
chapter = false
+++

### docker machine vm.max_map_count

도커에서 elk 를 띄우기 위해서는 메모리 용량을 넉넉해야한다.

elasticsearch 가 기본적으로 2기가를 필요로 하기 때문이다. 

윈도우에서 docker toolbox 사용을 예로 들면, 

virtualbox 에서 도커머신 세팅에가서 일단은 메모리를 넉넉히 4G 로 잡아주고, 

스타트시킨 후에, 

`vi /var/lib/boot2docker/profile` 을 열어서 맨 아래에 

`sysctl vm.max_map_count=262144` 로 추가하고 저장하면 된다. 

이제 부팅할때에도 항상 높게 잡히게 된다. 

```
$ sysctl vm.max_map_count 
vm.max_map_count = 262144
```

로 확인해보면 된다. 
