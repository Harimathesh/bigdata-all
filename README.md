# docker-hbase
A lightweight setup to quickly launch Apache HBase in standalone mode using Docker. Includes port mappings for the HBase Web UI and APIs, ideal for local development, testing, and experimentation without manual installation.

1. Prerequisites
- Install [Docker Desktop](https://www.docker.com/products/docker-desktop)  
- Ensure Docker is running:
      docker version

2.Clone the Repository
  git clone https://github.com/Harimathesh/docker-hbase.git
  cd docker-hbase

3.Run in Command Prompt
  run-hbase.bat

4.Access HBase

  Web UI: http://localhost:16010 --to access Apache Hbase

5.Stop & Remove Container

  docker stop hbase-docker
  docker rm hbase-docker


