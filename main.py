from fastapi import FastAPI
from routes.user_routes import router as user_router

app = FastAPI()

app.include_router(
    router=user_router,
)