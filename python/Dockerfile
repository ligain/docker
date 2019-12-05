FROM alpine:3.10.3

ENV NGINX_VERSION=1.17.6
ENV LANG C.UTF-8
ENV PATH /usr/local/bin:$PATH
ENV PYTHON_VERSION 3.8.0
ENV PYTHON_PIP_VERSION 19.3.1
ENV PYTHON_GET_PIP_URL https://github.com/pypa/get-pip/raw/ffe826207a010164265d9cc807978e3604d18ca0/get-pip.py
ENV PYTHON_GET_PIP_SHA256 b86f36cc4345ae87bfd4f10ef6b2dbfa7a872fbff70608a1e43944d283fd0eee


RUN \
  build_pkgs="bzip2-dev coreutils dpkg-dev dpkg findutils gcc gdbm-dev libc-dev libffi-dev libnsl-dev libtirpc-dev linux-headers make ncurses-dev openssl-dev pax-utils readline-dev sqlite-dev tcl-dev tk tk-dev util-linux-dev xz-dev zlib-dev wget expat-dev" && \
  runtime_pkgs="expat" && \
  apk --no-cache add ${build_pkgs} ${runtime_pkgs} && \
  cd /tmp && \
  wget "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tgz" && \
  tar xzf Python-$PYTHON_VERSION.tgz && \
  cd /tmp/Python-$PYTHON_VERSION && \
  gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" && \
  ./configure \
        --build="$gnuArch" \
        --enable-loadable-sqlite-extensions \
        --enable-optimizations \
        --enable-shared \
        --with-system-expat \
        --with-system-ffi \
        --without-ensurepip && \
  make -j $(nproc) && \
  make install && \
  rm -rf /tmp/* && \
  apk del ${build_pkgs} && \
  python3.8 --version

# make some useful symlinks that are expected to exist
RUN \
    cd /usr/local/bin && \
    ln -s idle3 idle && \
    ln -s pydoc3 pydoc && \
    ln -s python3 python && \
    ln -s python3-config python-config


RUN \
    wget -O get-pip.py "$PYTHON_GET_PIP_URL" && \
    echo "$PYTHON_GET_PIP_SHA256 *get-pip.py" | sha256sum -c - && \
    python get-pip.py \
        --disable-pip-version-check \
        --no-cache-dir \
        "pip==$PYTHON_PIP_VERSION" && \
    rm -f get-pip.py && \
    pip --version

CMD ["python3"]