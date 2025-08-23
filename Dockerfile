# ===========================================
# Hadoop 3.3.6 + HBase 2.6.3
# Built by Harimathesh
# ===========================================

FROM openjdk:8-jdk

LABEL maintainer="Harimathesh"

# Versions
ENV HADOOP_VERSION=3.3.6 \
    HBASE_VERSION=2.6.3 \
    JAVA_HOME=/usr/local/openjdk-8 \
    HADOOP_HOME=/opt/hadoop \
    HBASE_HOME=/opt/hbase \
    PATH=$PATH:/opt/hadoop/bin:/opt/hadoop/sbin:/opt/hbase/bin

# Install dependencies
RUN apt-get update && apt-get install -y wget ssh rsync vim \
    && rm -rf /var/lib/apt/lists/*

# ---------------------
# Install Hadoop
# ---------------------
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \
    && tar -xvzf hadoop-${HADOOP_VERSION}.tar.gz -C /opt/ \
    && mv /opt/hadoop-${HADOOP_VERSION} ${HADOOP_HOME} \
    && rm hadoop-${HADOOP_VERSION}.tar.gz

# ---------------------
# Install HBase
# ---------------------
RUN wget https://dlcdn.apache.org/hbase/${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz \
    && tar -xvzf hbase-${HBASE_VERSION}-bin.tar.gz -C /opt/ \
    && mv /opt/hbase-${HBASE_VERSION} ${HBASE_HOME} \
    && rm hbase-${HBASE_VERSION}-bin.tar.gz

# ---------------------
# Add user Harimathesh
# ---------------------
RUN useradd -ms /bin/bash Harimathesh \
    && echo "Harimathesh:hadoop" | chpasswd \
    && mkdir -p /tmp/hadoop-root /tmp/zookeeper \
    && chown -R Harimathesh:Harimathesh /opt/hadoop /opt/hbase /tmp/hadoop-root /tmp/zookeeper

USER Harimathesh
WORKDIR /home/Harimathesh

# ---------------------
# Start script
# ---------------------
RUN echo '#!/bin/bash\n' \
    'echo "Starting Hadoop NameNode formatting..."\n' \
    '$HADOOP_HOME/bin/hdfs namenode -format -force\n' \
    'echo "Starting HDFS..."\n' \
    '$HADOOP_HOME/sbin/start-dfs.sh\n' \
    'echo "Starting YARN..."\n' \
    '$HADOOP_HOME/sbin/start-yarn.sh\n' \
    'echo "Starting HBase..."\n' \
    '$HBASE_HOME/bin/start-hbase.sh\n' \
    'echo "Tailing logs..."\n' \
    'tail -f $HBASE_HOME/logs/* $HADOOP_HOME/logs/*\n' \
    > /home/Harimathesh/start.sh \
    && chmod +x /home/Harimathesh/start.sh

# Expose ports
EXPOSE 9870 9864 8088 8042 10020 19888 16010 2181

# Default command
CMD ["/home/Harimathesh/start.sh"]
