---
Neo4j sql文件相关说明
---
1. 本文件夹中保存了图数据库建库的的相关代码文件及文档，文件结构如下：  
  * create_location文件保存了构建行政地区的相关代码
  * create_is_from文件保存了构建出生地关系的相关代码
  * create_study_at文件保存了构建学习经历的相关代码
  * create_work_at文件保存了构建工作经历的相关代码  
  * 关系型数据库表结构中对id映射规则进行了说明，对各个表的数据字典也进行了说明。  
  * 图数据库文档对图数据库中的节点、节点属性、关系类型、关系属性以及结果图进行了说明。  
  * data文件夹中包含了数据导入所需的相关csv文件。

2. 数据导入所需的相关csv文件也存放在了公司ftp中，地址为ftp://opsrv.mapout.lan/public/。

3. 本项目所基于的图数据库版本是neo4j-community-3.3.1-windows。

4. 使用方法：登录到Neo4j服务器，然后在浏览器的命令行中输入相应文件中的代码。导入工作经历时候注意文件被拆分为了10个文件（work_resume0-3 ~work_resume33-36），需要更改文件名操作10次。
