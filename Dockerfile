# Based on this image
FROM nginx:stable

# Install dnsmasq to be able correctly resolve docker links
RUN apt-get update && apt-get install -y --no-install-recommends \
    dnsmasq \
    supervisor \
 && rm -rf /var/lib/apt/lists/*


COPY index.html /usr/share/nginx/html/index.html

# Copy supervisor config file
COPY supervisord.conf /etc/supervisord.conf

# Supervisor will make sure its all running
CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]

