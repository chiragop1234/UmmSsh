# Use the tmate base image
FROM ivonet/tmate

# Expose the default tmate SSH port
EXPOSE 2222

# Set environment variables
ENV HOST=localhost
ENV PORT=2222

# Set up entry point to start tmate SSH server
ENTRYPOINT ["/usr/bin/tmate", "--host", "$HOST", "--port", "$PORT", "new-session", "-d"]
