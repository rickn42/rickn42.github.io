+++
title = "Ssh Key"
date =  2017-11-20T09:57:02+09:00
weight = 2
+++

### ssh keygen

```bash
$ ssh-keygen
$ cat ~/.ssh/id_rsa.pub
```

### ssh key add 

```bash
$ eval $(ssh-agent -s)
$ ssh-add ~/.ssh/id_rsa
```

### check ssh to github.com

```bash
$ ssh -T git@githbu.com
```

### add public key to github

Github 의 내 `settings` 페이지로 들어가서 

`SSH and GPG keys` 탭에 들어가면 new ssh key 버튼이 있다. 

새로 만들기에 id_ras.pub 내용을 복붙하면 된다. 

