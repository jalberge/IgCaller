FROM debian:trixie-slim

LABEL org.opencontainers.image.title="IgCaller" \
      org.opencontainers.image.description="Python program designed to reconstruct immunoglobulin (IG) and T-cell receptor (TCR) gene rearrangements and oncogenic translocations from genomic data in lymphoid neoplasms" \
      org.opencontainers.image.url="https://github.com/nadeulab/IgCaller" \
      org.opencontainers.image.source="https://github.com/nadeulab/IgCaller" \
      org.opencontainers.image.authors="Ferran Nadeu" \
      org.opencontainers.image.licenses="https://github.com/nadeulab/IgCaller/blob/main/LICENSE.md"

ENV DEBIAN_FRONTEND=noninteractive \
      LC_ALL=C.UTF-8 \
      LANG=C.UTF-8 \
      PYTHONUNBUFFERED=1 \
      PYTHONDONTWRITEBYTECODE=1

RUN apt-get update && \
      apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            git \
            python3 \
            python3-pip \
            python3-setuptools \
            libgomp1 \
            samtools=1.21-1 && \
      pip3 install --break-system-packages --no-cache-dir \
            regex==2026.9.29 \
            numpy==2.5.4 \
            scipy==1.16.3 \
            biopython==1.88 \
            pandas==3.1.0 \
            seaborn==0.13.2 \
            matplotlib==3.11.2 && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*

RUN set -e \
      && cd / \
      && git clone https://github.com/nadeulab/IgCaller \
      && chmod +x IgCaller/IgCaller

ENV PATH=/IgCaller:${PATH}

ENTRYPOINT ["IgCaller"]
