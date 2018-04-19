load csv with headers from "ftp://opsrv.mapout.lan/public/link.csv" as csvLine with csvLine
merge(a:Person{id:csvLine.people_id_new}),(b:Person{id:csvLine.link_id_new})
with a,b,csvLine
merge(a)-[r:link]->(b) 

//删除link关系
match(a:Person)-[r:link]->(b:Person)
delete r

//向link关系中添加属性
1 merge(a:Person)-[r:link]->(b:Person)
set r.lastlink = csvLine.lastlink,r.linklocation = csvLine.linklocation,r.personsnum=csvLine.personsnum

2 load csv with headers from "ftp://opsrv.mapout.lan/link.csv" as csvLine with csvLine
merge(a:Person{id:csvLine.people_id_new}),(b:Person{id:csvLine.link_id_new})
with a,b,csvLine
merge(a)-[r:link{lastlink:csvLine.lastlink,linklocation:csvLine.lastlocation,personsnum:csvLine.personsnum}]->(b) 
