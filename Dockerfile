# Start from a tiny ready-made web server called nginx
FROM nginx:alpine

# Copy our web page into the folder nginx serves
COPY index.html /usr/share/nginx/html/index.html
