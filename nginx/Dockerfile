# Stage 1: Build the React application
FROM node:22-alpine as builder
WORKDIR /usr/portfolioXP
COPY ./packages/client/package*.json ./
RUN npm install
COPY ./packages/client/ ./
RUN npm run build

# Stage 2: Create the final Nginx image
FROM nginx:stable-alpine
# Copy built assets from the builder stage
COPY --from=builder /usr/portfolioXP/dist /usr/share/nginx/html
# Copy the Nginx configuration template
COPY ./nginx/nginx.conf.template /etc/nginx/templates/nginx.conf.template
EXPOSE 80 443
# Replace env vars in template and create final config
CMD ["/bin/sh", "-c", "envsubst '$$SERVER_SERVICE_PORT $$DOMAIN_NAME' < /etc/nginx/templates/nginx.conf.template > /etc/nginx/nginx.conf && nginx -g 'daemon off;'"]