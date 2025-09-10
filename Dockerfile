FROM n8nio/n8n:latest

USER root

# Install bash and other utilities
RUN apk add --no-cache bash curl

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Create necessary directories
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Set working directory
WORKDIR /home/node

# Expose port (Heroku will set PORT dynamically)
EXPOSE $PORT

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
