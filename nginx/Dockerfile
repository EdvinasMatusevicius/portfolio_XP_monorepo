# Stage 1: Build the React application
FROM node:22-alpine as builder
WORKDIR /usr/portfolioXP
COPY ./packages/client/package*.json ./
RUN npm install
COPY ./packages/client/ ./
RUN npm run build

# Stage 2: Create the final Nginx image
FROM nginx:stable-alpine
COPY --from=builder /usr/portfolioXP/dist /usr/share/nginx/html
COPY ./nginx/nginx.conf.template /etc/nginx/templates/nginx.conf.template
COPY ./nginx/nginx.http.template /etc/nginx/templates/nginx.http.template
COPY ./nginx/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80 443
ENTRYPOINT ["/entrypoint.sh"]