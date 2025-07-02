# Base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y curl

# Install Nexus CLI
RUN curl -s https://cli.nexus.xyz/ | sh

# Add Nexus to PATH
ENV PATH="/root/.nexus/bin:${PATH}"

# Auto-restart miner if it crashes
CMD ["bash", "-c", "while true; do nexus-network start --node-id 12097720; sleep 10; done"]