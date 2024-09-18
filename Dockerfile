# Étape 1 : Utiliser une image de Node.js pour le développement
FROM node:18 as dev-stage

WORKDIR /app

# Copier les fichiers package.json et yarn.lock
COPY package*.json ./

# Installer les dépendances avec yarn
RUN yarn install

# Installer Nodemon globalement pour le développement
RUN yarn global add nodemon

# Copier le reste des fichiers de l'application dans le conteneur
COPY . .

# Exposer le port 3000 (serveur de développement Vue.js)
EXPOSE 3000

# Démarrer le serveur de développement Vue.js avec Nodemon
CMD ["nodemon", "--exec", "yarn run dev -- --host", "-L"]

# Étape 2 : Servir l'application avec Nginx pour la production (comme avant)
FROM node:18 as build-stage

WORKDIR /app

COPY package*.json ./
RUN yarn install

COPY . .

RUN yarn run build

FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
