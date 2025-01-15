#!/bin/bash

# Check if the first argument is provided
if [ -z "$1" ]; then
  # If not, prompt the user for the API key
  read -p "Enter your OpenAI API key: " OPENAI_API_KEY

  # Check if the user entered a value
  if [ -z "$OPENAI_API_KEY" ]; then
    echo "Error: Please provide your OpenAI API key."
    exit 1
  fi
else
  # Use the provided argument as the API key
  OPENAI_API_KEY="$1"
fi

# Run the docker command with the API key as an environment variable
docker run -d -p 3000:8080 \
  -e OPENAI_API_KEY="$OPENAI_API_KEY" \
  -v ollama:/root/.ollama \
  -v open-webui:/app/backend/data \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:ollama
