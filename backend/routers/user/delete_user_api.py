from fastapi import Depends
from sqlalchemy.orm import Session

from ...crud.user import delete_user
from ...database import get_db
from ...schemas.user import User
from ..router import router


@router.delete("/users/{user_id}", response_model=User)
def delete_user_api(user_id: int, db: Session = Depends(get_db)):
    return delete_user(db, user_id)
