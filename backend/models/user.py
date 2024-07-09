from passlib.context import CryptContext
from sqlalchemy import Column, Integer, String

from database import Base

# Instance de CryptContext pour le hachage des mots de passe
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String, unique=True, index=True)
    email = Column(String, unique=True, index=True)
    full_name = Column(String)
    password_hashed = Column(String)
    adresse = Column(String)
    phone = Column(String)

    # Méthode pour définir le mot de passe avec hachage
    def set_password(self, password):
        self.password_hashed = pwd_context.hash(password)

    # Méthode pour vérifier le mot de passe
    def verify_password(self, password):
        return pwd_context.verify(password, self.password_hashed)
