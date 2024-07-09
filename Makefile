# Définir les variables
DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = docker-compose.yml

# Construire l'image Docker
build:
	@echo "Building the Docker image..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

# Lancer le conteneur Flutter en mode détaché
up:
	@echo "Starting the Flutter web server..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

# Arrêter le conteneur
down:
	@echo "Stopping the Flutter web server..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

# Redémarrer le conteneur
restart:
	@echo "Stopping the Flutter web server..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) restart

# Visualiser les logs
logs:
	@echo "Displaying the logs..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

# Nettoyer les conteneurs, images et volumes
clean:
	@echo "Cleaning up Docker..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes --remove-orphans

# Exécuter Flutter Web-dev
web-dev:
	@echo "Running Flutter for web..."
	cd ./frontend && flutter run -d web-server --web-port 2256

# Run the installer for the entire project
linter:
	@echo "Running linter..."
	./linter-script.sh
