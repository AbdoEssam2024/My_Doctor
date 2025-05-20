from fastapi import Request, HTTPException
from db_config import session
from model.user_model import User
import bcrypt
from jose import jwt
from datetime import datetime, timedelta
from dotenv import load_dotenv
import os

load_dotenv()

SECRET_KEY = os.getenv("SECRET_KEY")
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE = timedelta(days=15)


# Create Access Token
def create_access_token(data: dict, expires_delta: timedelta = None):
    to_encode = data.copy()

    if expires_delta:
        expire = datetime.now() + expires_delta
    else:
        expire = datetime.now() + ACCESS_TOKEN_EXPIRE

    to_encode.update({"exp": expire})

    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt


# Hash Password
def hash_password(password: str):
    return bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt()).decode("utf-8")


# Check Password
def check_password(password: str, hashed_password: str):
    return bcrypt.checkpw(password.encode("utf-8"), hashed_password.encode("utf-8"))


# Verify Token
def verify_token(request: Request):
    token = request.headers["Authorization"].split(" ")[1]
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        return payload
    except Exception as e:
        raise HTTPException(status_code=401, detail=str(e))


# Login
def login(email: str, password: str):
    user = session.query(User).filter(User.email == email).first()

    if user:
        if check_password(password, user.password):
            session.close()
            access_token = create_access_token({"sub": user.email})
            if (user.token != access_token or user.token is None):
                update_user(user_id=user.id)

            response_data = {
                "status": "success",
                "name": user.username,
                "email": user.email,
                "token": access_token,
                "token_expires": ACCESS_TOKEN_EXPIRE,
            }

            session.close()
            return response_data
        else:
            session.close()
            return {"status": "error", "error": "Invalid password"}
    session.close()
    return {"status": "error", "error": "User not found"}


# Register
def register(username: str, password: str, email: str):
    access_token = create_access_token({"sub": email})
    exist_user = session.query(User).filter(User.email == email).first()
    if exist_user:
        session.close()
        return {"status": "error", "error": "User already exists"}
    user = User(
        username=username,
        password=password,
        email=email,
        token=access_token,
        token_expires=ACCESS_TOKEN_EXPIRE,
    )
    session.add(user)
    session.commit()

    session.close()
    return {
        "status": "success",
        "message": "User registered successfully",
        "token": access_token,
        "token_expires": ACCESS_TOKEN_EXPIRE,
    }


# Delete User
def delete_user(user_id: int):
    user = session.query(User).filter(User.id == user_id).first()
    if user:
        session.delete(user)
        session.commit()
        session.close()
        return {"status": "success", "message": "User deleted successfully"}
    session.close()
    return {"status": "error", "error": "User not found"}


# Update User
def update_user(
    user_id: int,
    username: str | None = None,
    password: str | None = None,
    email: str | None = None,
):
    try:
        user = session.query(User).filter(User.id == user_id).first()

        if not user:
            session.close()
            return {"status": "error", "error": "User not found"}

        if username is not None:
            user.username = username
        if password is not None:
            user.password = password
        if email is not None:
            user.email = email

        response_data = {
            "status": "success",
            "message": "User updated successfully",
            "user_id": user.id,
            "name": user.username,
            "email": user.email,
        }

        session.commit()
        session.close()
        return response_data
    except Exception as e:
        session.rollback()
        return {"status": "error", "error": str(e)}
    finally:
        print("Worked")
        session.close()


# Get User Info
def get_user(
    user_id: int
):
    user = session.query(User).filter(User.id == user_id).first()
    if user:
        response_data = {
            "status": "success",
            "user_id": user.id,
            "name": user.username,
            "email": user.email,
        }
        session.close()
        return response_data
    session.close()
    return {"status": "error", "error": "User not found"}
