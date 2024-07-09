from fastapi import Depends, HTTPException
from sqlalchemy.orm import Session

from ...crud.user import create_user
from ...database import get_db
from ...schemas.user import User, UserCreate
from ..router import router


@router.post("/users/", response_model=User)
def create_user_api(user: UserCreate, db: Session = Depends(get_db)):
    db_user = create_user(db=db, user=user)
    if db_user is None:
        raise HTTPException(status_code=404, detail="User creation failed")
    return db_user
