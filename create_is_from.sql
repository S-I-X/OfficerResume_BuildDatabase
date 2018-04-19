--------------------------
    新建关系 —— 出生地
--------------------------
load csv with headers from "ftp://opsrv.mapout.lan/public/person.csv" as csvLine with csvLine
merge (person:Person{name:csvLine.officer_name,id:csvLine.id_index}) with person,csvLine 
match (loc:Location{id:csvLine.place_of_birth_id}) 
merge(person)-[r:is_from]->(loc)
