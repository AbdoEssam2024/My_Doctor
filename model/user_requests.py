from pydantic import BaseModel

class LoginRequest(BaseModel):
    email: str
    password: str


class RegisterRequest(BaseModel):
    email: str
    password: str
    username: str


class UpdateRequest(BaseModel):
    username: str | None = None
    password: str | None = None
    email: str | None = None


class VerifyRequest(BaseModel):
    code: int