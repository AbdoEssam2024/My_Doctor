from sqlalchemy import Column , Integer , String , DateTime
from db_config import Base

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True)
    username = Column(String(50))
    password = Column(String(60))
    email = Column(String(50), unique=True)
    token = Column(String(60))
    token_expires = Column(DateTime)