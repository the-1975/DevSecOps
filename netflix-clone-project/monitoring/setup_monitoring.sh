#!/bin/bash

# Create main directory
mkdir -p monitoring_setup

# Change to the main directory
cd monitoring_setup

# Create docker-compose.yml file
cat << EOF > docker-compose.yml
version: "3"

networks:
  monitoring:
    driver: bridge

services:
  prometheus:
    image: prom/prometheus
    container_name: prometheus
    volumes:
      - ./prometheus/config:/etc/prometheus
      - prometheus-data:/prometheus
    ports:
      - 9090:9090
    command:
      - '--storage.tsdb.path=/prometheus'
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.tsdb.retention.time=30d'
      - '--storage.tsdb.retention.size=10GB'
      - '--storage.tsdb.min-block-duration=2h'
      - '--storage.tsdb.max-block-duration=6h'
      - '--storage.tsdb.wal-compression'
    restart: always
    networks:
      - monitoring
    healthcheck:
      test: ["CMD", "wget", "-q", "--tries=1", "--spider", "http://localhost:9090"]
      interval: 30s
      timeout: 10s
      retries: 3

  grafana:
    image: grafana/grafana
    container_name: grafana
    ports:
      - 3000:3000
    volumes:
      - grafana-data:/var/lib/grafana
      - ./grafana/provisioning/:/etc/grafana/provisioning/
    restart: always
    depends_on:
      - prometheus
    networks:
      - monitoring
    healthcheck:
      test: ["CMD-SHELL", "curl -f http://localhost:3000/api/health || exit 1"]
      interval: 1m30s
      timeout: 10s
      retries: 3

  node_exporter:
    image: prom/node-exporter
    container_name: node_exporter
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro
    command:
      - '--path.procfs=/host/proc'
      - '--path.rootfs=/rootfs'
      - '--path.sysfs=/host/sys'
      - '--collector.filesystem.mount-points-exclude=^/(sys|proc|dev|host|etc)($$|/)'
    ports:
      - 9100:9100
    restart: always
    networks:
      - monitoring
    healthcheck:
      test: ["CMD", "wget", "-q", "--tries=1", "--spider", "http://localhost:9100"]
      interval: 30s
      timeout: 10s
      retries: 3

volumes:
  grafana-data:
  prometheus-data:
EOF

# Create directories
mkdir -p prometheus/config
mkdir -p grafana/provisioning

# Create prometheus.yml file
cat << EOF > prometheus/config/prometheus.yml
global:
  scrape_interval: 15s
  scrape_timeout: 15s
  evaluation_interval: 2m

  external_labels:
    monitor: 'codelab-monitor'
    query_log_file: query_log_file.log

scrape_configs:
  - job_name: 'monitoring-item'
    scrape_interval: 10s
    scrape_timeout: 10s
    metrics_path: '/metrics'
    scheme: 'http'

    static_configs:
      - targets: ['prometheus:9090', 'node_exporter:9100']
        labels:
          service: 'monitor'
EOF

echo "Directory structure and files created successfully."

# Install Docker Compose
sudo apt-get update -y
sudo apt-get install docker-compose-plugin -y

# OR, if the above doesn't work, use the following method
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.29.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
sudo chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Start and run a multi-container Docker application 
docker compose up -d
