# Day 1

## skynet 模型
- 基于actor模型： 状态，行为，邮箱;
- 每个actor有自己的邮箱， 当actor之间通信时， 就向对方的邮箱中发送消息;
- 有一个全局队列保存每个有消息的actor， 当actor中有消息时就插入全局队列;
- 工作线程（根据CPU数量进行设置）从全局队列中获取有有效的actor，取出其中的消息进行处理;

## 安装及配置
### 安装
```
git clone https://github.com/cloudwu/skynet.git
cd skynet
make 'PLATFORM'  # PLATFORM can be linux, macosx, freebsd now
```

### 配置
#### 配置项说明
参看skynetwiki，以后再总结补充
#### 外部工程模式的配置方式
等待补充

### 服务API基础
