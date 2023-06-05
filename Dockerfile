# We require a 64-bit distro to use ps2toolchain. However, wine refuses to support both 64-bit and 32-bit applications when used under Alpine.
# Our best bet is Debian, as it seems to be much faster than Ubuntu.
FROM --platform=linux/amd64 debian:11 AS dev

# ps2toolchain environment variables
ENV PS2DEV /usr/local/ps2dev
ENV PS2SDK $PS2DEV/ps2sdk
ENV PATH $PATH:${PS2DEV}/bin:${PS2DEV}/ee/bin:${PS2DEV}/iop/bin:${PS2DEV}/dvp/bin:${PS2SDK}/bin

# Install base requirements
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        git \
        gnupg \
        gpg-agent \
        sudo \
        unzip \
        wget \
    && rm -rf /var/lib/apt/lists/* 

# Install wine
ARG WINE_BRANCH="stable"
RUN wget -nv -O- https://dl.winehq.org/wine-builds/winehq.key | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add - \
    && echo "deb https://dl.winehq.org/wine-builds/debian/ $(grep VERSION_CODENAME= /etc/os-release | cut -d= -f2) main" >> /etc/apt/sources.list \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --install-recommends winehq-${WINE_BRANCH} \
    && rm -rf /var/lib/apt/lists/* \
    && wineboot --init

# Install winetricks
RUN wget -nv -O /usr/bin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
    && chmod +x /usr/bin/winetricks

# Install build requirements
# - musl is required by ps2toolchain
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python-is-python3 \
        make \
        musl \ 
    && rm -rf /var/lib/apt/lists/*

# Install wibo and ps2sdk
COPY --from=ghcr.io/decompals/wibo:latest /usr/local/sbin/wibo /usr/bin/
# Install pip packages
RUN pip install pycdlib