FROM node:6
RUN apt-get update && apt-get install -y libelf1
RUN useradd jenkins --shell /bin/bash --create-home
USER jenkins
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm cache clean
RUN npm install
COPY . /usr/src/app
EXPOSE 4200
CMD ["npm","start"]
