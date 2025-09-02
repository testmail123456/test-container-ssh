# Use a minimal Alpine Linux base image
FROM alpine:3.21

# Install bash and wget
RUN apk add --no-cache bash wget

# Install required tools
RUN apk add --no-cache bash openssl shadow

# Set root password
RUN echo "root:$(openssl passwd -1 Compass.123)" > /tmp/root_pw \
    && sed -i "s#^root:[^:]*#root:$(cat /tmp/root_pw)#" /etc/shadow

# Set working directory
WORKDIR /usr/local/bin

# Download the precompiled dropbearmulti binary for aarch64
RUN wget https://github.com/leommxj/prebuilt-multiarch-bin/raw/bin/aarch64_tools/dropbearmulti -O /usr/local/bin/dropbear \
    && chmod +x /usr/local/bin/dropbear

# Create Dropbear directory for host keys
RUN mkdir -p /etc/dropbear

# Copy the run.sh script into the container
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Expose port 8000
EXPOSE 8000

# Default command
CMD ["/usr/local/bin/run.sh"]
