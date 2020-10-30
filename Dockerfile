FROM postgres:12.3

COPY --from=nhd42358.live.dynatrace.com/linux/oneagent-codemodules:all / /
ENV LD_PRELOAD /opt/dynatrace/oneagent/agent/lib64/liboneagentproc.so

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

