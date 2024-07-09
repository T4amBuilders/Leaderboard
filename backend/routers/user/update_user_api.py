from ...crud.user import update_user
from ...schemas.user import User
from ..router import router


@router.put("/users/{user_id}", response_model=User)
def update_user_api():
    return update_user
