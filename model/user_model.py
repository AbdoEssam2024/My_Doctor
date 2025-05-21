from sqlalchemy import Column, DateTime, Integer, String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True)
    username = Column(String(50))
    email = Column(String(50), unique=True)
    password = Column(String(60))
    token = Column(String(60))
    token_expires = Column(DateTime)
    verify_code = Column(Integer , nullable=False)
    verified = Column(Integer , default=0 , nullable=False)