----------------
  新建学习经历
----------------
load csv with headers from "ftp://opsrv.mapout.lan/public/study_resume.csv" as csvLine with csvLine

merge (school:School{id:csvLine.school_id})
ON CREATE SET school.name = csvLine.school
ON MATCH SET school.name = csvLine.school
 with school,csvLine

merge (academy:Academy{id:csvLine.academy_id}) 
on create set academy.name = csvLine.academy
on match set academy.name = csvLine.academy
with academy,school,csvLine

merge (school)-[:include_academy]->(academy)
with academy,csvLine

merge (person:Person{id:csvLine.id_index}) 
with person,academy,csvLine

merge (person)-[r:study_at]->(academy)
on create set r.study_id = csvLine.id_index_new,r.start_time = csvLine.start_time,r.end_time = csvLine.end_time 