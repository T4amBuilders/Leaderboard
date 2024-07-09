from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from config import NeonConfig
from typing import Optional

DATABASE_URL: Optional[str] = NeonConfig.DATABASE_URL

if DATABASE_URL is None:
    raise ValueError("DATABASE_URL is not configured")

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
