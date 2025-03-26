#!/bin/bash
# This script runs only on Debian-based systems

# Define the virtual environment name
VENV_NAME=".venv_WildfireDetector"


# Check if already inside a virtual environment
if [[ -z "$VIRTUAL_ENV" ]]; then
    echo "Not in a virtual environment."

    # Check if the venv directory exists
    if [[ -d "$VENV_NAME" ]]; then
        echo "Activating existing virtual environment: $VENV_NAME"
    else
        echo "Virtual environment not found. Creating: $VENV_NAME"
        python3 -m venv "$VENV_NAME"

        # Activate the newly created virtual environment
        source "$VENV_NAME/bin/activate"

        # Install dependencies
        echo "Installing required packages..."
        pip install --upgrade pip
        pip install gdown ultralytics
    fi

    # Activate the virtual environment
    source "$VENV_NAME/bin/activate"
    echo "Virtual environment activated."
else
    echo "Already in a virtual environment: $VIRTUAL_ENV"
fi
