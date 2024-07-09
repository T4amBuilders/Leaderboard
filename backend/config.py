import os

from dotenv import load_dotenv

# Load environment variables from .env
load_dotenv()


class NeonConfig:
    DATABASE_URL = os.getenv("DATABASE_URL")  # PostgreSQL connection URL
