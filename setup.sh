#!/bin/bash
# Project setup script for React/Node.js/JavaScript projects

# Exit on error
set -e

# Print each command before executing
set -x

# Install Node.js dependencies
if [ -f package.json ]; then
  echo "Installing npm dependencies..."
  npm install
fi

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
  echo "Creating .env file..."
  touch .env
  echo "# Add your environment variables here" > .env
fi

# Run initial build (if applicable)
if [ -f package.json ]; then
  if npm run | grep -q build; then
    echo "Running initial build..."
    npm run build
  fi
fi

echo "Setup complete!"
