from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session

from ...crud.user import (
    create_user,
    delete_user,
    get_user,
    get_users,
    update_user
)
from ...database import get_db
from ...schemas.user import User, UserCreate

router = APIRouter()


@router.post("/users/", response_model=User)
def create_user_api(user: UserCreate, db: Session = Depends(get_db)):
    db_user = create_user(db=db, user=user)
    if db_user is None:
        raise HTTPException(status_code=404, detail="User creation failed")
    return db_user


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


@router.put("/users/{user_id}", response_model=User)
def update_user_api():
    return update_user


@router.delete("/users/{user_id}", response_model=User)
def delete_user_api(user_id: int, db: Session = Depends(get_db)):
    return delete_user(db, user_id)
