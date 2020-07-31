FROM ubuntu
COPY . /tashy
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 && apt-get update && apt-get install -y \
 gnat \
 gprbuild \
 tcl-dev \
 tk-dev \
 && cd tashy \
 && wish scripts/setup.tcl --nogui \
 && gprbuild -P tashy.gpr \
 && gprinstall -P tashy.gpr -p -XLIBRARY_TYPE=static --build-var=LIBRARY_TYPE --build-name=static \
 && cd .. \
 && rm -rf /tashy \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
