e2e测试的docker容器
==================

# 用法  
在你的dockerfile文件中添加  
```
FROM cloudcube/nodejs-with-protractor
```  
It exposes:

selenium standalone server running on localhost:4444
vnc server running on localhost:5999, password: secret
Running:
```
docker pull cloudcube/nodejs-with-protractor
docker run --privileged -p 4444:4444 -p 5999:5999 -d cloudcube/nodejs-with-protractor
```
