

# Use Ubuntu 24.04 (which has GLIBC 2.39)
FROM ubuntu:24.04

# Install dependencies
RUN apt-get update && apt-get install -y curl

# Install Nexus CLI (non-interactive mode)
RUN curl -s https://cli.nexus.xyz/ | sh -s -- -y

# Add Nexus to PATH
ENV PATH="/root/.nexus/bin:${PATH}"

# Auto-restart miner
CMD ["bash", "-c", "while true; do nexus-network start --node-id 12097720; sleep 10; done"]
