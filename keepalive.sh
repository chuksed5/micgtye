#!/bin/bash
while true; do
  echo "[$(date)] Miner is running..."
  nexus-network start --node-id 12097720 || echo "Restarting..."
  sleep 5
done