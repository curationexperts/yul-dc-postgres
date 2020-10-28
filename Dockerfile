FROM postgres:12.3

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

COPY --from=nhd42358.live.dynatrace.com/linux/oneagent-codemodules:all / /
ENV LD_PRELOAD /opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so
