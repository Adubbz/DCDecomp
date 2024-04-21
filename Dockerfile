# We require a 64-bit distro to use ps2toolchain. However, wine refuses to support both 64-bit and 32-bit applications when used under Alpine.
# Our best bet is Debian, as it seems to be much faster than Ubuntu.
FROM --platform=linux/amd64 debian:bookworm-slim AS base

ENV DEBIAN_FRONTEND=noninteractive
ENV PS2DEV /usr/local/ps2dev
ENV PS2SDK $PS2DEV/ps2sdk
ENV PRODG /usr/local/prodg
ENV VIRTUAL_ENV /opt/venv
ENV PATH $PATH:${PS2DEV}/bin:${PS2DEV}/ee/bin:${PS2DEV}/iop/bin:${PS2DEV}/dvp/bin:${PS2SDK}/bin:${VIRTUAL_ENV}/bin

# Install base requirements
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
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
    && apt-get install -y --install-recommends winehq-${WINE_BRANCH} \
    && rm -rf /var/lib/apt/lists/* \
    && wineboot --init

# Install build requirements
# - musl is required by ps2toolchain
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-venv \
        make \
        musl \ 
    && rm -rf /var/lib/apt/lists/*

# Install the ProDG compiler
RUN wget -O /tmp/prodg.zip https://archive.org/download/SNSystemsProDGPs2/ProDGPs2usrLocalSceFiles.zip \
    && unzip /tmp/prodg.zip "usr/local/sce/ee/*" -d "/tmp/prodg" \
    && mv /tmp/prodg/usr/local/sce/ ${PRODG} \
    && rm -rf /tmp/prodg && rm /tmp/prodg.zip

# Install wibo and ps2sdk
COPY --from=ghcr.io/decompals/wibo:latest /usr/local/sbin/wibo /usr/bin/
COPY --from=ghcr.io/ps2dev/ps2toolchain-ee:latest ${PS2DEV} ${PS2DEV}

# Install pip packages
# Newer versions of rabbitizer and spimdisasm cause broken disassembly
RUN python3 -m venv $VIRTUAL_ENV
RUN python -m pip install pycdlib rabbitizer==1.7.4 spimdisasm==1.14.3

#
# Development stage
#
FROM base AS dev

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        less \
        gcc \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install dependencies for asm-differ
RUN python -m pip install colorama watchdog levenshtein cxxfilt

#
# Build stage
#
FROM base AS build


# Set the working directory
WORKDIR /dcdecomp

# Copy project files into the container
COPY . .

# Build the project
RUN 

# Output the build
CMD make setup \
    && make -j$(nproc) \
    && cp build/SCUS_971.11 /output/SCUS_971.11
    