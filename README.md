### 参考サイト：【React入門】完全初心者OK！１から簡単なTodoアプリを作ってReactの１歩を踏み出してみよう ~Reactチュートリアル~  
https://www.youtube.com/watch?v=nRCNL9T3J98  

---
### docker compose 起動
um790@UM790:~/project/reactProject$ docker-compose up -d
um790@UM790:~/project/reactProject$ docker ps -a |grep react

### コンテナのshに入る
docker exec -it [コンテナID] bash 


### git関連
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:aka999-hub/reactProject.git
git push -u origin main



docker-compose.yml, Dockerfile の生成サンプル  
AIの回答から作成：  

docker-compose.yml：
version: '3'
services:
  app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "3000:3000"
    volumes:
      - .:/app
      - /app/node_modules
    environment:
      - CHOKIDAR_USEPOLLING=true
    command: npm start

Dockerfile：
# Use the official Node.js image as the base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm ci

# Copy the application code
COPY . .

# Build the React app
RUN npm run build

# Expose the port that the React app will run on
EXPOSE 3000

# Start the React app
CMD ["npm", "start"]
