# Build with podman:
#   podman build -t dcdecomp_dev --target dev .     # toolchain + diffing tools
#   podman build -t dcdecomp_build --target build . # one-shot build of the ISO
# build.sh wraps the second one. Everything here is plain OCI, so
# docker works too, but podman is what the project targets.
#
# Debian for glibc (the toolchain binaries are glibc-linked), trixie because
# binutils-mips-ps2-decompals needs glibc 2.38 and bookworm ships 2.36.
FROM --platform=linux/amd64 debian:trixie-slim AS base

ENV DEBIAN_FRONTEND=noninteractive
ENV BINUTILS /usr/local/binutils-mips-ps2-decompals
ENV VIRTUAL_ENV /opt/venv
ENV PATH $PATH:${BINUTILS}:${VIRTUAL_ENV}/bin

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


# Install build requirements
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-venv \
        cmake \
        ninja-build \
    && rm -rf /var/lib/apt/lists/*

# The binutils built for PS2 decompilation projects. This is the assembler the
# reference .s files go through and every objcopy/objdump/readelf/nm the build
# and the scripts use -- it replaces both ps2toolchain-ee and the ProDG SDK.
ARG BINUTILS_VERSION=v0.10
RUN wget -O /tmp/binutils.tar.gz \
        https://github.com/decompals/binutils-mips-ps2-decompals/releases/download/${BINUTILS_VERSION}/binutils-mips-ps2-decompals-linux-x86-64.tar.gz \
    && mkdir -p ${BINUTILS} \
    && tar xzf /tmp/binutils.tar.gz -C ${BINUTILS} \
    && rm /tmp/binutils.tar.gz

# wibo runs the Windows-hosted Metrowerks compiler and linker
COPY --from=ghcr.io/decompals/wibo:latest /usr/local/bin/wibo /usr/bin/

# Install pip packages
RUN python3 -m venv $VIRTUAL_ENV
# libclang is what turns the C++ headers into the C context m2c needs
# (scripts/diff/m2ctx.py). The wheel bundles LLVM's own shared library, so
# no clang or gcc has to be installed alongside it. It lives in the base stage
# rather than dev because the build stage generates build/ctx.c too.
RUN python -m pip install pycdlib rabbitizer==1.16.2 spimdisasm==1.42.3 libclang

#
# Development stage
#
FROM base AS dev

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        less \
        build-essential \
        doxygen \
        clangd \
    && rm -rf /var/lib/apt/lists/*

# objdiff is what diff.sh runs and what produces the progress report
# decomp.dev ingests. A single static binary, so it is fetched rather than
# built; the GUI is not installed, since this image has no display.
ARG OBJDIFF_VERSION=v3.7.3
RUN wget -O /usr/local/bin/objdiff-cli \
        https://github.com/encounter/objdiff/releases/download/${OBJDIFF_VERSION}/objdiff-cli-linux-x86_64 \
    && chmod +x /usr/local/bin/objdiff-cli

# Dependencies for decomp-permuter (permuting/decomp-permuter). `toml` is
# required and `levenshtein` is its optional faster diff algorithm. `pynacl` is
# deliberately omitted -- it is only needed for the permuter@home
# distributed-computing feature, which this project does not use.
RUN python -m pip install toml levenshtein

#
# Build stage
#
FROM base AS build


# Set the working directory
WORKDIR /dcdecomp

# Copy project files into the container. .containerignore is what keeps this
# to the sources -- without it the disc image and the reverse-engineering
# scratch come too, and this one layer is 6GB.
COPY . .

# Build everything and copy the results out, through the same cmake.sh the
# entry points use. `ctx` is named because this builds `elf`, not the default
# target it hangs off. rom/ and ref/ are mounted in and /output is where the
# results land; see build.sh.
CMD scripts/build/cmake.sh elf ctx \
    && cp build/SCUS_971.11 build/TITLE.BIN build/DUN.BIN \
          build/ctx.c build/ctx.cpp build/compiler_flags.txt /output/
