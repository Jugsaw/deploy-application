ARG JULIA_VERSION=1
FROM julia:$JULIA_VERSION

COPY gen.jl gen.jl

ENTRYPOINT ["julia"]
CMD ["gen.jl"]
