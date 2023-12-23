FROM cloudron/base:4.2.0@sha256:46da2fffb36353ef714f97ae8e962bd2c212ca091108d768ba473078319a47f4

RUN mkdir -p /app/code /app/data/server-files /app/data/user-files
WORKDIR /app/code

ARG VERSION=23.12.1
ENV NODE_ENV=production

# copy code
ADD start.sh config.json.template /app/code/

# Download source
RUN curl -L https://github.com/actualbudget/actual-server/archive/refs/tags/v${VERSION}.tar.gz | tar -xz --strip-components 1 -f -

# Install
RUN yarn workspaces focus --all --production

# Softlink /data to /app/data, because Actual hardcodes the default dataDir location as /data
# https://github.com/actualbudget/actual-server/blob/933fc27126903d748edfb330929f3bc0394d0072/src/load-config.js#L13C1-L13C69
RUN ln -s /app/data /data

EXPOSE 5006

CMD [ "/app/code/start.sh" ]