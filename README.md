# Data Science Environment: Setup and Usage Guide

This document provides clear instructions for setting up and effectively using the development environment for this project. We're leveraging Docker Compose for container management, a streamlined shell script for service interaction, and Jupyter Lab for interactive development and experimentation.

## Core Components

Our development environment relies on the following key components:

*   **Docker Compose:** Orchestrate service (container) needed for development.
*   **`up_service.sh`:** A custom shell script to simplify starting the development environment.
*   **Jupyter Lab:** Provides an interactive environment for coding, data exploration, and model development.
*   **`requirements.txt`:** This file lists all the necessary Python packages for the project.
* **`uv`**: the pip alternative for faster operation.

## Getting Started

Here's how to get the development environment up and running on your local machine.

### 1. Start the Environment

1.  **Navigate to the Project Root:** Open your terminal and use the `cd` command to navigate to the root directory of the project. This is where the `docker-compose.yml` and `up_service.sh` files reside.
2.  **Run the Startup Script:** Execute the `up_service.sh` script to build (if needed) and start the Docker containers.

    ```bash
    ./up_service.sh
    ```

    ```bash
    docker compose up --build -d
    ```

    This script streamlines the process of building and running the containers defined in `docker-compose.yml`.

### 2. Access Jupyter Lab

1.  **Open Your Browser:** Once the `up_service.sh` script has successfully completed, Jupyter Lab will be running inside a Docker container.
2.  **Access the Web Interface:** Access the Jupyter Lab interface in your web browser at:

    ```
    http://localhost:8888/lab
    ```

    You can immediately start working within Jupyter Lab.

### 3. Stop and Clean Up the Environment

When you're finished with your development session, or if you want to completely rebuild the environment, use the following command to stop and remove all associated resources.

1. **Stoping containers**:
```
./remove-all.sh
```

```bash
docker compose down -v
```

### 4. Install new package

To install new package use uv commands in shell command.

```bash
uv pip install <package_name>
```

You can install new packages by including new package into `requirements.txt` and rebuilding the image.


Note: Remember to restart the notebook kernel.

