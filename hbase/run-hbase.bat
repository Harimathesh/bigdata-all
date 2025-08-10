@echo off
REM =========================================
REM Run Apache HBase in Docker (Standalone)
REM =========================================

REM Container name
set CONTAINER_NAME=hbase-docker

REM Image name (change if you want a different one)
set IMAGE_NAME=harisekhon/hbase

REM HBase ports:
REM 16010 -> HBase Master UI
REM 16000 -> HBase Master RPC
REM 16020 -> RegionServer RPC
REM 9090  -> Thrift
REM 9095  -> Thrift Web UI

echo Pulling latest HBase Docker image...
docker pull %IMAGE_NAME%

echo Starting HBase container...
docker run -d ^
  --name %CONTAINER_NAME% ^
  -p 16010:16010 ^
  -p 16000:16000 ^
  -p 16020:16020 ^
  -p 9090:9090 ^
  -p 9095:9095 ^
  %IMAGE_NAME%

echo HBase is starting...
echo Access HBase UI at: http://localhost:16010
echo Use "docker logs -f %CONTAINER_NAME%" to see logs.
