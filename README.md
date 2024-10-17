# Blockchain Node Setup Script

## Overview

This Bash script automates the process of setting up a blockchain node on a Linux server. It installs necessary dependencies, clones the blockchain node repository, builds the node, creates a configuration file, and monitors the node's status.

## Features

- **Automatic setup**: Installs required packages and dependencies.
- **Node configuration**: Generates a configuration file for the node.
- **Background execution**: Runs the node in the background and logs output to a file.
- **Node monitoring**: Monitors the node's status and restarts it if it stops.

## Prerequisites

- **Operating System**: This script is intended for Linux-based systems (Ubuntu/Debian).
- **Git**: Ensure that Git is installed on your system.
- **Make**: The script uses `make` to build the node from source.

## How to Use

1. Download the script and make it executable:

    ```bash
    wget https://raw.githubusercontent.com/yourusername/your-repo-name/main/setup_node.sh
    chmod +x setup_node.sh
    ```

2. Edit the script to update the `REPO_URL` variable with the URL of your blockchain node repository.

3. Run the script:

    ```bash
    ./setup_node.sh
    ```

## Monitoring

The script will create a log file at `~/MyBlockchainNode/node.log`, where you can view the node's logs and output. The script will also restart the node if it stops unexpectedly.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
