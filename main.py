from fastapi import FastAPI
from routes.user_routes import router as user_router

import secrets

app = FastAPI()

SECRET_KEY = secrets.token_hex(32)  # يولّد مفتاح بطول 64 حرف (32 بايت)
print(SECRET_KEY)




app.include_router(
    router=user_router,
)