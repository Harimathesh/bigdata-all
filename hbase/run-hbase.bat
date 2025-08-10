@echo off
echo =========================================
echo   Building Docker image: harimathesh/hbase:latest
echo =========================================
docker build -t harimathesh/hbase:latest .

if %ERRORLEVEL% neq 0 (
    echo Build failed. Please check Dockerfile and try again.
    pause
    exit /b
)

echo =========================================
echo   Starting HBase container: myhbase
echo =========================================
docker run -d --name myhbase -p 2181:2181 -p 16010:16010 harimathesh/hbase:latest

if %ERRORLEVEL% neq 0 (
    echo Failed to start container. It may already exist.
    echo Attempting to remove existing container...
    docker rm -f myhbase
    echo Retrying start...
    docker run -d --name myhbase -p 2181:2181 -p 16010:16010 harimathesh/hbase:latest
)

echo =========================================
echo   HBase container is running!
echo   ZooKeeper Port: 2181
echo   HBase Master UI: http://localhost:16010
echo =========================================
pause
