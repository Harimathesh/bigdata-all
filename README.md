Prerequisites

- Docker installed on your system
- At least 4GB RAM for smooth operation

1. Download the zip file
2. Extract them
3. Within the path type cmd
4. Redirected to Command Prompt.

Commands to be given in Command Prompt:

   1. docker build -t harimathesh/docker-hbase:latest .

   2. docker run -d --name hbase-container -p 2181:2181 -p 16010:16010 -p 9870:9870 -p 8088:8088 harimathesh/docker-hbase:latest

It is too simple and easy to use..
