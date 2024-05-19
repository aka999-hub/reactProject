### 参考サイト：【React入門】完全初心者OK！１から簡単なTodoアプリを作ってReactの１歩を踏み出してみよう ~Reactチュートリアル~  
https://www.youtube.com/watch?v=nRCNL9T3J98  
10:58  



### gitignore作成サイト：gitignore.io
https://www.toptal.com/developers/gitignore/  


---  
### docker compose 起動  
um790@UM790:~/project/reactProject$ docker-compose up -d  
um790@UM790:~/project/reactProject$ docker ps -a |grep react # 起動したコンテナを確認する  
  
### コンテナのshに入る  
docker exec -it [コンテナID] bash  
  

### Docker＋create-react-appで環境構築すると編集内容が更新されない  
1. react-app/package.json の "scripts.start" 内容を修正 "react-scripts start" -> "node ./setup && react-scripts start"  
2. react-app/setup.js ファイルを追加  
3. setup.js でwebpack.config.js の "watchOptions" を書き換える  
  

### git関連  
git init # gitリポジトリを初期化する  
git add . # ファイルをステージングする  
git commit -m "first commit" # コミットする  
git branch # 現在のブランチを確認  
git branch -M master # ブランチ名をmasterに変更  
git remote add origin git@github.com:aka999-hub/reactProject.git # リモートリポジトリに追加  
git remote -v # 設定を確認する  
git push -u origin master # リモートリポジトリにプッシュする  
  
  
  
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
