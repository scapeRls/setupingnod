#!/bin/bash

# Script to set up a blockchain node on a Linux server.

set -e

# Variables
NODE_NAME="MyBlockchainNode"
REPO_URL="https://github.com/yourusername/blockchain-node-repo.git"
NODE_DIR="$HOME/$NODE_NAME"
CONFIG_FILE="$NODE_DIR/config.toml"
LOG_FILE="$NODE_DIR/node.log"

# Function to log actions
log() {
    echo "[INFO] $1"
}

# Function to install necessary packages
install_packages() {
    log "Updating package list..."
    sudo apt-get update -y
    log "Installing necessary packages..."
    sudo apt-get install -y git curl build-essential
}

# Function to clone the blockchain node repository
clone_repository() {
    log "Cloning the blockchain node repository..."
    git clone $REPO_URL $NODE_DIR
}

# Function to build the node
build_node() {
    log "Building the node..."
    cd $NODE_DIR
    make build
}

# Function to create configuration file
create_config() {
    log "Creating configuration file..."
    cat <<EOF > $CONFIG_FILE
[network]
name = "MyBlockchainNetwork"
port = 30303

[rpc]
enabled = true
port = 8545

[logging]
level = "info"
file = "$LOG_FILE"
EOF
}

# Function to start the node
start_node() {
    log "Starting the blockchain node..."
    nohup $NODE_DIR/bin/node --config $CONFIG_FILE >> $LOG_FILE 2>&1 &
    echo $! > $NODE_DIR/node.pid
    log "Node started with PID: $(cat $NODE_DIR/node.pid)"
}

# Function to monitor node status
monitor_node() {
    log "Monitoring the node status..."
    while true; do
        if ps -p $(cat $NODE_DIR/node.pid) > /dev/null; then
            log "Node is running."
        else
            log "Node is not running. Restarting..."
            start_node
        fi
        sleep 30
    done
}

# Main execution
install_packages
clone_repository
build_node
create_config
start_node
monitor_node
