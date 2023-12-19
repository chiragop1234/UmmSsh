# Use a base image with a minimal Linux distribution
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y build-essential libevent-dev libncurses5-dev pkg-config openssh-server git

# Clone tmate repository and build
RUN git clone https://github.com/tmate-io/tmate-ssh-server.git && \
    cd tmate && \
    ./autogen.sh && \
    ./configure && \
    make

# Expose the default tmate SSH port
EXPOSE 2222

# Set up entry point to start tmate SSH server
ENTRYPOINT ["./tmate/ssh-server"]
