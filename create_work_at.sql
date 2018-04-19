------------------------------------------------------------------
  新建工作经历（共分为10个文档，根据work_resume后面的标号来区别）
------------------------------------------------------------------
using periodic commit 500
load csv with headers from "ftp://opsrv.mapout.lan/public/work_resume0-3.csv" as csvLine with csvLine

merge (institution:Institution{id:csvLine.institution_id, name: csvLine.institution})
with institution,csvLine

match (loc:Location{id:csvLine.work_place_id}) 
merge (institution)-[:located_in]->(loc)
with csvLine,institution

merge (position:Position{id:csvLine.position_id,name:csvLine.position})
with position,csvLine,institution

merge (institution)-[:include_position]->(position)
with position,csvLine

match (person:Person{id:csvLine.id_index}) 
create (person)-[r:work_at{start_time:csvLine.start_time,end_time:csvLine.end_time,work_id:csvLine.id_index_new}]->(positio