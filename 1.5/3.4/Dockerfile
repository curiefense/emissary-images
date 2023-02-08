FROM curiefense/curieproxy-envoy:v1.5.0 as curieproxy

FROM docker.io/emissaryingress/emissary:3.4.1

RUN set -xe && \
  apk add lua pcre2 geoip vectorscan && \
  apk --virtual .build-deps add python3 gcc g++ make unzip lua-dev luarocks pcre2-dev geoip-dev vectorscan-dev && \
  ln -s $(which luarocks-5.1) /usr/local/bin/luarocks && \
  luarocks install lrexlib-pcre2 && \
  luarocks install lua-cjson && \
  luarocks install lua-resty-string && \
  luarocks install luafilesystem && \
  luarocks install luasocket && \
  luarocks install redis-lua && \
  luarocks install compat53 && \
  luarocks install mmdblua && \
  luarocks install luaipc && \
  luarocks install lua-resty-injection && \
  unlink /usr/local/bin/luarocks && \
  apk del .build-deps && \
  rm -rf /var/cache/apk/*

COPY --from=curieproxy /lua /ambassador/lua
COPY --from=curieproxy /usr/local/lib/lua/5.1/*.so /usr/local/lib/lua/5.1/

RUN ln -s /usr/lib/libhs.so.5 /usr/glibc-compat/lib/libhs.so.5
RUN ln -s /usr/lib/libhs.so.5 /usr/glibc-compat/lib/libhs.so.4

COPY --from=curieproxy --chown=ambassador:root /bootstrap-config/config /bootstrap-config/config

RUN mkdir /cf-config && chmod a+rwxt /cf-config && chown ambassador.root /cf-config

COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh
