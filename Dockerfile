# Utilisation d'une image Node.js légère et sécurisée
FROM node:18-alpine

# Définition du répertoire de travail
WORKDIR /app

# Copie des fichiers package.json et package-lock.json en premier pour optimiser le cache Docker
COPY package*.json ./

# Installation des dépendances en mode production
RUN npm install --only=production

# Copie du reste de l'application
COPY . .

# Ajout d'un utilisateur non-root pour la sécurité
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Exposition du port 8080
EXPOSE 8080

# Commande de lancement de l'application
CMD ["npm", "start"]
