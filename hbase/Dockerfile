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

# SSH for Hadoop/HBase
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

# Expose ports for localhost access
EXPOSE 9870 9864 8088 8042 10020 19888 16010 2181

CMD ["/bin/bash"]
