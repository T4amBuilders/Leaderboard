# schemas.py
from pydantic import BaseModel


class UserBase(BaseModel):
    username: str
    email: str
    full_name: str


class UserCreate(UserBase):
    password: str
    adresse: str
    phone: str


class UserUpdate(UserBase):
    password: str
    adresse: str
    phone: str


class User(UserBase):
    id: int

    class Config:
        orm_mode = True
