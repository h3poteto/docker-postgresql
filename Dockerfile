FROM bitnami/postgresql:16.2.0-debian-12-r5

USER root

RUN install_packages git build-essential

RUN cd /tmp && \
    git clone --branch v0.6.0 https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make && \
    make install && \
    cd ../ && rm -rf pgvector

USER 1001
