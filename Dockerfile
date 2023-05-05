ARG JULIA_VERSION=1
FROM julia:$JULIA_VERSION

# FIXME: no need to develop Jugsaw once it is registered
RUN julia -e "println(VERSION)"
