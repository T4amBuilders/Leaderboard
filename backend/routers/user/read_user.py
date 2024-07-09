from fastapi import Depends, HTTPException
from sqlalchemy.orm import Session

from ...crud.user import get_user, get_users
from ...database import get_db
from ...schemas.user import User
from ..router import router


@router.get("/users/{user_id}", response_model=User)
def read_user(user_id: int, db: Session = Depends(get_db)):
    db_user = get_user(db, user_id)
    if db_user is None:
        raise HTTPException(status_code=404, detail="User not found")
    return db_user


@router.get("/users/", response_model=list[User])
def read_users(skip: int = 0, limit: int = 10, db: Session = Depends(get_db)):
    users = get_users(db, skip, limit)
    return users
