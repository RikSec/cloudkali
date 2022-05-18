FROM tsl0922/musl-cross
RUN git clone --depth=1 https://github.com/tsl0922/ttyd.git /ttyd \
    && cd /ttyd && env BUILD_TARGET=$BUILD_TARGET WITH_SSL=$WITH_SSL ./scripts/cross-build.sh

FROM kalilinux/kali
COPY --from=0 /ttyd/build/ttyd /usr/bin/ttyd

ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /sbin/tini
RUN chmod +x /sbin/tini

ADD https://raw.githubusercontent.com/rohitsharma45-cyber/scanner/main/scan.py /usr/local/bin/scan.py
RUN chmod +x /usr/local/bin/scan.py

RUN echo wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && unzip ngrok-stable-linux-amd64.zip >> ng

RUN apt-get update; apt-get install -y --no-install-recommends \
    python3 \
	python3-setuptools \
	python3-pip \
	zip \
	unzip \
	p7zip-full \
	wget \
	nano \
	detox \
	tmux \
    curl \
    htop \
    net-tools \
	sqlmap \
	wpscan  \
	git \
	whois \
	sslyze \
	wapiti \
	nmap \
	dmitry \
	dnsenum \
	dnswalk \
	dirb \
	wafw00f \
	whatweb \
	nikto \
	lbd \
	xsser \
	fierce \
	theharvester \
	uniscan \
	amass \
	subfinder \
	skipfish \
	binutils \
	python3-dev \
	qemu-system-x86 \
        && apt-get autoclean \
        && apt-get autoremove \
        && pip3 install pyinstaller \
        && rm -rf /var/lib/apt/lists/*
    
    
ADD ./mc /app/mc

RUN curl -L -o w10x64.img https://bit.ly/akuhnetW10x64
RUN echo qemu-system-x86_64 -vnc :0 -hda lite10.qcow2  -smp cores=8  -m 10000M -machine usb=on -device usb-tablet >> /usr/bin/w10
RUN echo curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p' >> /usr/bin/w10i
RUN chmod +x /app/mc && mv /app/mc /usr/local/bin/

ENV LOGIN_USER riksec
ENV LOGIN_PASSWORD admin

ENTRYPOINT ["/sbin/tini", "--"]
#CMD ["ttyd", "bash"]
CMD ttyd --port $PORT --credential $LOGIN_USER:$LOGIN_PASSWORD bash
