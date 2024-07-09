#Defining variables
DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = docker-compose.yml

# Building the Docker image
build:
	@echo "Building the Docker image..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

# Launch the Flutter container in detached mode
up:
	@echo "Starting the Flutter web server..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

# Stop the container
down:
	@echo "Stopping the Flutter web server..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

# Restart the container
restart:
	@echo "Stopping the Flutter web server..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) restart

# View logs
logs:
	@echo "Displaying the logs..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

# Cleaning containers, images and volumes
clean:
	@echo "Cleaning up Docker..."
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down --rmi all --volumes --remove-orphans

# Run Flutter Web-dev
web-dev:
	@echo "Running Flutter for web..."
	cd ./frontend && flutter run -d web-server --web-port 2256

# Run the installer for the entire project
linter:
	@echo "Running linter..."
	./linter-script.sh
