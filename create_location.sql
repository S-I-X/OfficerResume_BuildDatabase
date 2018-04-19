----------
//节点ID唯一限制 Unique Property constraint!
CREATE CONSTRAINT ON (n:Location) ASSERT n.id IS UNIQUE
CREATE CONSTRAINT ON (n:Person) ASSERT n.id IS UNIQUE
CREATE CONSTRAINT ON (n:School) ASSERT n.id IS UNIQUE

CREATE CONSTRAINT ON (n:Institution) ASSERT n.id IS UNIQUE
CREATE CONSTRAINT ON (n:Academy) ASSERT n.id IS UNIQUE
CREATE CONSTRAINT ON (n:Position) ASSERT n.id IS UNIQUE
--------
建立行政地区层级关系
-----------

create (loc:Location{name:"中国",id:"00111111100000000000"})

load csv with headers from "ftp://opsrv.mapout.lan/public/location.csv" as csvLine with csvLine
create(loc:Location{name:csvLine.location_name,id:csvLine.location_id}) with loc,csvLine
match (father_loc:Location{id:csvLine.previous_location_id}) create (father_loc)-[r:include_location]->(loc)