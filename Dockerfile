FROM docker.pkg.github.com/thindil/dockerada/gnat:2020.1
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 && apt-get update && apt-get install -y \
 tcl-dev \
 tk-dev \
 wget \
 && wget https://github.com/thindil/tashy/archive/8.6.7.tar.gz \
 && tar -xzf 8.6.7.tar.gz \
 && cd /tashy-8.6.7 \
 && tclsh scripts/setup.tcl --nogui \
 && gprbuild -P tashy.gpr \
 && gprinstall -P tashy.gpr -p -XLIBRARY_TYPE=static --build-var=LIBRARY_TYPE --build-name=static \
 && cd .. \
 && rm -rf /tashy \
 && apt-get purge -y wget && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
