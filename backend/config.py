import os

from dotenv import load_dotenv

# Charger les variables d'environnement à partir de .env
load_dotenv()


class NeonConfig:
    DATABASE_URL = os.getenv("DATABASE_URL")  # PostgreSQL connection URL
