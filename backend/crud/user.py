# crud.py
from sqlalchemy.orm import Session

from models.user import User, pwd_context
from schemas.user import UserCreate


def get_user(db: Session, user_id: int):
    return db.query(User).filter(User.id == user_id).first()


def get_users(db: Session, skip: int = 0, limit: int = 10):
    users = db.query(User).offset(skip).limit(limit).all()
    return users


def create_user(db: Session, user: UserCreate):
    hashed_password = pwd_context.hash(user.password)
    db_user = User(
        username=user.username,
        email=user.email,
        full_name=user.full_name,
        password_hashed=hashed_password,
        adresse=user.adresse,
        phone=user.phone,
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user


def update_user(db: Session, user_id: int, user_update: dict):
    db_user = db.query(User).filter(User.id == user_id).first()
    if db_user is None:
        raise ValueError("User not found")

    for key, value in user_update.items():
        if key == "password":
            hashed_password = pwd_context.hash(value)
            setattr(db_user, "password_hashed", hashed_password)
        else:
            setattr(db_user, key, value)

    db.commit()
    db.refresh(db_user)
    return db_user


def delete_user(db: Session, user_id: int):
    db_user = db.query(User).filter(User.id == user_id).first()
    if db_user is None:
        raise ValueError("User not found")
    db.delete(db_user)
    db.commit()
