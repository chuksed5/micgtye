FROM ubuntu:22.04

# Install GLIBC 2.39 manually
RUN apt-get update && apt-get install -y curl wget
RUN wget -q -O /tmp/glibc-2.39.deb http://security.ubuntu.com/ubuntu/pool/main/g/glibc/libc6_2.39-0ubuntu1_amd64.deb
RUN dpkg -i /tmp/glibc-2.39.deb


# Install Nexus CLI (non-interactive mode)
RUN curl -s https://cli.nexus.xyz/ | sh -s -- -y

# Add Nexus to PATH
ENV PATH="/root/.nexus/bin:${PATH}"

# Auto-restart miner
CMD ["bash", "-c", "while true; do nexus-network start --node-id 12097720; sleep 10; done"]


