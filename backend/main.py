from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from routers import user_router
from database import init_db
import asyncio

app = FastAPI()

# Configure CORS to allow access
origins = [
    "http://localhost",
    "http://localhost:2256",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    # Indicates whether the server can respond to requests with the headers
    allow_credentials=True,
    # List of authorised HTTP methods (for example, GET, POST, etc.)
    allow_methods=["GET", "POST"],
    # List of authorised HTTP headers
    allow_headers=["*"],
)

@app.on_event("startup")
async def on_startup():
    await init_db()

app.include_router(user_router)

if __name__ == "__main__":
    asyncio.run(app.run_server(host="0.0.0.0", port=8000))
