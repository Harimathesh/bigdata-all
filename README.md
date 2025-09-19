**Prerequisties**

Before running queries, set the following Hive properties inside the Hive CLI:

SET hive.support.concurrency = true;

SET hive.enforce.bucketing = true;

SET hive.exec.dynamic.partition.mode = nonstrict;

SET hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;

SET hive.compactor.initiator.on = true;

SET hive.compactor.worker.threads = 1;

**For Neo4j:**

Username:neo4j

Password:test12345

**WordCount and Student Marks Analysis (MapReduce)**

**Execution**

python3 student_marks.py mapper < marks.txt

python3 student_marks.py reducer < <(python3 student_marks.py mapper < marks.txt)





