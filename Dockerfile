# Use a base image with necessary dependencies
FROM ubuntu:latest

# Install required dependencies
RUN apt-get update && \
    apt-get install -y git build-essential autoconf libtool libssl-dev pkg-config

# Clone the repository and build tmate-ssh-server
RUN git clone https://github.com/tmate-io/tmate-ssh-server.git

RUN  cd tmate-ssh-server
   
RUN ./create_keys.sh

RUN ./autogen.sh

RUN ./configure
 
RUN make

# Expose the default tmate-ssh-server port
EXPOSE 2222

# Run tmate-ssh-server on container startup
CMD ["sudo", "./tmate-ssh-server"]
