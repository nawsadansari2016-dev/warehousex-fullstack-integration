FROM node:18-alpine
WORKDIR /app
RUN npm i -g serve
COPY . .
EXPOSE 3000
CMD ["serve", "-s", ".", "-l", "3000"]
