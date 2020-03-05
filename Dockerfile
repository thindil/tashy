FROM thindil/gnat
ENV PATH=/opt/gnat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
COPY . /tashy
RUN apt-get update && apt-get install -y \
 tcl-dev \
 tk-dev \
 tklib \
 libmagic-dev \
 && cd tashy \
 && wish scripts/setup.tcl --nogui \
 && gprbuild -P tashy.gpr \
 && gprinstall -P tashy.gpr -p -XLIBRARY_TYPE=static --build-var=LIBRARY_TYPE --build-name=static \
 && cd .. \
 && rm -rf /tashy \
 && find /opt/gnat/ -type d -empty -delete \
 && apt-get purge -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
