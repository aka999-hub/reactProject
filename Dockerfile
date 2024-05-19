FROM node:20
WORKDIR /app

#Install React CLI
#RUN npm install -g @react/cli
RUN npm install -g create-react-app
#RUN npx create-react-app react-app

#Install dependencies
#COPY package.json yarn.lock ./
RUN yarn install

#Copy the rest of the code
COPY . .

EXPOSE 3000

