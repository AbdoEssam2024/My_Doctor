from fastapi import APIRouter, Depends
from model.user_requests import LoginRequest, RegisterRequest, UpdateRequest
from controllers.user_controller import login, register, update_user, delete_user, get_user
from controllers.user_controller import hash_password
from controllers.user_controller import verify_token

router = APIRouter(tags=["User"], prefix="/user")

@router.post("/login")
async def login_user(request: LoginRequest):
    return login(request.email, request.password)


@router.post("/register")
async def register_user(request: RegisterRequest):
    return register(request.username, hash_password(request.password), request.email)


@router.put("/update_user/{user_id}", dependencies=[Depends(verify_token)])
async def update_user_info(user_id: int, request: UpdateRequest):
    if request.password:
        request.password = hash_password(request.password)

    return update_user(
        user_id, request.username , request.password , request.email
    )


@router.delete("/delete_user/{user_id}", dependencies=[Depends(verify_token)])
async def delete_user_info(user_id: int):
    return delete_user(user_id)


@router.get("/get_user/{user_id}", dependencies=[Depends(verify_token)])
async def get_user_info(user_id: int):
    return get_user(user_id)
