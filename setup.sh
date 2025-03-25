#!/bin/bash
# Preprocessing steps to pull down and prepare DFire dataset
# Dataset -> https://github.com/gaiasd/DFireDataset
# See -> https://github.com/AlimTleuliyev/wildfire-detection/blob/main/training-recipes/README.md

# Define the datasets directory and D-Fire related files
DATASETS_DIR="datasets"
DFIRE_ZIP="$DATASETS_DIR/D-Fire.zip"
DFIRE_DIR="$DATASETS_DIR/D-Fire"

# Check if D-Fire.zip exists inside the datasets directory
if [[ ! -f "$DFIRE_ZIP" ]]; then
    echo "$DFIRE_ZIP not found."

    # Check if gdown is installed, install if missing
    if ! command -v gdown &> /dev/null; then
        echo "gdown not found. Installing..."
        sudo apt update && sudo apt install -y gdown
    else
        echo "gdown is already installed."
    fi

    # Run gdown --help after checking/installing gdown
    echo "Running gdown..."
    gdown 19LSrZHYQqJSdKgH8Mtlgg7-i-L3eRhbh # if not working, replace this string with your own link from Google Drive
    exit 1
fi

# Check if the D-Fire directory exists inside datasets
if [[ ! -d "$DFIRE_DIR" ]]; then
    echo "$DFIRE_DIR directory not found. Unzipping $DFIRE_ZIP..."
    unzip "$DFIRE_ZIP" -d "$DATASETS_DIR"
else
    echo "$DFIRE_DIR directory already exists. Skipping unzip."
fi
