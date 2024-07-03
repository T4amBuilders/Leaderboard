# Leaderboard

## Overview

This project is a leaderboard application designed to manage and display scores for babyfoot games. It allows users to track game results, view player standings, and manage game sessions effectively.

## Getting Started

To get the project up and running, follow these steps:

### Prerequisites

Before you begin, make sure you have the following installed and set up:

- Docker
- Flutter
- GitHub SSH key (for cloning the repository)

### Step 1 - Cloning the Repository

Ensure you have set up an SSH key with GitHub. Clone the repository to your local machine using:

```bash

git clone git@github.com:T4amBuilders/Leaderboard.git
cd Leaderboard

```

### Step 2 - Starting Docker Containers

1. **Build Docker Images**: If the Docker images haven't been built yet, run _at the root of the project_:

```bash

make build

```

This is the equivalent of the `docker compose build` command

2. **Launch Docker Containers**: Start the Docker containers using _at the root of the project_:

```bash

make up

```

This is the equivalent of the `docker compose up -d` command

### Step 3 - Starting the Flutter Project

3. **Run Flutter in Web Dev Mode**: Launch the Flutter project in web development mode _at the root of the project_ with:

```bash

make web-dev

```

This command will start the Flutter project, allowing you to interact with the leaderboard application in a web environment. This is the equivalent of the `flutter run -d web-server --web-port 2256` command

## Usage

Once the project is up and running, navigate to the specified URL or localhost to view the leaderboard interface.

## Contributing

Contributions are welcome! Please fork the repository and submit pull requests with any improvements or new features.

## The Dr4mT4am people

- Jinane BEN-SALEM [Fullstack Developer]
- Kylian BARTHELEMY [Project Manager]
- Kevin MLADENOVIC [Project Supervisor]
- Nicolas EVEZARD [Fullstack Developer]
