# app/__init__.py

from .database import Base, AsyncSessionLocal, init_db
from .config import DATABASE_URL

# This file can be empty or include initialization code for the app module
